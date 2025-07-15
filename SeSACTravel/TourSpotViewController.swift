import UIKit
import Kingfisher 

class TourSpotViewController: UIViewController {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var viewOtherButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "관광지 화면"
        configureUI()
    }
    
    func configureUI() {
        let url = "https://images.unsplash.com/photo-1715880005923-0013a6820a72?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        let thumbnailUrl = URL(string: url)
        
        thumbnailImageView.kf.setImage(with: thumbnailUrl)
        thumbnailImageView.layer.cornerRadius = 12
        thumbnailImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = .boldSystemFont(ofSize: 26)
        titleLabel.text = "카스카이스"
        
        subtitleLabel.font = .boldSystemFont(ofSize: 20)
        subtitleLabel.text = "낮과 밤 서로 다른 매력을 지닌 번화한 거리"
        
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
