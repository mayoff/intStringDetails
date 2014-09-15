import UIKit

class MasterModel: NSObject {

    let details: Array<DetailModel>

    override init() {
        details = [ MasterModel.newStringDetailModel(), MasterModel.newIntDetailModel() ]
        super.init()
    }

    private class func newStringDetailModel() -> DetailModel {
        return DetailModel(title: "My String", options: [ "Yellow", "Green", "Blue", "Red" ])
    }

    private class func newIntDetailModel() -> DetailModel {
        let options: Array<Printable> = [ 8, 16, 32, 64 ]
        return DetailModel(title: "My Int", options:options)
    }
   
}
