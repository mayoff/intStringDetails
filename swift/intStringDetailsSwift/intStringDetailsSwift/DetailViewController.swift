import UIKit

class DetailViewController: UITableViewController {

    var model: DetailModel? {
        didSet {
            navigationItem.title = "Select " + model!.title
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.options.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("option", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = model!.options[indexPath.row].description
        if (model!.selectedOptionIndex == indexPath.row) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let priorSelectedCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: model!.selectedOptionIndex, inSection: 0))
        priorSelectedCell?.accessoryType = .None
        model!.selectedOptionIndex = indexPath.row
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell?.accessoryType = .Checkmark
    }

}
