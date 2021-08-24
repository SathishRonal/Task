//
//  Extension.swift
//  InfluxProject
//
//  Created by SathizMacMini on 03/08/21.
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



extension Data {
    public var bytes: [UInt8]
    {
        return [UInt8](self)
    }
    
    func jsonToData(json: AnyObject) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
}





