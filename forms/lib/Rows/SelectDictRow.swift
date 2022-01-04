import UIKit

public class SelectDictRow : Row, SelectControllerDelegate {
    
    var selectedOption:AnyHashable? = nil
    let options:[AnyHashable?:String]
    weak var cell:UITableViewCell?
    var allowsNull:Bool = false

    public var value: AnyHashable? {
        selectedOption
    }

    var keysSorted : [AnyHashable?] {
        Array(options.keys)
    }

    public init(_ title:String, description:String? = nil, options:[AnyHashable:String], value:AnyHashable? = nil){
        self.options = options
        self.selectedOption = value
        super.init(title, description: description)
    }

    public func allowsNull(_ allowsNull:Bool = true) -> Self {
        self.allowsNull = allowsNull
        return self
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        selectedOption = getBindingValue() as? Int ?? 0
        
        if let option = selectedOption, let text = options[option] {
            cell.detailTextLabel?.text = text
        }else{
            cell.detailTextLabel?.text = "--"
        }
        
        self.cell = cell
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        let vc              = SelectController(style: .grouped)
        vc.options          = keysSorted.map { options[$0]! }
        if allowsNull {
            vc.options.append("--")
        }
        if let option = selectedOption {
            vc.selectedOption   = keysSorted.firstIndex(of: option)
        }
        vc.title            = title
        vc.delegate         = self
        if let nav = viewController.navigationController {
            nav.pushViewController(vc, animated: true)
        } else {
            viewController.present(vc, animated: true)
        }
        
        return false
    }
    
    func selectController(onOptionSelected option: Int?) {
        if let option = option {
            selectedOption = keysSorted.contains(option) ? keysSorted[option] : nil
        }else{
            selectedOption = nil
        }
        if let option = selectedOption, let text = options[option] {
            cell?.detailTextLabel?.text = text
        }
    }
    
    //MARK: Binding
    public override func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
}
