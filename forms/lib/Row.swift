import Foundation
import UIKit

public class Row {
 
    var indentifier = "cell"
    var appearance:FormAppearance?
    
    var title:String
    var detail:String?
    
    init(_ title:String, detail:String? = nil){
        self.title = title
        self.detail = detail
    }
    
    func cell(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! FormCell
        return cell.setup(self)
    }
    
    func onSelected() -> Bool{
        false
    }
    
    func onDeselected() -> Bool {
        false
    }
}
