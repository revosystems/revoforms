import UIKit

public class SelectEnumRow<T:CaseIterable&RawRepresentable> : Row, SelectControllerDelegate {
    
    var options:T.Type
    var selectedOption:T?
    var allowsNull : Bool = false
    
    weak var cell:UITableViewCell?
    
    public var value: T.RawValue? {
        selectedOption?.rawValue
    }
    
    public init(_ title:String, description:String? = nil, options:T.Type, value:T? = nil){
        self.options = options
        self.selectedOption = value
        super.init(title, description: description)
    }
    
    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        if let rawValue = getBindingValue() as? T.RawValue{
            selectedOption = T.init(rawValue: rawValue)
        }
        return self
    }

    public func allowsNull(_ allowsNull:Bool = true) -> Self {
        self.allowsNull = allowsNull
        return self
    }
    
    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator

        showSelectedOptionTo(cell)
        
        self.cell = cell
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        let vc              = SelectController(style: .grouped)
        vc.options          = options.allCases.map { optionString($0) }
        if allowsNull {
            vc.options.append("--")
        }
        if let option = selectedOption {
            vc.selectedOption = vc.options.firstIndex(of: optionString(option))
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
            selectedOption = Array(options.allCases)[option]
        } else {
            selectedOption = nil
        }
        showSelectedOptionTo(cell)
    }
    
    func showSelectedOptionTo(_ cell:UITableViewCell?){
        if let option = selectedOption {
            cell?.detailTextLabel?.text = optionString(option)
        } else {
            cell?.detailTextLabel?.text = "--"
        }
    }

    //MARK: Binding
    public override func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
    func optionString(_ option:T) -> String {
        if option is CustomStringConvertible {
            return "\(option)"
        }
        return "\(option.rawValue)".ucFirst()
    }
    
}
