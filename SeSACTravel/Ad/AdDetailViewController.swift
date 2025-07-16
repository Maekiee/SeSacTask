import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet var AdContentLabel: UILabel!
    
    var adText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AdContentLabel.text = adText
        AdContentLabel.font = .boldSystemFont(ofSize: 24)
        AdContentLabel.numberOfLines = 0
    }
    

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
