//
//  ViewController.swift
//  MineSweeper
//
//  Created by Kyle Chung, Sam Schuffler, Ryan Kaiser, Zach Calcagno on 5/1/19.
//  Copyright © 2019 Kyle Chung Sam Schuffler, Ryan Kaiser, Zach Calcagno. All rights reserved.
//

import UIKit
import SafariServices
import MapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    var numbers = [1,2,3]
    
    
    let randomNumber = Int.random(in: 0 ... 99)
    
    @IBOutlet var collectionView: UICollectionView!
    
   
    
    
    
    let youLose = UIAlertController(title: "You Lose", message: nil, preferredStyle: .alert)
    let youLoseAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        youLose.addAction(youLoseAction)
    } //test
        
    
    @IBAction func helpButton(_ sender: Any) {
        showSafariVC(for: "https://www.wikihow.com/Play-Minesweeper")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

}

