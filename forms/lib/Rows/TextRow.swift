import Foundation
import UIKit

public class TextRow : Row {
    
    var placeholder : String
    var component:UITextField!
    
    init(_ title:String, placeholder:String){
        self.placeholder = placeholder
        super.init(title)
        component = createComponent()
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)
        
        return cell
    }
    
    func createComponent() -> UITextField {
        let component = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        component.placeholder = placeholder
        
        if let detailLabelFont = appearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            component.font = detailLabelFont
        }
        
        if let detailLabelColor = appearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            component.textColor = detailLabelColor
        }
        
        return component
    }
    
    func addComponent(cell:UITableViewCell){
        cell.contentView.addSubview(component)
        
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        component.widthAnchor.constraint(equalToConstant: 200).isActive = true
        component.heightAnchor.constraint(equalToConstant: 21).isActive = true
        component.textAlignment = .right
    }
    
    
    
}
