import UIKit
import StoreKit

class IAPTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    
    var product: SKProduct? {
        didSet {
            guard let name = product?.localizedTitle else { return }
            productName.text = name
        }
    }
}
