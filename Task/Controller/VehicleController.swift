import UIKit
import SDWebImage
class VehicleController: UIViewController,QRCodeScanner,getVechileDetails {
    
    
    
    @IBOutlet weak var imeiView: UIView!
    @IBOutlet weak var tagNameView: UIView!
    @IBOutlet weak var regNumberView: UIView!
    @IBOutlet weak var vehicleTypeCollectionView: UICollectionView!
    @IBOutlet weak var stackViewHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addMoreBtn: UIButton!
    @IBOutlet weak var OTP1: UITextField!
    @IBOutlet weak var OTP2: UITextField!
    @IBOutlet weak var OTP3: UITextField!
    @IBOutlet weak var OTP4: UITextField!
    @IBOutlet weak var OTP5: UITextField!
    @IBOutlet weak var OTP6: UITextField!
    @IBOutlet weak var IMEITxt: UITextField!
    @IBOutlet weak var tagNameTxt: UITextField!
    @IBOutlet weak var registerNoTXT: UITextField!
    @IBOutlet weak var vechileNameTxt: UITextField!
    @IBOutlet weak var vehicleMakeTxt: UITextField!
    @IBOutlet weak var vehicleYearTxt: UITextField!
    @IBOutlet weak var vehicleFuelTxt: UITextField!
    @IBOutlet weak var vehicleLevelTxt: UITextField!
    @IBOutlet weak var ownBtn: UIButton!
    @IBOutlet weak var contractorBtn: UIButton!
    
    
    var TextFieldArray = [UITextField]()
    var loadDetails : AddVehicleViewModel!
    var isExpanded = Bool()
    var totalCount = 4
    var selectedOwnerShip = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.TextFieldArray = [self.OTP1,self.OTP2,self.OTP3,self.OTP4,self.OTP5,self.OTP6]
        selectedOwnerShip = "Own"
    }
    
    func initialSetup() {
        self.loadDetails = AddVehicleViewModel()
        self.loadDetails.reloadClosure = {self.reloadData() }
        self.loadDetails.loadingStatusClosure = { [unowned self] status in self.loaderAction(status) }
        self.loadApiCall()
        self.setupStatusBar()
    }
    func setupStatusBar(){
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        let statusBar = UIView(frame:(keyWindow?.windowScene?.statusBarManager!.statusBarFrame)!)
        
        statusBar.backgroundColor = AppThemeColor
        
        keyWindow?.addSubview(statusBar)
    }
    
}



//MARK: - Button Action
extension VehicleController{
    @IBAction func didClickScanView(_ sender: Any) {
        self.moveToScan()
    }
    
    @IBAction func didClickVechileName(_ sender: Any) {
        self.moveToVechileList(index: 1)
    }
    
    @IBAction func didClickSubVechileName(_ sender: Any) {
        self.moveToVechileList(index: 3)
    }
    @IBAction func didClickOwn(_ sender: Any) {
        
        self.contractorBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        self.ownBtn.setImage(UIImage(named: "radioOn"), for: .normal)
    }
    
    @IBAction func didClickContractor(_ sender: Any) {
        
        self.ownBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        self.contractorBtn.setImage(UIImage(named: "radioOn"), for: .normal)
        
    }
    
    @IBAction func didClickLevel(_ sender: Any) {
        self.moveToVechileList(index: 2)
    }
    @IBAction func didClickFuel(_ sender: Any) {
        self.moveToVechileList(index: 5)
    }
    @IBAction func didClickYear(_ sender: Any) {
        self.moveToVechileList(index: 4)
    }
    
