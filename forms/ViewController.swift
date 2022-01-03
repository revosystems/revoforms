// [ ] DateRow
// [ ] TimeRow
// [ ] ButtonRow
// [x] Description
// [x] Validation
// [ ] Fix TextAreaRow

import UIKit

class ViewController: FormViewController {

    
    class Model {
        var simpleText:String = "Simple Text"
    }
    
    
    override func viewDidLoad() {
        
        FormAppearance.shared.mainLabelFont = UIFont.systemFont(ofSize: 12)
        FormAppearance.shared.mainLabelColor = .darkGray
        
        FormAppearance.shared.detailLabelFont = UIFont.systemFont(ofSize: 12)
        FormAppearance.shared.detailLabelColor = .lightGray
        
        FormAppearance.shared.descriptionLabelFont = UIFont.systemFont(ofSize: 10)
        FormAppearance.shared.descriptionLabelColor = .lightGray
    
                
        super.viewDidLoad()
        self.sections = [
            Section(rows:[
                InfoRow("Info Row", detail: "Here goes the info"),
                TextRow("Text Row", placeholder: "Enter the text", value: "My text").validation("required|length:3")
            ]),
            Section("Second Section", rows:[
                SwitchRow("Active", description:"A nice switch"),
                UselesSelectRow("This can be selected"),
                StepperRow("This is a long title text that should be cutted in just two lines")
            ]),
            Section("Third Section", rows:[
                SelectRow("Color", options:["blue", "red", "yellow"]),
                //TextAreaRow("Notes", description: "Here goes the notes"),
            ])

        ]
    }


}

