import Foundation
import UIKit

public class SwitchRow : Row {
    
    var component:UISwitch!
    var value: Bool {
        component.isOn
    }
    
    init(_ title:String, description:String? = nil, value:Bool = false){
        super.init(title, description: description)
        component = createSwitchView()
        component.isOn = value
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)
        component.isOn = getBindingValue() as? Bool ?? false
        
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
    override func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
}
