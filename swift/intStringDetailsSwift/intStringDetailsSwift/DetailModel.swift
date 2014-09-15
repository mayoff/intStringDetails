import UIKit

class DetailModel: NSObject {

    let title: String
    let options: Array<Printable>
    dynamic var selectedOptionIndex: Int

    init(title: String, options: Array<Printable>) {
        self.title = title
        self.options = options
        self.selectedOptionIndex = 0
    }

}
