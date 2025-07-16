import UIKit
import Kingfisher 

class TourSpotViewController: UIViewController {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var viewOtherButton: UIButton!
    
    var travelTitle = ""
    var travelDescription = ""
    var imageUrl = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        title = "관광지 화면"
        
        
        let thumbnailUrl = URL(string: imageUrl)
        thumbnailImageView.kf.setImage(with: thumbnailUrl)
        thumbnailImageView.layer.cornerRadius = 12
        thumbnailImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = .boldSystemFont(ofSize: 26)
        titleLabel.text = travelTitle
        
        subtitleLabel.font = .boldSystemFont(ofSize: 20)
        subtitleLabel.text =  travelDescription
        subtitleLabel.numberOfLines = 0
        
        viewOtherButton.layer.cornerRadius = viewOtherButton.frame.height / 2
        viewOtherButton.tintColor = .white
        viewOtherButton.backgroundColor = .systemBlue
    }
    
    
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func navBarRightButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
