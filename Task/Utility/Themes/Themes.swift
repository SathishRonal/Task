//
//  Themes.swift
//  InfluxProject
//
//  Created by SathizMacMini on 03/08/21.
//

import Foundation
import UIKit



class Themes: NSObject {

    static let instance=Themes()
    
    static func checkNull(_ val : Any?) -> String { return val is NSNull || val == nil ? "" : String(describing: val!) }
}


