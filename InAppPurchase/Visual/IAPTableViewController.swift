import UIKit
import StoreKit

class IAPTableViewController: UITableViewController {
    
    var products = [SKProduct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        IAProducts.store.requestProducts(completionHandler: {
            (status, productsOptional) in
            if status {
                guard let products = productsOptional else { return }
                self.products = products
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! IAPTableViewCell
        cell.product = products[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! IAPTableViewCell
        guard let product = cell.product else { return }
        IAProducts.store.buyProduct(product)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "My In App Purchases - 2018"
    }
}
