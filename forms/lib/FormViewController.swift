import Foundation
import UIKit

public class FormViewController : UITableViewController {
    
    var sections:[Section] = []
    
    public override func viewDidLoad() {
        tableView.register(FormCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    
    //MARK: DATASOURCE
    public override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].rows[indexPath.row].cell(tableView, indexPath: indexPath)
    }
    
    //MARK: DELEGATE
    
    
}
