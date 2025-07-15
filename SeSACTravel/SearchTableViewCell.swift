import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageview: UIImageView!
    @IBOutlet var cityTagLabel: UILabel!
    @IBOutlet var cityTitleLabel: [UILabel]!
    @IBOutlet var verticalDivider: UIView!
    @IBOutlet var cityTagContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        verticalDivider.backgroundColor = .white
        thumbnailImageview.contentMode = .scaleAspectFill
        cityTagContainer.backgroundColor = .black.withAlphaComponent(0.5)
        cityTagLabel.textColor = .lightGray
        cityTagLabel.textColor = .white

        thumbnailImageview.backgroundColor = .lightGray
        for i in cityTitleLabel {
            i.textColor = .white
            i.font = .boldSystemFont(ofSize: 20)
        }
        
    }
    
    func configureCellUI(rowData: City) {
        let thumbnailUrl = URL(string: rowData.city_image)
        
        thumbnailImageview.kf.setImage(with: thumbnailUrl)
        cityTitleLabel[0].text = rowData.city_name
        cityTitleLabel[1].text = rowData.city_english_name
        cityTagLabel.text = rowData.city_explain
    }
    
}
