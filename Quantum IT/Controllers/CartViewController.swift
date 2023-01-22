//
//  ViewController.swift
//  Quantum IT
//
//  Created by Mekala Vamsi Krishna on 22/01/23.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var totalCarts: [CartData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.dataSource = self
        loadSampleData()
        
    }
    
    func loadSampleData(){
        let product1 = ProductData(name: "Kinnaur Apple", imageURL: "https://www.freeiconspng.com/thumbs/apple-png/apple-leaf-clipart-4.png", actualPrice: 199, discountedPrice: 159, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let product2 = ProductData(name: "Yellow Pumpkin", imageURL: "https://jammubasket.com/images/products/1543_pumpkin-yellow-cut-ripe-1-kg-a4c2bf24eee8516ca1661bea7866ff2a.jpeg", actualPrice: 44, discountedPrice: 40, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let product3 = ProductData(name: "Small tiny Grapes", imageURL: "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png", actualPrice: 160, discountedPrice: 110, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let product4 = ProductData(name: "Kiwi", imageURL: "https://www.pngkey.com/png/full/10-100695_free-png-kiwi-fruit-png-png-images-transparent.png", actualPrice: 50, discountedPrice: 45, unitName: "1 pcs", quantity: 1, category: .miniBaskets)
        let cart1Items = [product1, product2, product3, product4]
        let cartTotal = cart1Items.reduce(0){ partialResult, productData in
            partialResult + productData.discountedPrice
            
        }
        let cart1 = CartData(cartItems: cart1Items, cartQuantity: cart1Items.count, cartTotal: cartTotal)
        totalCarts.append(cart1)
        
        let product21 = ProductData(name: "Kurtis", imageURL: "https://siteimages.simplified.co/background-remover/background-remover-embroidered-kurtis-image-2.png", actualPrice: 800, discountedPrice: 400, unitName: "6", quantity: 1, category: .designerHub)
        let product22 = ProductData(name: "Shirt", imageURL: "https://www.pngarts.com/files/4/Polo-Shirt-Transparent-Background-PNG.png", actualPrice: 1000, discountedPrice: 600, unitName: "1", quantity: 1, category: .designerHub)
        let product23 = ProductData(name: "Jeans", imageURL: "https://www.pngmart.com/files/16/Ripped-Jeans-Transparent-Background.png", actualPrice: 3000, discountedPrice: 2000, unitName: "1 kg", quantity: 1, category: .designerHub)
        let cart21Items = [product21, product22, product23]
        let cartTotal2 = cart21Items.reduce(0){ partialResult, productData in
            partialResult + productData.discountedPrice
            
        }
        let cart2 = CartData(cartItems: cart21Items, cartQuantity: cart21Items.count, cartTotal: cartTotal2)
        totalCarts.append(cart2)
    }
}

extension CartViewController {
    
    func setupNavBar(){
        let leftBarItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(onBackClick))
        leftBarItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(image: UIImage(systemName: "house.fill"), style: .plain, target: self, action: #selector(onHomeIconClick))
        rightBarItem.tintColor = .red
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc func onHomeIconClick(){
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func onBackClick(){
        self.tabBarController?.selectedIndex = 0
    }
}


extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        totalCarts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.cartItems = totalCarts[indexPath.row].cartItems
        cell.setup()
        cell.index = indexPath.row
        cell.onDeleteCartClick = { [self] index in
            totalCarts.remove(at: index)
            tableView.reloadData()
        }
        return cell
    }


}

