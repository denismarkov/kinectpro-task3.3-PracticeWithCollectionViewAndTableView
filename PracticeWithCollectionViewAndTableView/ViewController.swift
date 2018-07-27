//
//  ViewController.swift
//  PracticeWithCollectionViewAndTableView
//
//  Created by Denis Markov on 7/27/18.
//  Copyright © 2018 Denis Markov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataViewControllerDelegate {
    
    
    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var contentView: UIView!
    
    var news: NewsModel?
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        guard let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "TableViewControllerId") as? TableViewController else {
            return nil
        }
        firstChildTabVC.delegate = self
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        guard let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewControllerId") as? CollectionViewController else {
            return nil
        }
        secondChildTabVC.delegate = self
        return secondChildTabVC
    }()
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.secondChildTab.rawValue :
            vc = secondChildTabVC
        default:
            return nil
        }
        
        return vc
    }
    @IBAction func switchTabs(_ sender: UISegmentedControl) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    func didSelectNews(news: NewsModel) {
        self.news = news
        self.performSegue(withIdentifier: "showDetailsSegue", sender: self)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            
            destination.newsData = self.news
        }
    }


}

