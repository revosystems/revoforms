import Foundation
import UIKit

class SelectRow : Row {
    
    var selected:Bool = false
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        cell.accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    override func onSelected() -> Bool{
        selected = !selected
        return true
    }    
}
