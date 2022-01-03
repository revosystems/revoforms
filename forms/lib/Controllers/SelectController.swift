import Foundation
import UIKit

protocol SelectControllerDelegate {
    func selectController(onOptionSelected option:Int)
}

class SelectController : UITableViewController {
    
    var options:[String] = []
    var selectedOption:Int = 0
    var delegate:SelectControllerDelegate?
    
    
    public override func viewDidLoad() {
        tableView.register(FormCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .tertiarySystemGroupedBackground
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        title
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FormCell
        cell.textLabel?.text = options[indexPath.row]
        cell.appearance()
        
        cell.accessoryType = indexPath.row == selectedOption ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOption = indexPath.row
        
        delegate?.selectController(onOptionSelected: selectedOption)
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }else{
            dismiss(animated: true)
        }
    }
    
}
