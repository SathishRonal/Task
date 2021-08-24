//
//
//  Themes.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//
import Foundation
import UIKit



class Themes: NSObject {

    static let instance=Themes()
    
    static func checkNull(_ val : Any?) -> String { return val is NSNull || val == nil ? "" : String(describing: val!) }
    
    func checkMsgCount(PassedValue: String,Title: String) -> Bool{
        print("PassedValue",PassedValue)
        guard PassedValue.count>0 else {
            NotifMessageHandler.sharedinstance.showErrorMessageWithTxt(msg:"Kindly,Select the " + Title + " field..")
            return false
        }
        return true
    }
    func clearAllData() -> String{
      return ""
    }
}


