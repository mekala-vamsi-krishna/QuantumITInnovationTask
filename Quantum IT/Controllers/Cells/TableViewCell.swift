//
//  TableViewCell.swift
//  Quantum IT
//
//  Created by Mekala Vamsi Krishna on 22/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index: Int?
    var cartItems: [ProductData]?
    var onDeleteCartClick: ((Int) ->())?
    
    
    func setup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        cardView.cardView(cornerRadius: 0)
        categoryNameLabel.text = cartItems?.first?.category.rawValue
        categoryNameLabel.underline()
        guard let cartItems = cartItems else{return}
        let cartPrice = cartItems.reduce(0) { partialResult, productData in
            partialResult + productData.discountedPrice
        }
        cartPriceLabel.text = "₹\(cartPrice)"
        
    }
    
    @IBAction func DeleteBtnTapped(_ sender: Any) {
        print("Clicked delete button")
        if let index{
            onDeleteCartClick?(index)
        }
    }
    
    @IBAction func CheckoutBtnTapped(_ sender: Any) {
        print("checked out")
    }

}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(product: cartItems![indexPath.row])
        return cell
    }
    
}


class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productUnitNameLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    
    func setup(product: ProductData){
        cardView.cardView()
        cardView.backgroundColor = .white
        productNameLabel.text = product.name
        productImageView.loadImage(url: product.imageURL)
        productUnitNameLabel.text = product.unitName
        actualPriceLabel.attributedText = "₹\(product.actualPrice)".strikeThrough()
        discountedPriceLabel.text = "₹\(product.discountedPrice)"
        
    }
}
