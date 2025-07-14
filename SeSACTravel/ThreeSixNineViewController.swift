import UIKit

class ThreeSixNineViewController: UIViewController {
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var clappingCountLabel: UILabel!
    
    
    // 3,6,9 로직 과제
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.placeholder = "최대 숫자를 입력해주세요"
        resultTextView.text = ""
        resultTextView.isEditable = false
        clappingCountLabel.text = ""
        title = "삼 · 육 · 구"
    }
    
    
    
    func makeResultText(num: Int, isHardRule: Bool = true) {
        var list: [String] = []
        for i in 1...num {
            list.append(String(i))
        }
        
        if isHardRule {
            let newList: [String] = list.map { item in
                var result = item
                
                if result.contains("3") {
                    result = result.replacingOccurrences(of: "3", with: "👏")
                }
                
                if result.contains("6") {
                    result = result.replacingOccurrences(of: "6", with: "👏")
                }
                
                if result.contains("9") {
                    result = result.replacingOccurrences(of: "9", with: "👏")
                }
                
                return result
            }
            
//            var count: Int = 0
//            newList.filter { $0.contains("👏") }.forEach { $0.split(separator: "").forEach { clap in
//                if clap == "👏" {
//                    count += 1
//                } else {
//                    count = count
//                }
//            }}
        
            resultTextView.text = newList.joined(separator: ",")
//            clappingCountLabel.text = "숫자 \(num)까지 총 👏는  \(String(count))번 입니다"
            
        } else {
            let newList: [String] = list.map { item in
                if item.contains("3") {
                    "👏"
                } else if item.contains("6") {
                    "👏"
                } else if item.contains("9") {
                    "👏"
                } else {
                    item
                }
            }
            resultTextView.text = newList.joined(separator: ",")
        }
        
        
    }
    
    func submitAndCheckValue(inputValue: String?) {
        guard let stringValue = inputValue else { return }
        guard let intValue = Int(stringValue) else { return }
        makeResultText(num: intValue)
    }
    
    @IBAction func getNumTextField(_ sender: UITextField) {
        if resultTextView.text == "" {
            submitAndCheckValue(inputValue: sender.text)
        } else {
            resultTextView.text = ""
            submitAndCheckValue(inputValue: sender.text)
        }
    }
    

}
