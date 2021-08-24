//
//  AddVehicleViewController.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//

import UIKit

protocol getVechileDetails: class {
    func selectDetailforVechile(selectPickerItem:Int,didselectindex:Int)
}

class AddVehicleViewController: UIViewController {
    
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var pickerViewBg: UIView!
    weak var delegate: getVechileDetails?
    
    var loadDetails : AddVehicleViewModel!
    var selectPickerItem = Int()
    var didselectindex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.reloadPickerView()
        // Do any additional setup after loading the view.
    }
    
    
    
    func initialSetup() {
        self.pickerViewBg.alpha = 1
       
        
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        view.isOpaque = false
      //  BaseView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.backgroundColor = UIColor(white:0,alpha: 0.6)
       // self.animateAlert()
        
    }

    
    
    
    @IBAction func didClickDone(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.pickerViewBg.alpha = 0
            self.delegate?.selectDetailforVechile(selectPickerItem: self.selectPickerItem, didselectindex: self.didselectindex)
        }
        
    }
    
    
    @IBAction func didClickCancel(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.pickerViewBg.alpha = 0
            if Themes.instance.checkMsgCount(PassedValue: "", Title: "we"){
                
            }
            self.dismiss(animated: false, completion: nil)
        }
    }
   
    
}


//MARK: - PickerView
extension AddVehicleViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func reloadPickerView(){
        DispatchQueue.main.async(){
            UIView.animate(withDuration: 0.5) {
                self.pickerViewBg.alpha = 1
                
                self.PickerView.dataSource = self
                self.PickerView.delegate = self
                self.PickerView.reloadAllComponents()
               
            }
        }
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("PickerView")
        switch selectPickerItem {
        case 1:
            return self.loadDetails.responseDetails.vehicle_type?.count ?? 0
        case 2:
            return self.loadDetails.responseDetails.vehicle_capacity?.count ?? 0
        case 3:
            return self.loadDetails.responseDetails.vehicle_make?.count ?? 0
        case 4:
            return self.loadDetails.responseDetails.manufacture_year?.count ?? 0
        case 5:
            return self.loadDetails.responseDetails.fuel_type?.count ?? 0
            
        default: break
            
        }
        return 0
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("PickerView")
        didselectindex = row
        switch selectPickerItem {
        case 1:
            return self.loadDetails.responseDetails.vehicle_type?[row].text
        case 2:
            return self.loadDetails.responseDetails.vehicle_capacity?[row].text
        case 3:
            return self.loadDetails.responseDetails.vehicle_make?[row].text
        case 4:
            return self.loadDetails.responseDetails.manufacture_year?[row].text
        case 5:
            return self.loadDetails.responseDetails.fuel_type?[row].text
        default: break
            
        }
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
}
