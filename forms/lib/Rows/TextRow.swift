import Foundation
import UIKit
import RevoValidation

public class TextRow : Row {
    
    var placeholder : String
    var component:UITextField!
    var validation:Validation?

    public var value: String? {
        component.text
    }
    
    public init(_ title:String, description:String? = nil, placeholder:String, value:String? = nil){
        self.placeholder = placeholder
        super.init(title, description: description)
        component = createComponent()
        component.text = value
    }

    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        component.text = getBindingValue() as? String
        return self
    }

    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)

        
        return cell
    }
    
    func validation(_ rules: Rules?) -> Self {
        if let rules = rules {
            component.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
            component.rightView?.backgroundColor = .red
            component.rightView?.circle()
            validation = Validation(component, rules)
        }
        return self
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
        
        component.clearButtonMode = .whileEditing
        
        return component
    }
    
    func addComponent(cell:UITableViewCell){
        cell.addSubview(component)
        
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        component.widthAnchor.constraint(equalToConstant: 200).isActive = true
        component.heightAnchor.constraint(equalToConstant: 21).isActive = true
        component.textAlignment = .right
    }
    
    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
    
}
