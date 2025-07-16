
import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    
    
    @IBOutlet var thumbnailImageview: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityTabContainer: UIView!
    @IBOutlet var cityTagLabel: UILabel!
    @IBOutlet var cityEnNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBasicCellStyle()
        
        
    }
    
    func setBasicCellStyle() {
        thumbnailImageview.backgroundColor = .lightGray
        thumbnailImageview.contentMode = .scaleAspectFill
        
        cityTabContainer.backgroundColor = .black.withAlphaComponent(0.5)
        cityTagLabel.textColor = .lightGray
        cityTagLabel.textColor = .white
        
        cityNameLabel.textColor = .white
        cityEnNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityEnNameLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    
    func configureCell(cityData: City) {
        let thumbnailUrl = URL(string: cityData.city_image)
        
        thumbnailImageview.kf.setImage(with: thumbnailUrl)
        cityNameLabel.text = cityData.city_name
        cityEnNameLabel.text = cityData.city_english_name
        cityTagLabel.text = cityData.city_explain
    }
}
