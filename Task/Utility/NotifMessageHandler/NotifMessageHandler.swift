//
//  NotifMessageHandler.swift
//  InfluxProject
//
//  Created by SathizMacMini on 03/08/21.
//

import UIKit
import SwiftMessages
//import SKToast

class NotifMessageHandler: NSObject {
    static let sharedinstance=NotifMessageHandler()
     func showSuccessMessageWithTxt1(msg:String){
        guard msg.count>0 else {
             return
         }
         let convertedMsg = msg
        //// convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
         let success = MessageView.viewFromNib(layout: .messageView)
         success.configureTheme(.success)
         success.backgroundView.backgroundColor = AppThemeColor
         success.configureDropShadow()
         success.configureContent(title: "", body: convertedMsg)
         success.button?.isHidden = true
         var successConfig = SwiftMessages.defaultConfig
         successConfig.presentationStyle = .top
         successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
          SwiftMessages.show(config: successConfig, view: success)
        
    }
    func showSuccessMessageWithTxt(msg:String){
        guard msg.count>0 else {
            return
        }
        let convertedMsg = msg
       //// convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
        let success = MessageView.viewFromNib(layout: .messageView)
        success.configureTheme(.success)
        success.backgroundView.backgroundColor = AppThemeColor
        success.configureDropShadow()
        success.configureContent(title: "", body: convertedMsg)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        // SwiftMessages.show(config: successConfig, view: success)
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
    
    func showWarningMessageWithTxt(msg:String){
        guard msg.count>0 else {
            return
        }
        let convertedMsg = msg
       // convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
        let Warning = MessageView.viewFromNib(layout: .messageView)
        Warning.configureTheme(.warning)
      //   Warning.backgroundView.backgroundColor = BottomGradiantColor
        Warning.configureDropShadow()
        Warning.configureContent(title: "", body: convertedMsg)
        Warning.button?.isHidden = true
        var WarningConfig = SwiftMessages.defaultConfig
        WarningConfig.presentationStyle = .top
        WarningConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: WarningConfig, view: Warning)
    }
    
    func showInfoMessageWithTxt(msg:String){
        guard msg.count>0 else {
            return
        }
        let convertedMsg = msg
      //  convertedMsg = (JJLocalizedString(key: convertedMsg as Any, comment: "") as? String)!
        let Info = MessageView.viewFromNib(layout: .messageView)
        Info.configureTheme(.info)
       //  Info.backgroundView.backgroundColor = BottomGradiantColor
        Info.configureDropShadow()
        Info.configureContent(title: "", body: convertedMsg)
        Info.button?.isHidden = true
        var InfoConfig = SwiftMessages.defaultConfig
        InfoConfig.presentationStyle = .top
        InfoConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: InfoConfig, view: Info)
    }
    
    func showToastMessage(msgStr:String){
//        SKToast.show(withMessage: msgStr) {
//        }
    }
}
