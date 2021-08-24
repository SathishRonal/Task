//
//  AddVehicleViewModel.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//

import UIKit

class AddVehicleViewModel: NSObject {
    
    
    private(set) var responseDetails : AddVehicleModel!
    private(set) var loadApidata:AddVehicleModel! {didSet {self.reloadClosure()}}
    
    
    var reloadClosure : (() -> ()) = {}
    var loadingStatusClosure : ((_ status: Bool) -> ()) = {_ in }
    var alertClosure : ((_ error:String) -> ()) = {_ in}
    
    
    
    
    func loadPhotoAPi(_ params:[String:Any]) {
        
        DispatchQueue.main.async {
            self.loadingStatusClosure(true)
        }
        
        var  jsonData = NSData()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) as NSData
            // you can now cast it with the right type
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        guard let url = URL(string: BaseURL) else {return}
        var request        = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            request.httpBody   = try JSONSerialization.data(withJSONObject: params)
        } catch let error {
            print("Error : \(error.localizedDescription)")
        }
        
        
        
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
           
          
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                
                
                let responseData = try decoder.decode(AddVehicleModel.self, from: (data))
                self.responseDetails = responseData
                
                if self.responseDetails.status != 200 {
                    
                    NotifMessageHandler.sharedinstance.showErrorMessageWithTxt(msg: self.responseDetails.message ?? "")
                    return
                    
                }
              
                self.loadApidata = responseData
                dump(self.responseDetails)
                DispatchQueue.main.async {
                    self.loadingStatusClosure(false)
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.loadingStatusClosure(false)
                }
                self.alertClosure(Themes.checkNull(error))
                print(error.localizedDescription)
            }
            
        }.resume()
        
     
    }
    
    
}
