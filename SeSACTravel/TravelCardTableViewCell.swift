import UIKit

class TravelCardTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var countsLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBasicStyle()
    }
    
    func configureBasicStyle() {
        thumbnailImageView.backgroundColor = .lightGray
        
        likeButton.tintColor = .systemGray6
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
