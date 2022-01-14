import Foundation
import UIKit

open class Section {
    
    var title:String? = nil
    var rows:[Row]
    
    public init(_ title:String? = nil, rows:[Row] = []) {
        self.title = title
        self.rows = rows
    }
    
    public func updateBinding(){
        rows.each { row in
            row.updateBinding()
        }
    }
}
