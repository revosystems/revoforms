// [ ] DateRow
// [ ] TimeRow
// [ ] ButtonRow
// [x] Description
// [x] Validation
// [ ] Fix TextAreaRow
// [ ] Fix SelectDictRow => keep keys order

import UIKit

class ViewController: FormViewController {

        
    class Model : NSObject {
        @objc var simpleText:String = "Simple Text"
        @objc var innerText:String = "Inner text"
        @objc var number:Double = 10.2
        @objc var isOn:Bool = true
        @objc var isOn2:NSNumber = NSNumber(value:1)
        @objc var step:Int = 4
        @objc var step2:NSNumber = NSNumber(value: 5)
        @objc var option:Int = 1
        @objc var dictOption:Int = 5
        @objc var color:String = "blue"
        @objc var food:Int = 2
        
        @objc var multipleSelect:[Int] = [10]
    }
    
    enum Colors: String, CaseIterable {
        case red, blue, yellow, black, white
    }
    
    enum Food: Int, CaseIterable, CustomStringConvertible {
        case potatoes, tomato, macarroni
        var description: String {
            switch self {
            case .potatoes : return "Potatoes"
            case .tomato : return "Tomato"
            case .macarroni : return "Macarroni"
            }
        }
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
                TextRow("Text Row", placeholder: "Enter the text", value: "My text").validation("required|length:3").bind(myModel, keyPath: "simpleText"),
                NumberRow("Number Row", placeholder: "value", value:2).validation("required|min:3").bind(myModel, keyPath: "number")
            ]),
            Section("Second Section", rows:[
                SwitchRow("Active", description:"A nice switch").bind(myModel, keyPath: "isOn"),
                SwitchRow("Active2", description:"A nice switch").bind(myModel, keyPath: "isOn2"),
                CheckmarkSelectRow("This can be selected"),
                StepperRow("This is a long title text that should be cutted in just two lines").bind(myModel, keyPath: "step"),
                StepperRow("A second stepper").bind(myModel, keyPath: "step2")
            ]),
            Section("Third Section", rows:[
                SelectRow("Color", options:["blue", "red", "yellow"]).bind(myModel, keyPath: "option"),
                TextAreaRow("Notes", description: "Here goes the notes"),
                SelectDictRow("Select dict", options:[0 : "Hola", 1: "Selected", 2 : "Patata", 3: "Nowhere"]).bind(myModel, keyPath: "dictOption").allowsNull()
            ]),
            Section("Fourth Section", rows:[
                SelectEnumRow("Color", options: Colors.self).bind(myModel, keyPath: "color"),
                SelectEnumRow("Food", options: Food.self).bind(myModel, keyPath: "food"),
                ControllerRow("Controller", vc:SecondViewController(style: .grouped))
            ]),
            Section("Fifth", rows:[
                InnerSectionsRow("Subsection", sections:[
                    Section("", rows:[
                        TextRow("a text").bind(myModel, keyPath: "innerText")
                    ])
                ])
            ]),
            MultipleSelectSection("Multiple select", options:[
                4 : "Hola",
                8 : "Que",
                10 : "Tal"
            ]).bind(myModel, keyPath: "multipleSelect")
        ]
    }

    @IBAction func onUpdateModelPressed(_ sender: Any) {
        updateBindings()
        print("Simple Text:"    + "\(myModel.simpleText)")
        print("Number:"         + "\(myModel.number)")
        print("IsOn"            + "\(myModel.isOn)")
        print("IsOn2"           + "\(myModel.isOn2)")
        print("Step:"           + "\(myModel.step)")
        print("Step 2:"         + "\(myModel.step2)")
        print("Option:"         + "\(myModel.option)")
        print("DicOption:"      + "\(myModel.dictOption)")
        print("Color:"          + "\(myModel.color)")
        print("Food:"           + "\(myModel.food)")
        print("InnerText:"      + "\(myModel.innerText)")
        print("MultipleSelect:" + "\(myModel.multipleSelect)")
    }
    
}

