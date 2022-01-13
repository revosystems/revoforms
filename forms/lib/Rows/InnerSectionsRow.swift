import Foundation
import UIKit


public class InnerSectionsRow: Row {
    
    let sections:[Section]
    
    public init(_ title:String, description:String? = nil, detail:String? = nil, sections:[Section]){
        self.sections = sections
        super.init(title, description: description)
        self.detail = detail
    }
    
    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
                
        return cell
    }
    
    override func onSelected(_ viewController:UIViewController) -> Bool {
        
        let newVc = FormViewController(style: .grouped)
        newVc.sections = sections
        
        if let nav = viewController.navigationController {
            nav.pushViewController(newVc, animated: true)
        }else{
            viewController.present(newVc, animated: true)
        }
        
        return false
    }
    
    public override func updateBinding() {
        sections.each {
            $0.rows.each { $0.updateBinding() }
        }
    }
}
