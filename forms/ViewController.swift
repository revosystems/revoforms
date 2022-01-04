// [ ] DateRow
// [ ] TimeRow
// [ ] ButtonRow
// [x] Description
// [x] Validation
// [ ] Fix TextAreaRow

import UIKit

class ViewController: FormViewController {

        
    class Model : NSObject {
        @objc var simpleText:String = "Simple Text"
        @objc var isOn:Bool = true
        @objc var isOn2:NSNumber = NSNumber(value:1)
        @objc var step:Int = 4
        @objc var step2:NSNumber = NSNumber(value: 5)
        @objc var option:Int = 1
    }
    
    
    var myModel = Model()
    
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
                TextRow("Text Row", placeholder: "Enter the text", value: "My text").validation("required|length:3").bind(myModel, keyPath: "simpleText")
            ]),
            Section("Second Section", rows:[
                SwitchRow("Active", description:"A nice switch").bind(myModel, keyPath: "isOn"),
                SwitchRow("Active2", description:"A nice switch").bind(myModel, keyPath: "isOn2"),
                UselesSelectRow("This can be selected"),
                StepperRow("This is a long title text that should be cutted in just two lines").bind(myModel, keyPath: "step"),
                StepperRow("A second stepper").bind(myModel, keyPath: "step2")
            ]),
            Section("Third Section", rows:[
                SelectRow("Color", options:["blue", "red", "yellow"]).bind(myModel, keyPath: "option"),
                TextAreaRow("Notes", description: "Here goes the notes"),
            ])
        ]
    }

    @IBAction func onUpdateModelPressed(_ sender: Any) {
        updateBindings()
        print(myModel.simpleText)
        print(myModel.isOn)
        print(myModel.isOn2)
        print(myModel.step)
        print(myModel.step2)
        print(myModel.option)
    }
    
}

