//
//  CollectionViewController.swift
//  PracticeWithCollectionViewAndTableView
//
//  Created by Denis Markov on 7/27/18.
//  Copyright © 2018 Denis Markov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CustomCollectionCell"

class CollectionViewController: UICollectionViewController {
    
    final let newsArray = NewsData().newsArray
    
    final let oddColor = UIColor.init(red: 169/255, green: 195/255, blue: 224/255, alpha: 1)
    
    final let evenColor = UIColor.init(red: 192/255, green: 177/255, blue: 212/255, alpha: 1)
    
    final let colllectionItemWidth = 120
    
    final let collectionItemHeight = 200
    
    final let collectionItemPadding: CGFloat = 5
    
    final let cornerRadius: CGFloat = 8
    
    var delegate: DataViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellSize = CGSize(width: colllectionItemWidth , height: collectionItemHeight)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: collectionItemPadding, left: collectionItemPadding, bottom: collectionItemPadding, right: collectionItemPadding)
        layout.minimumLineSpacing = collectionItemPadding
        layout.minimumInteritemSpacing = collectionItemPadding
        collectionView?.setCollectionViewLayout(layout, animated: true)
        collectionView?.reloadData()
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            print("bag here")
            return UICollectionViewCell()
        }
        let cellData = newsArray[indexPath.row]
        let cellTitle = "News #\(cellData.number ?? "Default title")"
        cell.initCell(image: cellData.imageName, title: cellTitle, description: cellData.description)
        
        cell.layer.cornerRadius = cornerRadius
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = oddColor
        } else {
            cell.backgroundColor = evenColor
        }
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        delegate?.didSelectNews(news: newsArray[indexPath.row])
    }

}
