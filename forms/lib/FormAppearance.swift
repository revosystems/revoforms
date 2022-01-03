import UIKit

public class FormAppearance
{
    static var shared:FormAppearance = {
        FormAppearance()
    }()
    
    var mainLabelFont:UIFont?
    var mainLabelColor:UIColor?
    
    var detailLabelFont:UIFont?
    var detailLabelColor:UIColor?
}
