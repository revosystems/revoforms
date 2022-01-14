import Foundation
import UIKit
import RevoValidation
import RevoFoundation

public class NumberRow : Row {
    
    var placeholder : String
    var component:UITextField!
    var validation:Validation?
        
    let textFieldDelegate = TextToNumber()

    public var value: Double? {
        Double(component.text ?? "0")
    }
    
    public init(_ title:String, description:String? = nil, placeholder:String? = nil, value:Double? = nil){
        self.placeholder = placeholder ?? title
        super.init(title, description: description)
        component = createComponent()
        component.text = stringValue(value)
        keyboardType(.numberPad)
    }

    public override func bind(_ object: NSObject, keyPath: String) -> Self {
        super.bind(object, keyPath: keyPath)
        refreshFromBinding()
        component.delegate = textFieldDelegate
        return self
    }

    @discardableResult
    public func keyboardType(_ type:UIKeyboardType) -> Self {
        component.keyboardType = type
        return self
    }

    override open func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = super.cell(tableView, indexPath: indexPath)
        
        addComponent(cell: cell)

        return cell
    }
    
    public func validation(_ rules: Rules?) -> Self {
        if let rules = rules {
            component.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
            component.rightView?.backgroundColor = .red
            component.rightView?.circle()
            validation = Validation(component, rules)
            textFieldDelegate.validation = validation
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
    
    
    private func stringValue(_ value:Double?) -> String {
        //let format = str("%%.%luf", decimals)1
        let format = str("%.2f")
        return str(format, "\(value ?? 0)")
    }
    
    
    public override func refreshFromBinding() {
        component.text = stringValue(getBindingValue() as? Double)
    }


    
    //MARK: Binding
    override public func updateBinding() {
        if let object = bindObject, let keyPath = bindKeyPath {
            object.setValue(value, forKey: keyPath)
        }
    }
    
}


class TextToNumber : NSObject, UITextFieldDelegate {
    
    var decimals:Int = 2
    var decimalSeparator = "."
    var validation:Validation?
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.selectAll(nil)
    }
    
    //MARK: TextView Delegate
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //guard string.first?.isNumber ?? true else { return false }
        
        
        let currentValue        = Double(((textField.text ?? "") + string).replace(decimalSeparator, "")) ?? 0
        let format              = String(format: "%%.%if", decimals)
        let minorUnitsPerMajor  = pow(10, Double(decimals))
        let newString           = String(format:format, currentValue/minorUnitsPerMajor)
        //let newString         = String(format:"%.2f", currentValue/minorUnitsPerMajor)
        textField.text          = newString
        validation?.validate()
//        [super didChange];
        
        return false
    }
}
