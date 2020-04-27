//
//  EmbeddedCell.swift
//  UBottomSheet_Example
//
//  Created by ugur on 27.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class EmbeddedCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [CollectionModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        
        if #available(iOS 13.0, *) {
            items.append(CollectionModel(image: UIImage(systemName: "house.fill"), title: "Home"))
            items.append(CollectionModel(image: UIImage(systemName: "briefcase.fill"), title: "Work"))
            items.append(CollectionModel(image: UIImage(systemName: "plus"), title: "Add"))
        } else {
            items.append(CollectionModel(image: #imageLiteral(resourceName: "heart_icon"), title: "Home"))
            items.append(CollectionModel(image: #imageLiteral(resourceName: "heart_icon"), title: "Work"))
            items.append(CollectionModel(image: #imageLiteral(resourceName: "heart_icon"), title: "Add"))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCollectionCell", for: indexPath) as! SimpleCollectionCell
        cell.configure(with: items[indexPath.item])
        return cell
    }

}
