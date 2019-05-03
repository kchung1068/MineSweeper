//
//  ViewController.swift
//  MineSweeper
//
//  Created by Kyle Chung, Sam Schuffler, Ryan Kaiser, Zach Calcagno on 5/1/19.
//  Copyright © 2019 Kyle Chung Sam Schuffler, Ryan Kaiser, Zach Calcagno. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var numbers = [1,2,3]
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return numbers.count
    }
    
    
    
    let youLose = UIAlertController(title: "You Lose", message: nil, preferredStyle: .alert)
    let youLoseAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        youLose.addAction(youLoseAction)
    } //test
        
    
    @IBAction func helpButton(_ sender: Any) {
    }

}

