//
//  SimulatorViewController.swift
//  App
//
//  Created by Robson Moreira on 21/12/20.
//

import UIKit
import Presentation

class SimulatorViewController: UIViewController {
    
    @IBOutlet weak var textFieldValueApplied: UITextField!
    @IBOutlet weak var textFieldDueDate: UITextField!
    @IBOutlet weak var textFieldPercentage: UITextField!
    @IBOutlet weak var buttonSimulate: UIButton!
    @IBOutlet weak var viewBackgroundIndicator: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let datePickerDueDate = UIDatePicker()
    
    var activeTextField : UITextField? = nil
    var viewModel: SimulatorViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keyboarding Settings
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // DatePicker Settings
        if #available(iOS 14, *) {
            self.datePickerDueDate.preferredDatePickerStyle = .inline
        }
        self.datePickerDueDate.datePickerMode = .date
        self.datePickerDueDate.addTarget(self, action: #selector(self.doneDatePicker), for: .valueChanged)
        self.textFieldDueDate.inputView = self.datePickerDueDate

        // TextField Settings
        self.textFieldValueApplied.addTarget(self, action: #selector(self.textFieldDidChange(_ :)), for: .editingChanged)
        self.textFieldDueDate.addTarget(self, action: #selector(self.textFieldDidChange(_ :)), for: .editingChanged)
        self.textFieldPercentage.addTarget(self, action: #selector(self.textFieldDidChange(_ :)), for: .editingChanged)
        self.textFieldValueApplied.bottomBorder()
        self.textFieldDueDate.bottomBorder()
        self.textFieldPercentage.bottomBorder()
        self.buttonSimulate.isEnabled = false
        self.textFieldDueDate.delegate = self
        self.textFieldPercentage.delegate = self
        
        // Activity Indicator Settings
        self.viewBackgroundIndicator.isHidden = true
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
        
        // Init ViewModel
        self.viewModel = SimulatorViewModel()
        self.viewModel?.delegate = self
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.textFieldDueDate.text = formatter.string(from: self.datePickerDueDate.date)
        self.view.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == self.textFieldValueApplied, let string = textField.text?.currencyInputFormatting() {
            textField.text = string
        }
        
        if textField == self.textFieldPercentage, let string = textField.text?.percent() {
            textField.text = string
        }
        
        guard let textValueApplied = self.textFieldValueApplied.text, !textValueApplied.isEmpty else {
            self.buttonSimulate.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
            self.buttonSimulate.isEnabled = false
            
            return
        }

        guard let textDueDate = self.textFieldDueDate.text, !textDueDate.isEmpty else {
            self.buttonSimulate.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
            self.buttonSimulate.isEnabled = false
            
            return
        }

        guard let textPercentage = self.textFieldPercentage.text, !textPercentage.isEmpty else {
            self.buttonSimulate.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
            self.buttonSimulate.isEnabled = false
            
            return
        }

        self.buttonSimulate.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.7803921569, blue: 0.7019607843, alpha: 1)
        self.buttonSimulate.isEnabled = true
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        self.viewBackgroundIndicator.isHidden = false
        
        if let viewModel = self.viewModel {
            if let investedAmount = self.textFieldValueApplied.text {
                viewModel.investedAmount = investedAmount.removeFormatAmount()
            }
            
            if let maturityDate = self.textFieldDueDate.text {
                viewModel.maturityDate = maturityDate
            }
            
            if let rate = self.textFieldPercentage.text {
                viewModel.rate = Double(rate)
            }
            
            viewModel.getSimulation()
        }
    }
    
}
