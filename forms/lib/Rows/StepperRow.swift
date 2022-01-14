import Foundation
import UIKit

public class StepperRow : Row {
    
    var component:UIStepper!
    var label:UILabel!

    public var value: Int {
        Int(component.value)
    }

    public init(_ title:String, description:String? = nil, value:Int = 0){
        super.init(title, description: description)
        component = createComponent()
        component.value = Double(value)
    }

    public func minValue(_ min:Double) -> Self {
        component.minimumValue = min
        return self
    }

    public func maxValue(_ max:Double) -> Self {
        component.maximumValue = max
        return self
    }

    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath) as! FormCell

        addComponent(cell: cell)
        refreshFromBinding()
        
        return cell
    }
    
    func createComponent() -> UIStepper {
        let component = UIStepper()
        component.addTarget(self, action: #selector(onChanged), for: .valueChanged)

        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        onChanged()
        
        if let detailLabelFont = appearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            label.font = detailLabelFont
        }
        
        if let detailLabelColor = appearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            label.textColor = detailLabelColor
        }
        
        return component
    }
    
    public override func refreshFromBinding() {
        component.value = getBindingValue() as? Double ?? 0
        onChanged()
    }
    
    func addComponent(cell:UITableViewCell){
        cell.addSubview(component)
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        //component.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //component.heightAnchor.constraint(equalToConstant: 21).isActive = true
        //component.textAlignment = .right
        
        cell.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: component.leadingAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: component.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        label.textAlignment = .right
    }
    
    @objc func onChanged(){
        label.text = "\(Int(component?.value ?? 0))"
    }
    
    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
}
