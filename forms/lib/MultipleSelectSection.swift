import Foundation

open class MultipleSelectSection<T:Comparable&Hashable> : Section {
        
    var bindObject:NSObject?
    var bindKeyPath:String?
    
    public init(_ title: String? = nil, options: [T:String]) {
        let rows = options.map {
            UselesSelectRow($0.value)
        }
        
        super.init(title, rows: rows)
    }
        
    @discardableResult
    public func bind(_ object:NSObject, keyPath:String) -> Self {
        bindObject  = object
        bindKeyPath = keyPath
        refreshBindings()
        return self
    }

    public func getBindingValue() -> Any? {
        guard let keyPath = bindKeyPath else { return nil }
        return bindObject?.value(forKey: keyPath)
    }
    
    public func refreshBindings(){
        guard let selected = getBindingValue() as? [T] else { return }
        
        rows.eachWithIndex { row, index in
            (row as! UselesSelectRow).selected = selected.contains(index as! T)
        }
    }
    
    public override func updateBinding() {
        guard let object = bindObject, let keyPath = bindKeyPath else { return }

        let values = rows.mapWithIndex { row, index in
            return (row as! UselesSelectRow).selected ? index : -999
        }.reject { $0 == -999 }
        
        object.setValue(values, forKey: keyPath)
    }
}
