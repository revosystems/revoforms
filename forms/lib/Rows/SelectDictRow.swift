import UIKit

public class SelectDictRow<T:Comparable&Hashable> : Row, SelectControllerDelegate {
    
    public override var identifier: String { "selectCell" }
    var selectedOption:T? = nil
    let options:[T?:String]
    weak var cell:UITableViewCell?
    var allowsNull:Bool = false

    private var onOptionSelectedCallback:((_ row:Row, T?)->Void)?

    public var value: T? {
        selectedOption
    }

    var keysSorted : [T?] {
        (Array(options.keys) as! [T]).sorted()
    }

    public init(_ title:String, description:String? = nil, detail:String? = nil, options:[T:String], value:T? = nil){
        self.options = options
        self.selectedOption = value
        super.init(title, description: description)
        self.detail = detail
    }

    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        refreshFromBinding()
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
    
    public override func refreshFromBinding() {
        selectedOption = getBindingValue() as? T ?? nil
        showSelectedOptionTo(cell)
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        let vc              = SelectController(style: .grouped)
        vc.options          = keysSorted.map { options[$0]! }
        if allowsNull {
            vc.options.append("--")
        }
        if let option = selectedOption {
            vc.selectedOption = keysSorted.firstIndex(of: option)
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
        if let option = option, keysSorted.count > option {
            selectedOption = keysSorted[option]
            onOptionSelectedCallback?(self, keysSorted[option])
        } else {
            selectedOption = nil
            onOptionSelectedCallback?(self, nil)
        }
        showSelectedOptionTo(cell)
    }

    func showSelectedOptionTo(_ cell:UITableViewCell?){
        if let detail = detail {
            cell?.detailTextLabel?.text = detail
            return
        }
        if let option = selectedOption, let text = options[option] {
            cell?.detailTextLabel?.text = text
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

    // MARK-: Callbacks
    public func onOptionSelected(_ callback:@escaping(_ row:Row, _ option:T?) -> Void) -> Self {
        onOptionSelectedCallback = callback
        return self
    }
}
