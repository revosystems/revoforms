import UIKit
import RevoFoundation

public class FormAppearance
{
    static var shared:FormAppearance = {
        FormAppearance()
    }()
    
    var mainLabelFont:UIFont?
    var mainLabelColor:UIColor?
    
    var detailLabelFont:UIFont?
    var detailLabelColor:UIColor?
    
    var descriptionLabelFont:UIFont?
    var descriptionLabelColor:UIColor?
    
    var maxTitleLength = 35
    
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
