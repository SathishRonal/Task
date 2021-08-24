import UIKit

class VehicleController: UIViewController {

    @IBOutlet weak var imeiView: UIView!
    @IBOutlet weak var tagNameView: UIView!
    @IBOutlet weak var regNumberView: UIView!
    @IBOutlet var imeiDigitsViews: [UIView]!
    @IBOutlet weak var vehicleTypeCollectionView: UICollectionView!
    @IBOutlet weak var viewMoreBtn: UIButton!
    @IBOutlet weak var stackViewHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addMoreBtn: UIButton!
    var isExpanded = Bool()
    var totalCount = 3
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStatusBar()
        setupUI()
        setupNib()
    }
    
    @IBAction func viewMoreBtnAction(_ sender: UIButton) {
        isExpanded = true
        totalCount = 10
        
        viewMoreBtn.isHidden = true
        
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
    
    @IBAction func addMoreBtnAction(_ sender: Any) {
        
    }
    func setupNib(){
        let vehicleNib = UINib(nibName: "VehicleTypeCell", bundle: nil)
        vehicleTypeCollectionView.register(vehicleNib, forCellWithReuseIdentifier: "VehicleTypeCellID")
        vehicleTypeCollectionView.delegate = self
        vehicleTypeCollectionView.dataSource = self
        
    }
    func setupStatusBar(){
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        let statusBar = UIView(frame:(keyWindow?.windowScene?.statusBarManager!.statusBarFrame)!)
        
        statusBar.backgroundColor = UIColor.red
        
        keyWindow?.addSubview(statusBar)
    }
    
    func setupUI(){
        addBorders(imeiView)
        addBorders(tagNameView)
        addBorders(regNumberView)
        imeiDigitsViews.compactMap {
            addBorders($0)
        }
    }
    
    func addBorders(_ view:UIView){
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.gray.cgColor
    }
}


extension VehicleController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vehicleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleTypeCellID", for: indexPath) as! VehicleTypeCell
        return vehicleCell
    }
}


extension VehicleController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize = CGSize(width: (collectionView.bounds.width - (3 * 10))/3, height: 80)
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
