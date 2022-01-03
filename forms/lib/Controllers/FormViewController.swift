import Foundation
import UIKit

// Inspiration:
// https://github.com/xmartlabs/Eureka

public class FormViewController : UITableViewController {
    
    var sections:[Section] = []
    
    public override func viewDidLoad() {
        tableView.register(FormCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .tertiarySystemGroupedBackground
    }
    
    
    //MARK: DATASOURCE
    public override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].rows[indexPath.row].cell(tableView, indexPath: indexPath)
    }
    
    //MARK: DELEGATE
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if sections[indexPath.section].rows[indexPath.row].onSelected(self) {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    public override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if sections[indexPath.section].rows[indexPath.row].onDeselected(self) {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
