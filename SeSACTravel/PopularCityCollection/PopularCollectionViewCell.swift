import UIKit
import Kingfisher


class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameTitle: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configBasicUI()
    }
    
    func configBasicUI() {
        cityImageView.contentMode = .scaleToFill
        cityImageView.backgroundColor = .lightGray
        
        cityNameTitle.numberOfLines = 0
        cityNameTitle.font = .systemFont(ofSize: 14, weight: .semibold)
        
        explainLabel.numberOfLines = 0
        explainLabel.font = .systemFont(ofSize: 10, weight: .regular)
        explainLabel.textColor = .gray
        
    }
    
    func setConfig(cityItem: City) {
        let imageUrl = URL(string: cityItem.city_image)
        let krName = cityItem.city_name
        let enNmae = cityItem.city_english_name
        cityImageView.kf.setImage(with: imageUrl)
        cityNameTitle.text = "\(krName)|\(enNmae)"
        explainLabel.text = cityItem.city_explain
    }

}
