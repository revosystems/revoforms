import Foundation
import UIKit

open class UselesSelectRow : Row {
    
    var selected:Bool = false
    
    open override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        cell.accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool{
        selected = !selected
        return true
    }    
}
