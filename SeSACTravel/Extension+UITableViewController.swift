
import UIKit
import Toast

extension UITableViewController {
    
    func showToast() {
        view.makeToast("광고 셀 입니다.", duration: 0.5, position: .center)
    }
    
}
