import Foundation
import UIKit

// Inspiration:
// https://github.com/xmartlabs/Eureka

open class FormViewController : UITableViewController {
    
    public var sections:[Section] = []
    
    open override func viewDidLoad() {
        tableView.register(FormCell.classForCoder(), forCellReuseIdentifier: "cell")
        if #available(iOS 13, *) {
            tableView.backgroundColor = .tertiarySystemGroupedBackground
        }
    }
    
    
    /**
        This function will update the model associated using the `bind` function in each row
     */
    public func updateBindings(){
        sections.each { section in
            section.updateBinding()
        }
    }
    
    func removeHiddenRows(){
        sections.each{
            $0.rows = $0.rows.reject { $0.hidden }
        }
    }
    
    //MARK: DATASOURCE
    public override func numberOfSections(in tableView: UITableView) -> Int {
        removeHiddenRows()
        return sections.count
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
