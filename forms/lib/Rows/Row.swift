import Foundation
import UIKit
import RevoValidation

public class Row {
 
    var indentifier = "cell"
    var appearance:FormAppearance?
    
    var title:String
    var description:String?
    var detail:String?
    
    var rules:Rules?
    
    init(_ title:String, description:String? = nil){
        self.title = title
        self.description = description
    }
    
    func cell(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! FormCell
        return cell.setup(self)
    }
    
    func onSelected(_ viewController:UIViewController) -> Bool{
        false
    }
    
    func onDeselected(_ viewController:UIViewController) -> Bool {
        false
    }
}
