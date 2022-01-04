import Foundation
import UIKit

public class TextAreaRow : Row {
    
    var component:UITextView!
    
    var value: String? {
        component.text
    }
    
    init(_ title:String, description:String? = nil, value:String? = nil){
        super.init(title, description: description)
        component = createComponent()
        component.text = value
        
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)
        
        return cell
    }
    
    func createComponent() -> UITextView {
        let component = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        //component.placeholder = placeholder
        
        if let detailLabelFont = appearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            component.font = detailLabelFont
        }
        
        if let detailLabelColor = appearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            component.textColor = detailLabelColor
        }
        
        return component
    }
    
    func addComponent(cell:UITableViewCell){
        cell.addSubview(component)
                               
        component.text = "Here goes some text"
        
        component.translatesAutoresizingMaskIntoConstraints = false
        component.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
        component.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        
        component.topAnchor.constraint(equalTo: cell.textLabel!.bottomAnchor, constant: -4).isActive = true
        //component.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        component.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 4).isActive = true
        
        component.textAlignment = .left
    }
    
    
    func removeAllConstraints(_ view:UIView) {
        view.removeConstraints(view.constraints)
    }
    
    //MARK: Binding
    override func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
}
