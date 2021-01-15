//
//  SimulatorViewControllerExtensions.swift
//  App
//
//  Created by Robson Moreira on 15/01/21.
//

import UIKit
import Presentation

extension SimulatorViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.textFieldPercentage {
            self.activeTextField = textField
        }
        
        if textField == self.textFieldDueDate {
            self.buttonSimulate.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.textFieldPercentage {
            self.activeTextField = nil
        }
        
        if textField == self.textFieldDueDate {
            self.buttonSimulate.isHidden = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText)
        else {return false}
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 6
    }
    
}

extension SimulatorViewController : SimulatorViewModelDelegate {
    
    func success(_ viewModel: SimulatorResultViewModel) {
        DispatchQueue.main.async {
            self.viewBackgroundIndicator.isHidden = true
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            
            self.textFieldValueApplied.becomeFirstResponder()
            
            let viewController = SimulatorResultViewController()
            viewController.viewModel = viewModel
            self.present(viewController, animated: true) {
                self.textFieldValueApplied.text = ""
                self.textFieldDueDate.text = ""
                self.textFieldPercentage.text = ""
            }
        }
    }
    
    func errorData(_ error: NSError) {
        DispatchQueue.main.async {
            self.viewBackgroundIndicator.isHidden = true
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            
            let alert = UIAlertController(title: "Erro", message: error.debugDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
