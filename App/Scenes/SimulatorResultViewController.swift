//
//  SimulatorResultViewController.swift
//  App
//
//  Created by Robson Moreira on 22/12/20.
//

import UIKit
import Presentation

class SimulatorResultViewController: UIViewController {
    
    @IBOutlet weak var grossAmount: UILabel!
    @IBOutlet weak var appliedAmount: UILabel!
    @IBOutlet weak var grossInvestmentAmount: UILabel!
    @IBOutlet weak var grossAmountProfit: UILabel!
    @IBOutlet weak var taxesAmount: UILabel!
    @IBOutlet weak var netAmount: UILabel!
    @IBOutlet weak var redemptionDate: UILabel!
    @IBOutlet weak var maturityTotalDays: UILabel!
    @IBOutlet weak var monthlyGrossRateProfit: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var annualGrossRateProfit: UILabel!
    @IBOutlet weak var rateProfit: UILabel!
    
    var viewModel: SimulatorResultViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = self.viewModel {
            self.grossAmount.text = viewModel.grossAmount?.currencyInputFormatting()
            self.appliedAmount.text = viewModel.appliedAmount?.currencyInputFormatting()
            self.grossInvestmentAmount.text = viewModel.grossAmount?.currencyInputFormatting()
            self.grossAmountProfit.text = viewModel.grossAmountProfit?.currencyInputFormatting()
            self.taxesAmount.text = self.formatTaxes(viewModel: viewModel)
            self.netAmount.text = viewModel.netAmount?.currencyInputFormatting()
            self.redemptionDate.text = viewModel.redemptionDate
            self.maturityTotalDays.text = viewModel.maturityTotalDays
            self.monthlyGrossRateProfit.text = viewModel.monthlyGrossRateProfit
            self.rate.text = viewModel.rate
            self.annualGrossRateProfit.text = viewModel.annualGrossRateProfit
            self.rateProfit.text = viewModel.rateProfit
        }
    }
    
    fileprivate func formatTaxes(viewModel: SimulatorResultViewModel) -> String? {
        if let taxesAmount = viewModel.taxesAmount, let taxesRate = viewModel.taxesRate {
            return "\(taxesAmount.currencyInputFormatting())(\(taxesRate)%)"
        }
        return "R$ 0,00(0%)"
    }

    @IBAction func simulateAgain(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
