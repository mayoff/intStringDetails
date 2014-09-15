import UIKit

class MasterViewController: UITableViewController {

    let model = MasterModel()

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.details.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detail", forIndexPath: indexPath) as MasterCell
        cell.model = model.details[indexPath.row]
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail") {
            prepareForShowDetailSegue(segue, sender:sender)
        }
    }

    private func prepareForShowDetailSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as DetailViewController
        let cell = sender! as MasterCell
        destination.model = cell.model
    }

}
