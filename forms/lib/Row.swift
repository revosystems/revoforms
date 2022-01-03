import Foundation
import UIKit

public class Row {
 
    var indentifier = "cell"
    
    var title:String
    var detail:String?
    
    init(_ title:String, detail:String?){
        self.title = title
        self.detail = detail
    }
    
    func cell(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! FormCell
        return cell.setup(self)
    }
}
