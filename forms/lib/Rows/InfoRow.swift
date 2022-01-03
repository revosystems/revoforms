import Foundation
import UIKit

public class InfoRow : Row{
 
    init(_ title:String, description:String? = nil, detail:String? = nil){
        super.init(title, description:description)
        self.detail = detail
    }
    
}
