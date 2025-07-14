import UIKit
import Kingfisher


class TravelTableViewController: UITableViewController {
    var travelInfo = TravelInfo()
    let colors: [UIColor] = [.blue, .green, .yellow, .cyan, .lightGray]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SeSAC Travel"

        let xib = UINib(nibName: "AdTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "AdTableViewCell")
        
        let cardTableViewCellXIB = UINib(nibName: "TravelCardTableViewCell", bundle: nil)
        tableView.register(cardTableViewCellXIB, forCellReuseIdentifier: "TravelCardTableViewCell")
        
        tableView.rowHeight = 164
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelData = travelInfo.travel[indexPath.row]
        
        if travelData.ad {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath)  as! AdTableViewCell
            // 광고
            adCell.setAdCellBackground(color: colors.randomElement() ?? .lightGray)
            adCell.setAdLabel(row: travelData)
            return adCell
        } else {
            let cardCell = tableView.dequeueReusableCell(withIdentifier: "TravelCardTableViewCell", for: indexPath)  as! TravelCardTableViewCell
            
            // title
            cardCell.setTitle(row: travelData)
            // description
            cardCell.setDescriptionLabel(row: travelData)
            // 평점 별
            cardCell.setRateStarImageView(row: travelData)
            // 리뷰자 및 저장 카운트
            cardCell.setReviewerAndSaveCountLabel(row: travelData)
            // 썸네일 이미지
            cardCell.setThumbnailImage(row: travelData)
            // 좋아요
            cardCell.setLikeButton(row: travelData, indexPathNum: indexPath.row) {
                cardCell.likeButton.addTarget(self, action: #selector(likedTapped), for: .touchUpInside)
            }
            return cardCell
        }
    }
    
    @objc func likedTapped(sender: UIButton) {
        travelInfo.travel[sender.tag].like?.toggle()
        tableView.reloadData()
       
    }
}
