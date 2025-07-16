import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet var AdContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AdContentLabel.text = "도쿄 여행 예약은? 수업이 있는데 가실 생각은 아니시죠?"
        AdContentLabel.font = .boldSystemFont(ofSize: 24)
        AdContentLabel.numberOfLines = 0
    }
    

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
