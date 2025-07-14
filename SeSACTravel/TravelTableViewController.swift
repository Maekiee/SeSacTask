import UIKit
import Kingfisher


class TravelTableViewController: UITableViewController {
    var travelInfo = TravelInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SeSAC Travel"
        tableView.rowHeight = 164
        
        
        let xib = UINib(nibName: "AdTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "AdTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 분기처리별 타입 캐스팅
        let travelData = travelInfo.travel[indexPath.row]
        
        let adCell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath)  as! AdTableViewCell
        let cardCell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)  as! TravelTableViewCell
        
        
        // 썸네일 이미지
        let thumbnailUrl = URL(string: travelInfo.travel[indexPath.row].travel_image ?? "")
        cardCell.thumbnailImageView.kf.setImage(with: thumbnailUrl, placeholder: UIImage(named: "comming_soon"))
        
        // 타이틀
        cardCell.titleLabel.text = travelData.title
        cardCell.descriptionLabel.text = travelData.description
        
        // 평점 별
        if let grade = travelData.grade {
            let gradePoint = Double(grade)
            for (index, imageView) in cardCell.starImageViews.enumerated() {
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
            cardCell.starImageViews.forEach { $0.image = UIImage(systemName: "star") }
        }
        
        // 저장 및 리뷰작성자 수
        if let reviewer = travelData.reviewers,
           let saved = travelData.save {
            let reviewerString = formatNumber(num: reviewer)
            let savedString = formatNumber(num: saved)
            cardCell.countsLabel.text = "(\(reviewerString)) · 저장 \(savedString)"
        } else {
            cardCell.countsLabel.text = ""
        }
        
        // 좋아요
        if let isLiked = travelData.like {
            cardCell.likeButton.isHidden = false
            cardCell.likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
            cardCell.likeButton.addTarget(self, action: #selector(likedTapped), for: .touchUpInside)
            cardCell.likeButton.tag = indexPath.row
            cardCell.likeButton.tintColor = isLiked ? .red : .white
        } else {
            cardCell.likeButton.isHidden = true
        }
        
        adCell.adLabel.text = "광고 입니다 광고 광고 광고 광고 광고"
        
        if indexPath.row % 4 == 0 {
            return adCell
        } else {
            return cardCell
        }
       
//        return cardCell
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
