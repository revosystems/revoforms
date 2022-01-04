import Foundation
import UIKit

public class SwitchRow : Row {
    
    var component:UISwitch!

    public var value: Bool {
        component.isOn
    }

    public init(_ title:String, description:String? = nil, value:Bool = false){
        super.init(title, description: description)
        component = createSwitchView()
        component.isOn = value
    }

    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        component.isOn = getBindingValue() as? Bool ?? false
        return self
    }

    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath) as! FormCell
        cell.component = component
        addComponent(cell: cell)
        return cell
    }
    
    func createSwitchView() -> UISwitch {
        let component = UISwitch()
        return component
    }
    
    func addComponent(cell:UITableViewCell){
        cell.addSubview(component)
        
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
    }
    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
}
