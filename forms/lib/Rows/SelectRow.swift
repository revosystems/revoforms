import UIKit

public class SelectRow : Row, SelectControllerDelegate {
    
    public override var identifier: String { "selectCell" }
    var selectedOption:Int = 0
    let options:[String]
    weak var cell:UITableViewCell?

    public var value: Int {
        selectedOption
    }

    public init(_ title:String, description:String? = nil, options:[String], value:Int = 0){
        self.options = options
        self.selectedOption = value
        super.init(title, description: description)
    }
    
    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        selectedOption = getBindingValue() as? Int ?? 0
        
        cell.detailTextLabel?.text = options[selectedOption]
        self.cell = cell
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        let vc              = SelectController(style: .grouped)
        vc.options          = options
        vc.selectedOption   = selectedOption
        vc.title            = title
        vc.delegate         = self
        if let nav = viewController.navigationController {
            nav.pushViewController(vc, animated: true)
        }else{
            viewController.present(vc, animated: true)
        }
        
        return false
    }
    
    func selectController(onOptionSelected option: Int?) {
        selectedOption = option ?? 0
        cell?.detailTextLabel?.text = options[selectedOption]
    }
    
    //MARK: Binding
    public override func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
}
