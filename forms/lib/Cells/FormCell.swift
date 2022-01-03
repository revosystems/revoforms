import Foundation
import UIKit

public class FormCell : UITableViewCell {
        
    var row:Row?
    
    var descriptionLabel:UILabel?
    
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
            
        addDescription()
        
        selectionStyle   = .none
        accessoryType    = .none
        appearance()
        
        return self
    }
    
    func addDescription(){
        descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        descriptionLabel!.text = row?.description
        addSubview(descriptionLabel!)
        
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel?.leadingAnchor.constraint(equalTo: textLabel!.leadingAnchor).isActive = true
        
        descriptionLabel?.topAnchor.constraint(equalTo: textLabel!.bottomAnchor, constant: -4).isActive = true
        //descriptionLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        //descriptionLabel?.widthAnchor.constraint(equalTo: textLabel!.widthAnchor).isActive = true
        descriptionLabel?.heightAnchor.constraint(equalToConstant:21).isActive = true
        descriptionLabel?.textAlignment = .left
        
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
        
        if let descriptionLabelFont = row?.appearance?.descriptionLabelFont ?? FormAppearance.shared.descriptionLabelFont {
            descriptionLabel?.font = descriptionLabelFont
        }
        
        if let descriptionLabelColor = row?.appearance?.descriptionLabelColor ?? FormAppearance.shared.descriptionLabelColor {
            descriptionLabel?.textColor = descriptionLabelColor
        }
    }
    
}
