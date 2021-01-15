//
//  UITextFieldExtension.swift
//  App
//
//  Created by Robson Moreira on 14/01/21.
//

import UIKit

extension UITextField {
    
    func bottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width - 40, height: 1)
        bottomLine.backgroundColor = UIColor.systemGray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
    
}
