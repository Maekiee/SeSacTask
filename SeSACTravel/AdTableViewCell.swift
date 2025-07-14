

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var adCellContainer: UIView!
    @IBOutlet var adLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        adCellContainer.layer.cornerRadius = 10
        adCellContainer.backgroundColor = .systemPink
            
        adLabel.font = .boldSystemFont(ofSize: 16)
        adLabel.numberOfLines = 0
    }
    
    func setAdCellBackground(color: UIColor) {
        adCellContainer.backgroundColor = color
    }
    
    func setAdLabel(row: Travel) {
        adLabel.text = row.title
    }
}
