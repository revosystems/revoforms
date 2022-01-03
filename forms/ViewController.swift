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
        FormAppearance.shared.mainLabelColor = .red
        
        FormAppearance.shared.detailLabelFont = UIFont.systemFont(ofSize: 12)
        FormAppearance.shared.detailLabelColor = .blue
        
        super.viewDidLoad()
        self.sections = [
            Section([
                InfoRow("Title", detail: "Detail")
            ])
        ]
    }


}

