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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            cell.cellImageView.image = UIImage(named: "blankBox")
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
        return cell
        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(numbers.count)
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    @objc func tap(sender: UITapGestureRecognizer){
        print("erg")
        present(youLose, animated: true, completion: nil)
    }
    
    var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]
    
    
    let randomNumber = Int.random(in: 0 ... 99)
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    
    
    let youLose = UIAlertController(title: "You Lose", message: nil, preferredStyle: .alert)
    let youLoseAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        youLose.addAction(youLoseAction)
    }
    
    @IBAction func whenTapGesturePressed(_ sender: UITapGestureRecognizer) {
        print("erg")
        present(youLose, animated: true, completion: nil) 
    }
    
    @IBAction func helpButton(_ sender: Any) {
        showSafariVC(for: "https://www.wikihow.com/Play-Minesweeper")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
}