    @IBAction func didClickRefresh(_ sender: Any) {
        self.refreshAllData()
    }
    
    
    func refreshAllData(){
        
        self.IMEITxt.text =    Themes.instance.clearAllData()
        self.tagNameTxt.text =    Themes.instance.clearAllData()
        self.registerNoTXT.text =    Themes.instance.clearAllData()
        self.vechileNameTxt.text =    Themes.instance.clearAllData()
        self.vehicleYearTxt.text =    Themes.instance.clearAllData()
        self.vehicleLevelTxt.text =    Themes.instance.clearAllData()
        self.vehicleMakeTxt.text =    Themes.instance.clearAllData()
        self.vehicleFuelTxt.text =    Themes.instance.clearAllData()
        self.OTP1.text =    Themes.instance.clearAllData()
        self.OTP2.text =    Themes.instance.clearAllData()
        self.OTP3.text =    Themes.instance.clearAllData()
        self.OTP4.text =    Themes.instance.clearAllData()
        self.OTP5.text =    Themes.instance.clearAllData()
        self.OTP6.text =    Themes.instance.clearAllData()
        NotifMessageHandler.sharedinstance.showSuccessMessageWithTxt(msg:"SuccessFully Refresh..")
    }
    
   
    @IBAction func addMoreBtnAction(_ sender: Any) {
        if Themes.instance.checkMsgCount(PassedValue: self.IMEITxt.text!, Title: "IMEI") && Themes.instance.checkMsgCount(PassedValue: self.tagNameTxt.text!, Title: "Tag Name") && Themes.instance.checkMsgCount(PassedValue: self.registerNoTXT.text!, Title: "Register Name") && Themes.instance.checkMsgCount(PassedValue: self.vechileNameTxt.text!, Title: "Vehicle Type") && Themes.instance.checkMsgCount(PassedValue: self.vehicleMakeTxt.text!, Title: "Vehicle Model") && Themes.instance.checkMsgCount(PassedValue: self.vehicleYearTxt.text!, Title: "Vehicle Year") && Themes.instance.checkMsgCount(PassedValue: self.vehicleLevelTxt.text!, Title: "Vehicle Level") && Themes.instance.checkMsgCount(PassedValue: self.vehicleFuelTxt.text!, Title: "Vehicle Fuel") {
            
            NotifMessageHandler.sharedinstance.showSuccessMessageWithTxt(msg:"Successfully Add the Vehicle...")
            self.refreshAllData()
        }
    }
    
    func expand(){
        isExpanded = true
        totalCount = self.loadDetails.responseDetails.vehicle_type?.count ?? 0 + 1
        
        
        print(Double(self.totalCount / 3))
        UIView.animate(withDuration: 0.5) {
            self.stackViewHeightAnchor.constant = CGFloat((Double(self.totalCount / 3)) * Double(80))
            self.collectionViewHeight.constant  = CGFloat((Double(self.totalCount / 3)) * Double(80))
            self.view.layoutIfNeeded()
            DispatchQueue.main.async {
                self.vehicleTypeCollectionView.reloadData()
            }
        }
    }
    
    func collapse(){
        isExpanded = false
        totalCount = 4
        UIView.animate(withDuration: 0.5) {
            self.stackViewHeightAnchor.constant = 90
            self.collectionViewHeight.constant  = 90
            self.view.layoutIfNeeded()
            DispatchQueue.main.async {
                self.vehicleTypeCollectionView.reloadData()
            }
        }
    }
}



//MARK: - UICollectionView
extension VehicleController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = vehicleTypeCollectionView.VehicleTypeCell (for: indexPath)
        if indexPath.item == totalCount - 1{
            cell.contentsView.isHidden = true
            cell.moreView.isHidden = false
            cell.moreImgView.image = isExpanded ? UIImage(named: "Minus") : UIImage(named: "Plus")
            cell.moreView.layer.cornerRadius = 10
            cell.moreLbl.text = isExpanded ? "Less" : "More"
        }else{
            cell.contentsView.isHidden = false
            cell.moreView.isHidden = true
            cell.vehicleImgView.sd_setImage(with: URL(string:  Themes.checkNull(self.loadDetails.responseDetails.vehicle_type?[indexPath.item].images)), placeholderImage: UIImage(named: "Vehicle"))
            cell.contentsView.backgroundColor = .clear
            cell.vehicleTypeLbl.text = Themes.checkNull(self.loadDetails.responseDetails.vehicle_type?[indexPath.item].text)
        }
        
        return cell
    }
    
}


