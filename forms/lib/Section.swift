import Foundation
import UIKit

public class Section {
    
    var title:String? = nil
    var rows:[Row]
    
    init(_ title:String? = nil, rows:[Row] = []) {
        self.title = title
        self.rows = rows
    }
}
