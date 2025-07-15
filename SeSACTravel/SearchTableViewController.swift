import UIKit


enum CityType: String, CaseIterable {
    case all = "모두"
    case domestic = "국내"
    case international = "해외"
}

class SearchTableViewController: UITableViewController {
    let cityInfo = CityInfo()
    var displayOnCitys: [City] = []
    var currentCategory: CityType = .all
    static let identifier: String = "SearchTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "인기 도시"
        let xib = UINib(nibName: SearchTableViewController.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SearchTableViewController.identifier)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayOnCitys.isEmpty ? cityInfo.city.count : displayOnCitys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewController.identifier, for: indexPath) as! SearchTableViewCell
        
        cell.configureCellUI(rowData: displayOnCitys.isEmpty ? cityInfo.city[indexPath.row]: displayOnCitys[indexPath.row] )
        
        return cell
    }
    
    

    @IBAction func segCategory(_ sender: UISegmentedControl) {
        print(#function, sender.selectedSegmentIndex)
        let index = sender.selectedSegmentIndex
        currentCategory = CityType.allCases[index]
        
        switch currentCategory {
        case CityType.all:
            displayOnCitys = cityInfo.city
            tableView.reloadData()
        case CityType.domestic:
            displayOnCitys = cityInfo.city.filter { $0.domestic_travel == true }
            tableView.reloadData()
        case CityType.international:
            displayOnCitys = cityInfo.city.filter { $0.domestic_travel == false }
            tableView.reloadData()
        default:
            displayOnCitys = cityInfo.city
            break
        }
    }
}
