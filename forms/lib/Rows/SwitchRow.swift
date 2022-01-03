import Foundation
import UIKit

public class SwitchRow : Row {
    
    var component:UISwitch!
    
    init(_ title:String){
        super.init(title)
        component = createSwitchView()
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)
        
        return cell
    }
    
    func createSwitchView() -> UISwitch {
        let component = UISwitch()
        return component
    }
    
    func addComponent(cell:UITableViewCell){
        cell.contentView.addSubview(component)
        
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        //component.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //component.heightAnchor.constraint(equalToConstant: 21).isActive = true
        //component.textAlignment = .right
    }
    
}
