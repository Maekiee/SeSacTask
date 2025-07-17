import UIKit

class PopularCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentedCategory: UISegmentedControl!
    @IBOutlet var myCollectionView: UICollectionView!
    static let cellIdentifier: String = "PopularCollectionViewCell"
    let cityList = CityInfo().city
    
    var displayOnCityList: [City] = [] {
        didSet {
            myCollectionView.reloadData()
        }
    }
    var currentCategory: CityType = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    func configure() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let xib = UINib(nibName: PopularCollectionViewController.cellIdentifier, bundle: nil)
        myCollectionView.register(xib, forCellWithReuseIdentifier: PopularCollectionViewController.cellIdentifier)
        
        displayOnCityList = cityList
        
        // 셀의 높이 밑 너비
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (20 * 2) - 20
        layout.itemSize = CGSize(width: cellWidth/2, height: cellWidth/2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        myCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayOnCityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cityItem = displayOnCityList[indexPath.item]
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewController.cellIdentifier, for: indexPath) as! PopularCollectionViewCell
        
        cell.setConfig(cityItem: cityItem)
        
        return cell
    }
    
    
    
    @IBAction func categorySegTapped(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        currentCategory = CityType.allCases[index]
        switch currentCategory {
        case CityType.all:
            displayOnCityList = cityList
        case CityType.domestic:
            displayOnCityList = cityList.filter { $0.domestic_travel }
        case CityType.international:
            displayOnCityList = cityList.filter { !$0.domestic_travel }
        }
        
    }
    
}
