import Foundation
import UIKit
import RevoValidation

open class Row {
 
    public var identifier:String { "cell" }
    public var appearance:FormAppearance?
    
    public var title:String
    public var description:String?
    public var detail:String?
    
    var rules:Rules?
    
    var bindObject:NSObject?
    var bindKeyPath:String?
    
    var hidden:Bool = false

    private var onPressedCallback:((_ row:Row)->Void)?

    public init(_ title:String, description:String? = nil){
        self.title = title
        self.description = description
    }
    
    public func hidden(_ hidden:Bool = true) -> Self {
        self.hidden = hidden
        return self;
    }

    public func appearance(_ appearance:FormAppearance?) -> Self {
        self.appearance = appearance
        return self
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

    open func updateBinding(){
        
    }
    
    open func refreshFromBinding(){
        
    }
    
    //MARK: Cell
    open func cell(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FormCell
        return cell.setup(self)
    }
    
    func onSelected(_ viewController:UIViewController) -> Bool {
        if let callback = onPressedCallback {
            callback(self)
            return true
        }
        return false
    }
    
    func onDeselected(_ viewController:UIViewController) -> Bool {
        false
    }
    
    func appearance(_ appearance:FormAppearance) -> Self {
        self.appearance = appearance
        return self
    }

    // MARK-: Callbacks
    public func onPressed(_ callback:@escaping(_ row:Row) -> Void) -> Self {
        onPressedCallback = callback
        return self
    }
}
