import Foundation
import UIKit

public class FormCell : UITableViewCell {
        
    var row:Row?
    var customAppearance:FormAppearance?
    
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
        textLabel?.text       = row.title
        detailTextLabel?.text = row.detail
        
        selectionStyle        = .none
        appearance()
        
        return self
    }
    
    // MARK:- Appearance
    func appearance(){
        
        if let mainLabelFont = customAppearance?.mainLabelFont ?? FormAppearance.shared.mainLabelFont {
            textLabel?.font = mainLabelFont
        }
        
        if let mainLabelColor = customAppearance?.mainLabelColor ?? FormAppearance.shared.mainLabelColor {
            textLabel?.textColor = mainLabelColor
        }
        
        if let detailLabelFont = customAppearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            detailTextLabel?.font = detailLabelFont
        }
        
        if let detailLabelColor = customAppearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            detailTextLabel?.textColor = detailLabelColor
        }
    }
    
}
