import Foundation
import UIKit

public class TextAreaRow : Row {
    
    var component:UITextView!
    var titleLabel:UILabel!
    var cellHeight = 80

    public var value: String? {
        component.text
    }

    public init(_ title:String, description:String? = nil, value:String? = nil){
        super.init(title, description: description)
        component = createComponent()
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        component.text = value
    }
    
    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath) as! FormCell

        cell.component = component
        cell.addSubview(titleLabel)
        
        addComponent(cell: cell)
        addTitleLabel(cell: cell)
        
        
        return cell
    }
    
    
    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        refreshFromBinding()
        return self
    }
    
    public override func refreshFromBinding() {
        component.text = getBindingValue() as? String
    }
    
    func height(_ height:Int) -> Self{
        cellHeight = height
        return self
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
    
    func addComponent(cell:FormCell){
        cell.addSubview(component)

        
        //tl.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = false
        
        component.translatesAutoresizingMaskIntoConstraints = false
        
        component.leadingAnchor.constraint(equalTo:  cell.leadingAnchor, constant: 15).isActive = true
        component.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        
        component.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true
        component.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -4).isActive = true
        
        
        cell.heightAnchor.constraint(equalToConstant: 44).isActive = false
        cell.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(cellHeight)).isActive = true
        //cell.bottomAnchor.constraint(equalTo: component.bottomAnchor).isActive = true
        //cell.bottomAnchor.constraint(equalTo: component.bottomAnchor).priority = UILayoutPriority(rawValue: 1)
        //cell.heightAnchor.constraint(equalToConstant: 130).isActive = true

        
        component.textAlignment = .left
    }
    
    func addTitleLabel(cell:FormCell){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.attributedText = cell.textLabel?.attributedText
        titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: -4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        titleLabel.attributedText = cell.textLabel?.attributedText
        
        if let mainLabelFont = appearance?.mainLabelFont ?? FormAppearance.shared.mainLabelFont {
            titleLabel?.font = mainLabelFont
        }
        
        if let mainLabelColor = appearance?.mainLabelColor ?? FormAppearance.shared.mainLabelColor {
            titleLabel?.textColor = mainLabelColor
        }
        
        cell.extraViews.append(titleLabel)
    }
    
    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
}
