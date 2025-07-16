
import UIKit

class PopularCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var categorySegmentedControl: UISegmentedControl!
    @IBOutlet var populerCityTableView: UITableView!
    
    let cityList = CityInfo().city
    var displayOnCityList: [City] = []
    var currentCategory: CityType = .all
    static let identifier: String = "PopularCityTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        title = "인기 도시"
        let xib = UINib(nibName: PopularCityViewController.identifier, bundle: nil)
        populerCityTableView.register(xib, forCellReuseIdentifier: PopularCityViewController.identifier)
        populerCityTableView.delegate = self
        populerCityTableView.dataSource = self
        displayOnCityList = cityList
        populerCityTableView.rowHeight = 200
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayOnCityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityRow = displayOnCityList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityViewController.identifier, for: indexPath) as! PopularCityTableViewCell
        
        
        cell.configureCell(cityData: cityRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    
    @IBAction func segmentedCityCategoryControl(_ sender: UISegmentedControl) {
        print(#function)
        let index = sender.selectedSegmentIndex
        currentCategory = CityType.allCases[index]
        
        switch currentCategory {
        case CityType.all:
            displayOnCityList = cityList
            populerCityTableView.reloadData()
        case CityType.domestic:
            displayOnCityList = cityList.filter { $0.domestic_travel }
            populerCityTableView.reloadData()
        case CityType.international:
            displayOnCityList = cityList.filter { !$0.domestic_travel }
            populerCityTableView.reloadData()
        default:
            displayOnCityList = cityList
            break
        }
    }
    


}
