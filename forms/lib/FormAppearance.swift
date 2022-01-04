import UIKit
import RevoFoundation

public class FormAppearance
{
    public static var shared:FormAppearance = {
        FormAppearance()
    }()
    
    public var mainLabelFont:UIFont?
    public var mainLabelColor:UIColor?
    
    public var detailLabelFont:UIFont?
    public var detailLabelColor:UIColor?
    
    public var descriptionLabelFont:UIFont?
    public var descriptionLabelColor:UIColor?
    
    public var maxTitleLength = 35
    
    func addNewLinesToTitle(_ string:String) -> String {
        var count = 0
        let words = string.split(separator: " ")
        var newTitle:String = ""
        for word in words {
            count += word.count
            if (count >= maxTitleLength) {
                newTitle += "\n"
                count = 0
            }
            newTitle += word + " "
        }
        return newTitle.trim()
    }
}
