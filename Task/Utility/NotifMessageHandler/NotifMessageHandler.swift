//
//
//  NotifMessageHandler.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//

import UIKit
import SwiftMessages
//import SKToast

class NotifMessageHandler: NSObject {
    static let sharedinstance=NotifMessageHandler()
     
    func showSuccessMessageWithTxt(msg:String){
        guard msg.count>0 else {
            return
        }
        let convertedMsg = msg
       //// convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
        let success = MessageView.viewFromNib(layout: .messageView)
        success.configureTheme(.success)
        success.backgroundView.backgroundColor = SuccessBG
        success.configureDropShadow()
        success.configureContent(title: "", body: convertedMsg)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
         SwiftMessages.show(config: successConfig, view: success)
    }
    
    func showErrorMessageWithTxt(msg:String){
        guard msg.count>0 else {
            return
        }
        let convertedMsg = msg
        //convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
        let error = MessageView.viewFromNib(layout: .messageView)
        error.configureTheme(.error)
        error.backgroundView.backgroundColor = UIColor.red
        error.configureDropShadow()
        error.configureContent(title: "Info!", body: convertedMsg)
        error.button?.isHidden = true
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationStyle = .top
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: errorConfig, view: error)
    }
}
