import Foundation
import UIKit

public class CheckmarkSelectRow : Row {
    
    var selected:Bool = false
    
    public var value: Bool {
        selected
    }
    
    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        selected = getBindingValue() as? Bool ?? false
        return self
    }
    
    public override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        cell.accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool{
        selected = !selected
        return true
    }
    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
}
