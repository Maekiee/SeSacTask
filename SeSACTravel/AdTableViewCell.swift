

import UIKit

class AdTableViewCell: UITableViewCell {

    

    @IBOutlet var adCellContainer: UIView!
    @IBOutlet var adTagLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adLabel.text = "AD"
        adLabel.backgroundColor = .systemGray6
        
    }
    
    func configureUI() {
        adCellContainer.layer.cornerRadius = 10
        adCellContainer.backgroundColor = .systemPink
        
        adTagLabel.font = .systemFont(ofSize: 14)
        adTagLabel.textColor = .black
        
        adLabel.font = .boldSystemFont(ofSize: 16)
        adLabel.numberOfLines = 0
    }
    
    
    
}
