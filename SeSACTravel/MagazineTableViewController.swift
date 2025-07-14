
import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    var magazineData: MagazineInfo = MagazineInfo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        title = "SeSAC TRAVEL"
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineData.magazine.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! MagazineTableViewCell
        
        let thumbnailUrl = URL(string: magazineData.magazine[indexPath.row].photo_image)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        if let convertDateType = dateFormatter.date(from: magazineData.magazine[indexPath.row].date) {
            dateFormatter.dateFormat = "yy년 MM월 dd일"
            let uploadDate = dateFormatter.string(from: convertDateType)
            cell.dateLabel.text = uploadDate
        }
        cell.thumbnailImageView.kf.setImage(with: thumbnailUrl)
        cell.titleLabel.text = magazineData.magazine[indexPath.row].title
        cell.subtitleLabel.text = magazineData.magazine[indexPath.row].subtitle
        cell.titleLabel.numberOfLines = 0
        cell.subtitleLabel.numberOfLines = 0
    
        return cell
    }
}

