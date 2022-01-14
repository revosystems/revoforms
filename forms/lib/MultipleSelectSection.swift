import Foundation

open class MultipleSelectSection<T:Comparable&Hashable> : Section {
        
    var bindObject:NSObject?
    var bindKeyPath:String?
    var options:[T:String]
    
    var keysSorted : [T] {
        (Array(options.keys)).sorted()
    }
    
    public init(_ title: String? = nil, options: [T:String]) {
        self.options = options
        super.init(title, rows: [])
        rows = keysSorted.map {
            CheckmarkSelectRow(options[$0]!)
        }
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
            (row as! CheckmarkSelectRow).selected = selected.contains(keysSorted[index])
        }
    }
    
    public override func updateBinding() {
        guard let object = bindObject, let keyPath = bindKeyPath else { return }

        let values = rows.mapWithIndex { row, index in
            return (row as! CheckmarkSelectRow).selected ? keysSorted[index] : nil
        }.reject { $0 == nil }
        
        object.setValue(values, forKey: keyPath)
    }
}
