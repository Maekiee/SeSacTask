import UIKit
import Kingfisher


class TravelCardTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var countsLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBasicStyle()
    }
    
    // 변하지 않은 스타일
    func configureBasicStyle() {
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 3
        
        starImageViews.forEach { $0.tintColor = .systemYellow }
        
        countsLabel.textColor = .lightGray
        countsLabel.font = .systemFont(ofSize: 10)
        
        thumbnailImageView.backgroundColor = .lightGray
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.backgroundColor = .lightGray
        
        likeButton.tintColor = .white
    }
    
    // 제목
    func setTitle(row: Travel) {
        titleLabel.text = row.title
    }
    
    // 설명
    func setDescriptionLabel(row: Travel) {
        descriptionLabel.text = row.description
    }
    
    // 평점 별
    func setRateStarImageView(row: Travel) {
        if let grade = row.grade {
            let gradePoint = Double(grade)
            for (index, imageView) in starImageViews.enumerated() {
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
            starImageViews.forEach { $0.image = UIImage(systemName: "star") }
        }
    }
    
    // 저장 및 리뷰작성자 수
    func setReviewerAndSaveCountLabel(row: Travel) {
        if let reviewer = row.reviewers,
           let saved = row.save {
            let reviewerString = formatNumber(num: reviewer)
            let savedString = formatNumber(num: saved)
            countsLabel.text = "(\(reviewerString)) · 저장 \(savedString)"
        } else {
            countsLabel.text = ""
        }
    }
    
    // 이미지
    func setThumbnailImage(row: Travel) {
        let thumbnailUrl = URL(string: row.travel_image ?? "")
        thumbnailImageView.kf.setImage(with: thumbnailUrl)
        
    }
    
    // 좋아요
    func setLikeButton(row: Travel, indexPathNum: Int, isClicked: () -> Void) {
        if let isLiked = row.like {
            likeButton.isHidden = false
            likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
            likeButton.tag = indexPathNum
            isClicked()
         
        } else {
            likeButton.isHidden = true
        }
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
