import Foundation
import UIKit

protocol SelectControllerDelegate {
    func selectController(onOptionSelected option:Int?)
}

open class SelectController : UITableViewController {
    
    var options:[String] = []
    var selectedOption:Int?
    var delegate:SelectControllerDelegate?

    open override func viewDidLoad() {
        tableView.register(FormCell.classForCoder(), forCellReuseIdentifier: "cell")
        if #available(iOS 13, *) {
            tableView.backgroundColor = .tertiarySystemGroupedBackground
        }
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        title
    }
    
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FormCell
        cell.textLabel?.text = options[indexPath.row]
        cell.appearance()
        
        cell.accessoryType = isSelected(indexPath) ? .checkmark : .none
        return cell
    }
    
    func isSelected(_ indexPath:IndexPath) -> Bool {
        indexPath.row == selectedOption || (selectedOption == nil && options[indexPath.row] == "--")
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOption = indexPath.row
        
        delegate?.selectController(onOptionSelected: selectedOption)
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }else{
            dismiss(animated: true)
        }
    }
    
}
