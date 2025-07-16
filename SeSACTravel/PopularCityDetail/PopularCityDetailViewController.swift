
import UIKit
import Kingfisher

class PopularCityDetailViewController: UIViewController {
    @IBOutlet var cityImageview: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityEnNameLabel: UILabel!
    @IBOutlet var cityTagLable: UILabel!
    
    var cityImage = ""
    var cityText = ""
    var cityEnText = ""
    var cityTagText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
        let imageUrl = URL(string: cityImage)
        cityImageview.kf.setImage(with: imageUrl)
        cityNameLabel.text = cityText
        cityEnNameLabel.text = cityEnText
        cityTagLable.text = cityTagText
    
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
