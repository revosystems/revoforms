import Foundation
import UIKit

public class FormCell : UITableViewCell {
        
    var row:Row!
    
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
        
        selectionStyle   = .none
        accessoryType    = .none
        appearance()
        
        return self
    }
        
    // MARK:- Appearance
    func appearance(){
        
        if let mainLabelFont = row.appearance?.mainLabelFont ?? FormAppearance.shared.mainLabelFont {
            textLabel?.font = mainLabelFont
        }
        
        if let mainLabelColor = row.appearance?.mainLabelColor ?? FormAppearance.shared.mainLabelColor {
            textLabel?.textColor = mainLabelColor
        }
        
        if let detailLabelFont = row.appearance?.detailLabelFont ?? FormAppearance.shared.detailLabelFont {
            detailTextLabel?.font = detailLabelFont
        }
        
        if let detailLabelColor = row.appearance?.detailLabelColor ?? FormAppearance.shared.detailLabelColor {
            detailTextLabel?.textColor = detailLabelColor
        }
    }
    
}
