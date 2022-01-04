import Foundation
import UIKit
import RevoValidation

public class Row {
 
    var indentifier = "cell"
    var appearance:FormAppearance?
    
    var title:String
    var description:String?
    var detail:String?
    
    var rules:Rules?
    
    var bindObject:NSObject?
    var bindKeyPath:String?
    
    var hidden:Bool = false

    public init(_ title:String, description:String? = nil){
        self.title = title
        self.description = description
    }
    
    public func hidden(_ hidden:Bool = true) -> Self {
        self.hidden = hidden
        return self;
    }
    

    //MARK: Bindings
    /**
        The keypath must be visible in objc to be able to get and set the value as it uses the `setValue(keypath)` and `getValue(keyPath)`
     */
    @discardableResult
    public func bind(_ object:NSObject, keyPath:String) -> Self {
        bindObject  = object
        bindKeyPath = keyPath
        return self
    }

    public func getBindingValue() -> Any? {
        guard let keyPath = bindKeyPath else { return nil }
        return bindObject?.value(forKey: keyPath)
    }

    public func updateBinding(){
        
    }
    
    //MARK: Cell
    func cell(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! FormCell
        return cell.setup(self)
    }
    
    func onSelected(_ viewController:UIViewController) -> Bool{
        false
    }
    
    func onDeselected(_ viewController:UIViewController) -> Bool {
        false
    }
    
    func appearance(_ appearance:FormAppearance) -> Self {
        self.appearance = appearance
        return self
    }
}