extension VehicleController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == totalCount - 1{
            isExpanded ? collapse() : expand()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize = CGSize(width: (collectionView.bounds.width / 4 - 10), height: 98)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return sectionInset
    }
}



//MARK: -  ApiCall
extension VehicleController{
    func loadApiCall() {
        let params = ["clientid":"11",
                      "enterprise_code":"1007",
                      "mno":"9889897789",
                      "passcode":"3476"]
        
        self.loadDetails.loadPhotoAPi(params as [String:Any] )
        
    }
    func reloadData() {
        
        
        if self.loadDetails.responseDetails.status != 200 {
            NotifMessageHandler.sharedinstance.showErrorMessageWithTxt(msg: self.loadDetails.responseDetails.message ?? "")
            
            return
        }
        self.setupNib()
    }
    
    func loaderAction(_ status:Bool) {
        DispatchQueue.main.async {
            status == false ?  self.showloader(false) :  self.showloader(true)
        }
    }
    
    func setupNib(){
        DispatchQueue.main.async {
            self.vehicleTypeCollectionView.registerCells([.VehicleTypeCell])
            self.vehicleTypeCollectionView.delegate = self
            self.vehicleTypeCollectionView.dataSource = self
        }
        
    }
    
    
    
}

//MARK: - QRScanner Module
extension VehicleController{
    
    func moveToScan(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: QRScannerController = storyboard.instantiateViewController(withIdentifier: "QRScannerControllerVCID") as! QRScannerController
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func moveToVechileList(index:Int){
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddVehicleViewControllerVCID") as! AddVehicleViewController
        vc.selectPickerItem =   index
        vc.loadDetails = self.loadDetails
        vc.delegate = self
        vc.modalPresentationStyle = .popover
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false  , completion: nil)
    }
    func selectDetailforVechile(selectPickerItem: Int, didselectindex: Int) {
        switch selectPickerItem {
        case 1:
            vechileNameTxt.text = Themes.checkNull(self.loadDetails.responseDetails.vehicle_type?[didselectindex].text)
        case 2:
            vehicleLevelTxt.text = Themes.checkNull(self.loadDetails.responseDetails.vehicle_capacity?[didselectindex].text)
            
        case 3:
            vehicleMakeTxt.text = Themes.checkNull(self.loadDetails.responseDetails.vehicle_make?[didselectindex].text)
            
        case 4:
            
            vehicleYearTxt.text = Themes.checkNull(self.loadDetails.responseDetails.manufacture_year?[didselectindex].text)
            
        case 5:
            vehicleFuelTxt.text = Themes.checkNull(self.loadDetails.responseDetails.fuel_type?[didselectindex].text)
        default: break
            
        }
        self.dismiss(animated: false, completion: nil)
    }
    func QRCodeScannervalue(dataString: NSString) {
        print("DataString Value",dataString)
        NotifMessageHandler.sharedinstance.showSuccessMessageWithTxt(msg:"QR Code Scanned Successfully!..")
        IMEITxt.text = Themes.checkNull(dataString)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
//MARK: - UITextField
extension VehicleController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let initiallyEmpty = textField.text == "" ? true:false
        
        if (textField.text?.count ?? 0 < 1) || (string == ""){
            textField.text = string
        }
        if string != "" {
            for i in 0..<TextFieldArray.count {
                
                if i > textField.tag {
                    
                    let textfield = TextFieldArray[i]
                    
                    if textfield.text == "" {
                        textfield.becomeFirstResponder()
                        if initiallyEmpty == false {
                            textfield.text = string
                        }
                        break
                    }
                }
            }
        }else{
            if textField.tag > 0 {
                let textfield = TextFieldArray[textField.tag-1]
                textfield.becomeFirstResponder()
            }
        }
        return false
    }
}
