import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    var travelInfo = TravelInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SeSAC Travel"
        tableView.rowHeight = 164
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! TravelTableViewCell
        
        // 썸네일 이미지
        let thumbnailUrl = URL(string: travelInfo.travel[indexPath.row].travel_image ?? "")
        cell.thumbnailImageView.kf.setImage(with: thumbnailUrl, placeholder: UIImage(named: "comming_soon"))
        
        // 타이틀
        cell.titleLabel.text = travelInfo.travel[indexPath.row].title
        cell.descriptionLabel.text = travelInfo.travel[indexPath.row].description
        
        // 평점 별
        if let grade = travelInfo.travel[indexPath.row].grade {
            let gradePoint = Double(grade)
            for (index, imageView) in cell.starImageViews.enumerated() {
                let starPoint = Double(index )
                
                if gradePoint >= starPoint + 1{
                    imageView.image = UIImage(systemName: "star.fill")
                } else if gradePoint > starPoint {
                    imageView.image = UIImage(systemName: "star.leadinghalf.filled")
                } else {
                    imageView.image = UIImage(systemName: "star")
                }
            }
        } else {
            cell.starImageViews.forEach { $0.image = UIImage(systemName: "star") }
        }
        
        // 저장 및 리뷰작성자 수
        if let reviewer = travelInfo.travel[indexPath.row].reviewers,
           let saved = travelInfo.travel[indexPath.row].save {
            let reviewerString = formatNumber(num: reviewer)
            let savedString = formatNumber(num: saved)
            cell.countsLabel.text = "(\(reviewerString)) · 저장 \(savedString)"
        } else {
            cell.countsLabel.text = ""
        }
        
        // 좋아요
        if let isLiked = travelInfo.travel[indexPath.row].like {
            cell.likeButton.isHidden = false
            cell.likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
            cell.likeButton.addTarget(self, action: #selector(likedTapped), for: .touchUpInside)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = isLiked ? .red : .white
        } else {
            cell.likeButton.isHidden = true
        }
       
        return cell
    }
    
    @objc func likedTapped(sender: UIButton) {
        travelInfo.travel[sender.tag].like?.toggle()
        tableView.reloadData()
       
    }
    
    // 넘버 포맷
    func formatNumber (num number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let numberString = numberFormatter.string(from: NSNumber(value: number)) {
            return numberString
        } else {
            return "0"
        }
    }
    
    

    


}
