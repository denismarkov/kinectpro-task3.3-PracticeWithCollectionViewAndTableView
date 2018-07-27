//
//  DetailsViewController.swift
//  PracticeWithCollectionViewAndTableView
//
//  Created by Denis Markov on 7/27/18.
//  Copyright © 2018 Denis Markov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsDescription: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var newsData: NewsModel?
    
    final let verticalMargins: CGFloat = 40
    
    final let cornerRadius:CGFloat = 8
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var wrapView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderView.layer.cornerRadius = cornerRadius
        wrapView.layer.cornerRadius = cornerRadius
        setScrollContentSize()
        setContentToOutlets()
    }
    
    
    func setScrollContentSize() {
        let descrptionHeight = newsDescription.bounds.height
        let imageHeight = newsImage.bounds.height
        let contentHeight = descrptionHeight + imageHeight + verticalMargins
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentHeight)
    }
    
    func setContentToOutlets() {
        newsImage.image = UIImage(named: newsData?.imageName ?? "Rio3-1-980x699")
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = cornerRadius
        newsDescription.text = newsData?.description ?? "Default description"
    }

}


