import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    var travelList = TravelInfo().travel
    let colors: [UIColor] = [.blue, .green, .yellow, .cyan, .lightGray]
    let sb = UIStoryboard(name: "Main", bundle: nil)
    static let adIdentifier: String = "AdTableViewCell"
    static let travelCardIdentifier: String = "TravelCardTableViewCell"
    static let adDetailIdentifier: String = "AdDetailViewController"
    static let tourSpotIdentifier: String = "TourSpotViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SeSAC Travel"

        let xib = UINib(nibName: TravelTableViewController.adIdentifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TravelTableViewController.adIdentifier)
    
        let cardTableViewCellXIB = UINib(nibName: TravelTableViewController.travelCardIdentifier, bundle: nil)
        tableView.register(cardTableViewCellXIB, forCellReuseIdentifier: TravelTableViewController.travelCardIdentifier)
        tableView.rowHeight = 164
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelData = travelList[indexPath.row]
        
        if travelData.ad {
            let adCell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewController.adIdentifier, for: indexPath)  as! AdTableViewCell
            // 광고
            adCell.setAdCellBackground(color: colors.randomElement() ?? .lightGray)
            adCell.setAdLabel(row: travelData)
            return adCell
        } else {
            let cardCell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewController.travelCardIdentifier, for: indexPath)  as! TravelCardTableViewCell
            
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travelData = travelList[indexPath.row]
        let vc = sortViewController(travelData.ad)
        if travelData.ad {
            let myAdViewController = vc as! AdDetailViewController
            myAdViewController.modalPresentationStyle = .fullScreen
            myAdViewController.adText = travelData.title ?? ""
            present(vc, animated: true)
        } else {
            let myViewController = vc as! TourSpotViewController
            myViewController.travelTitle = travelData.title ?? ""
            myViewController.travelDescription = travelData.description ?? ""
            myViewController.imageUrl = travelData.travel_image ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func likedTapped(sender: UIButton) {
        travelList[sender.tag].like?.toggle()
        tableView.reloadData()
       
    }
    
    func sortViewController(_ isAd: Bool) -> UIViewController {
        if isAd {
            return sb.instantiateViewController(withIdentifier: TravelTableViewController.adDetailIdentifier) as! AdDetailViewController
        } else {
            return sb.instantiateViewController(withIdentifier: TravelTableViewController.tourSpotIdentifier) as! TourSpotViewController
        }
        
    }
    
    
}

