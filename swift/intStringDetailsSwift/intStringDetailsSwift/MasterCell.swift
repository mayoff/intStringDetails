import UIKit

class MasterCell: UITableViewCell {

    var model: DetailModel? {
        willSet {
            disconnectFromModel()
        }
        didSet {
            connectToModel()
            update()
        }
    }

    // Swift doesn't support class variables yet.
    private lazy var selectedOptionIndexContext = UnsafeMutablePointer<Void>.alloc(1)

    private func disconnectFromModel() {
        model?.removeObserver(self, forKeyPath: "selectedOptionIndex", context: selectedOptionIndexContext)
    }

    private func connectToModel() {
        model?.addObserver(self, forKeyPath: "selectedOptionIndex", options: NSKeyValueObservingOptions(), context: selectedOptionIndexContext)
    }

    private class func toUnsafeMutablePointer(p: UnsafeMutablePointer<Void>) -> UnsafeMutablePointer<Void> {
        return p
    }

    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<Void>) {
        if (context == selectedOptionIndexContext) {
            update()
        } else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }

    private func update() {
        if (model != nil) {
            textLabel?.text = model?.title;
            detailTextLabel?.text = (model?.options[model!.selectedOptionIndex])?.description
        }
    }

    deinit {
        disconnectFromModel()
        selectedOptionIndexContext.dealloc(1)
    }

}
