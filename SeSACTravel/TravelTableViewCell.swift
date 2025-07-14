import UIKit

class TravelTableViewCell: UITableViewCell {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var countsLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 3
        
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.backgroundColor = .lightGray
        
        starImageViews.forEach { $0.tintColor = .systemYellow }
        
        countsLabel.textColor = .lightGray
        countsLabel.font = .systemFont(ofSize: 10)
    
    }
}
