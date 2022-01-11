import Foundation
import UIKit


public class ControllerRow: Row {
    
    let vc:UIViewController!
    
    public init(_ title:String, description:String? = nil, detail:String? = nil, vc:UIViewController){
        self.vc = vc
        super.init(title, description: description)
        self.detail = detail
    }
    
    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
                
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        if let nav = viewController.navigationController {
            nav.pushViewController(vc, animated: true)
        }else{
            viewController.present(vc, animated: true)
        }
        
        return false
    }
}
