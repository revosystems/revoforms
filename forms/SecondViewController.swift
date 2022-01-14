import Foundation

class SecondViewController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            Section("Test", rows:[
                InfoRow("Hola", description: "Que tal")
            ])
        ]
    }
    
}
