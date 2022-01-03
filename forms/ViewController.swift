//
//  ViewController.swift
//  forms
//
//  Created by Jordi Puigdellívol on 3/1/22.
//

import UIKit

class ViewController: FormViewController {

    override func viewDidLoad() {
        
        FormAppearance.shared.mainLabelFont = UIFont.systemFont(ofSize: 12)
        FormAppearance.shared.mainLabelColor = .darkGray
        
        FormAppearance.shared.detailLabelFont = UIFont.systemFont(ofSize: 12)
        FormAppearance.shared.detailLabelColor = .lightGray
    
                
        super.viewDidLoad()
        self.sections = [
            Section(rows:[
                Row("Info Row",     detail: "Here goes the info"),
                TextRow("Text Row", placeholder: "Enter the text")
            ]),
            Section("Second Section", rows:[
                SwitchRow("Active"),
                SelectRow("This can be selected"),
                StepperRow("This is a long title text that should be cutted in just two lines")
            ])
        ]
    }


}

