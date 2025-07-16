
import UIKit
import Kingfisher

class PopularCityDetailViewController: UIViewController {
    @IBOutlet var cityImageview: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityEnNameLabel: UILabel!
    @IBOutlet var cityTagLable: UILabel!
    
    var cityInifo = City(
        city_name: "",
        city_english_name: "",
        city_explain: "",
        city_image: "",
        domestic_travel: false
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
        let imageUrl = URL(string: cityInifo.city_image)
        cityImageview.kf.setImage(with: imageUrl)
        cityNameLabel.text = cityInifo.city_name
        cityEnNameLabel.text = cityInifo.city_english_name
        cityTagLable.text = cityInifo.city_explain
    }
    
    
    func configUI () {
        cityImageview.contentMode = .scaleAspectFill
        
        cityNameLabel.textColor = .black
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityEnNameLabel.textColor = .black
        cityEnNameLabel.font = .boldSystemFont(ofSize: 20)
        
        cityTagLable.textColor = .black
        cityTagLable.numberOfLines = 0   
    }


}
