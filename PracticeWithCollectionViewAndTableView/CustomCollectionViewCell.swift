//
//  CustomCollectionViewCell.swift
//  PracticeWithCollectionViewAndTableView
//
//  Created by Denis Markov on 7/27/18.
//  Copyright © 2018 Denis Markov. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    
    func initCell(image: String?, title: String?, description: String?) {
        newsImage.image = UIImage(named: image ?? "Rio3-1-980x699")
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = newsImage.bounds.height / 2
        newsTitle.text = title
        newsDescription.text = description ?? "Default description"
    }
}
