import Foundation
import UIKit

public class StepperRow : Row {
    
    var component:UIStepper!
    var label:UILabel!
    
    init(_ title:String){
        super.init(title)
        component = createComponent()
    }
    
    override func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)
        
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
    
    func addComponent(cell:UITableViewCell){
        cell.contentView.addSubview(component)
        component.translatesAutoresizingMaskIntoConstraints = false
        component.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20).isActive = true
        component.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        //component.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //component.heightAnchor.constraint(equalToConstant: 21).isActive = true
        //component.textAlignment = .right
        
        cell.contentView.addSubview(label)
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
    
    
    
}
