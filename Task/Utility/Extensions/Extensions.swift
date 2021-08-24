//
//
//  Extensions.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//

import Foundation
import UIKit
import NVActivityIndicatorView.Swift


extension UIViewController: NVActivityIndicatorViewable  {

    

    func showloader(_ show : Bool) {
        
        let size = CGSize(width: 70, height: 70)
        
        NVActivityIndicatorView.DEFAULT_COLOR = .red
        if show {
            
           
            self.startAnimating(size, message: "", messageFont: nil, type: .lineScalePulseOut)
            
        }else{
            
            self.stopAnimating(nil)
        }
    }

}









