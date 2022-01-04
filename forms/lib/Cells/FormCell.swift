import Foundation
import UIKit

public class FormCell : UITableViewCell {
        
    var row:Row?
    var component:UIView?
        
    // MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Setup
    func setup(_ row:Row) -> Self {
        self.row              = row
        textLabel?.text       = (row.appearance ?? FormAppearance.shared).addNewLinesToTitle(row.title)

        textLabel?.numberOfLines = 0
        //textLabel?.widthAnchor.constraint(equalToConstant: 80).isActive = true
        detailTextLabel?.text = row.detail

        appearance()
        addDescription()

        selectionStyle   = .none
        accessoryType    = .none
        component?.removeFromSuperview()

        return self
    }
    
    func addDescription(){
        if let desc = row?.description {
            highlightBoldWordAtLabel(textViewTotransform: textLabel!, completeText: ((textLabel?.text ?? "") + "\n" + desc), wordToBold: desc)
        }
    }
        
    // MARK:- Appearance
    func appearance(){
        
        if let mainLabelFont = row?.appearance?.mainLabelFont ?? FormAppearance.shared.mainLabelFont {
            textLabel?.font = mainLabelFont
        }
        
        if let mainLabelColor = row?.appearance?.mainLabelColor ?? FormAppearance.shared.mainLabelColor {
            textLabel?.textColor = mainLabelColor
        }
        
        if let detailLabelFont = row?.appearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            detailTextLabel?.font = detailLabelFont
        }
        
        if let detailLabelColor = row?.appearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            detailTextLabel?.textColor = detailLabelColor
        }                
    }
    
    func highlightBoldWordAtLabel(textViewTotransform: UILabel, completeText: String, wordToBold: String){
        textViewTotransform.text = completeText
        
                
        let attribute = NSMutableAttributedString.init(string: completeText)
    
        let titleRange = (completeText as NSString).range(of: row?.title ?? "")
        let titleFont  = row?.appearance?.mainLabelFont ?? FormAppearance.shared.mainLabelFont ?? UIFont.systemFont(ofSize: 14)
        let titleColor = row?.appearance?.mainLabelColor ?? FormAppearance.shared.mainLabelColor ?? UIColor.lightGray
        
        attribute.addAttribute(NSAttributedString.Key.font, value: titleFont, range: titleRange)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor , range: titleRange)
    
        let descRange = (completeText as NSString).range(of: wordToBold)
        let descFont  = row?.appearance?.descriptionLabelFont ?? FormAppearance.shared.descriptionLabelFont ?? UIFont.systemFont(ofSize: 13)
        let descColor = row?.appearance?.descriptionLabelColor ?? FormAppearance.shared.descriptionLabelColor ?? UIColor.lightGray
        
        attribute.addAttribute(NSAttributedString.Key.font, value: descFont, range: descRange)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: descColor ,range: descRange)
        textViewTotransform.attributedText = attribute
    }
    
}


public extension String {
    func setColor(_ color: UIColor, ofSubstring substring: String) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: substring)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return attributedString
    }
}
