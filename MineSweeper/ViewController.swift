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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    
{
    
    var cells: [CollectionViewCell] = []
    
    var timer:Timer?
    var millisceonds:Float = 120 * 1000
    
    var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]
    
    var sManager = soundManager()
    


    var arrays: [String] = ["blank", "blank", "blank", "1", "Bomb" ,"1" ,"blank", "blank", "blank", "blank", "1", "1","blank","1","1","1","blank","blank","blank","blank","Bomb","2","1","blank","blank","1","1","1","blank","blank","2","Bomb","1","blank","blank","1","Bomb","1","blank","blank","1","1","1","1","1","2","1","1","blank","blank","blank","blank","blank","1","Bomb","1","blank","blank","blank","blank","blank","blank","blank","1","1","1","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","1","1","1","blank","blank","blank","blank","blank","blank","blank","1","Bomb","1","blank","blank","blank","blank","blank","blank","blank","1","1","1"]
    
    
    var blankBoxArray: [String] = ["blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox","blankBox"]
    
    //tag of the cell
    //whats in the array
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!
        CollectionViewCell
        cell.backgroundColor = .darkGray
        cell.cellImageView.image = UIImage(named: "1")
        if indexPath.row % 3 == 0 {
            cell.cellImageView.image = UIImage()
        } else if indexPath.row % 3 == 1 {
            cell.cellImageView.image = UIImage()
        } else if indexPath.row % 3 == 2 {
            cell.cellImageView.image = UIImage()
        }
        cell.tag = indexPath.row
        return cell
        
    }
    
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @objc func timerElapsed(){
        
        millisceonds -= 1
        
        let seconds = String(format: "%.2f", millisceonds/1000)
        
        timerLabel.text = "Time Remaining: \(seconds)"
        
        if millisceonds <= 0 {
            
            
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            //checkGameEnded()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(numbers.count)
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let currentCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        print(currentCell.tag)
        print(arrays[currentCell.tag])
//        arrays.shuffle()
        let formula = UIImage(named: arrays[currentCell.tag])
        currentCell.cellImageView.image = formula
        print(findAdjacentNumbers(selected: currentCell.tag, indexPath: indexPath))
        let aroundArray = findAdjacentNumbers(selected: currentCell.tag, indexPath: indexPath)
        
        if currentCell.cellImageView.image == UIImage(named: "blank") {
        for number in aroundArray {
            
            if UIImage(named: arrays[number]) == UIImage(named: "Bomb") {
                print("")
            } else {
                let currentIndexPath = IndexPath(row: number, section: 0)
          //  let nearbyCell = collectionView.cellForItem(at: currentIndexPath) as! CollectionViewCell
                let ideal = UIImage(named: arrays[currentIndexPath.row])
                if currentCell.isSelected == true {
       //      nearbyCell.cellImageView.image = ideal
                } else {
                    print("")
                }
                }
            
//                nearbyCell.cellImageView.image = UIImage(named: arrays[number])

//                func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//





            
            
            }
        } else if currentCell.cellImageView.image == UIImage(named: "Bomb") {
            sManager.playSound(.explode)
            let alert = UIAlertController(title: "You Lose, Better Luck Next Time", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .destructive) { (restart) in
                let okAction = UIAlertAction(title: "Restart", style: .destructive, handler: nil)
                currentCell.cellImageView.image = UIImage(named: "blankBox")
            }
            alert.addAction(okAction)
            present(alert,animated: true,completion: nil)
        } else if currentCell.cellImageView.image == UIImage(named: "1") || currentCell.cellImageView.image == UIImage(named: "2") || currentCell.cellImageView.image == UIImage(named: "3") {
            print("")
        }
        
        if (arrays[currentCell.tag] ) == String("1"){
            print("Zach is cool")
        }
    
    }
    
    func findAdjacentNumbers(selected: Int, indexPath: IndexPath) -> [Int]  {
        let currentCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        let leftTag = currentCell.tag - 1
        
        
        let rightTag = currentCell.tag + 1
        
        
        let upLeftTag = currentCell.tag - 11
        
        
        let upRightTag = currentCell.tag - 9
        
        
        let upTag = currentCell.tag - 10
        
        
        let downTag = currentCell.tag + 10
        
        
        let downRightTag = currentCell.tag + 11
        
        
        let downLeftTag = currentCell.tag + 9
        
        
        
        
        if currentCell.tag % 10 == 9 && currentCell.tag != 9 && currentCell.tag != 99 {
            let upImage = UIImage(named: arrays[upTag])
            let upLeftImage = UIImage(named: arrays[upLeftTag])
            let leftImage = UIImage(named: arrays[leftTag])
            let downLeftImage = UIImage(named: arrays[downLeftTag])
            let downImage = UIImage(named: arrays[downTag])
            return [upTag, upLeftTag, leftTag, downLeftTag, downTag]
        }
        else if currentCell.tag % 10 == 0 && currentCell.tag != 0 && currentCell.tag != 90 {
            let rightImage = UIImage(named: arrays[rightTag])
            let downRightImage = UIImage(named: arrays[downRightTag])
            let downImage = UIImage(named: arrays[downTag])
            let upImage = UIImage(named: arrays[upTag])
            let upRightImage = UIImage(named: arrays[upRightTag])
            return[rightTag, downRightTag, downTag, upTag, upRightTag]
        }
        else if currentCell.tag > 0 && currentCell.tag < 9 {
            let rightImage = UIImage(named: arrays[rightTag])
            let leftImage = UIImage(named: arrays[leftTag])
            let downLeftImage = UIImage(named: arrays[downLeftTag])
            let downRightImage = UIImage(named: arrays[downRightTag])
            let downImage = UIImage(named: arrays[downTag])
            return[rightTag,leftTag,downLeftTag,downRightTag,downTag]
        } else if currentCell.tag == 0 {
            let rightImage = UIImage(named: arrays[rightTag])
            let downRightImage = UIImage(named: arrays[downRightTag])
            let downImage = UIImage(named: arrays[downTag])
            return[rightTag, downRightTag,downTag]
        } else if currentCell.tag == 9 {
            let leftImage = UIImage(named: arrays[leftTag])
            let downLeftImage = UIImage(named: arrays[downLeftTag])
            let downImage = UIImage(named: arrays[downTag])
            return[leftTag,downLeftTag,downTag]
        } else if currentCell.tag > 90 && currentCell.tag < 99 {
            let leftImage = UIImage(named: arrays[leftTag])
            let upLeftImage = UIImage(named: arrays[upLeftTag])
            let upImage = UIImage(named: arrays[upTag])
            let upRightImage = UIImage(named: arrays[upRightTag])
            let rightImage = UIImage(named: arrays[rightTag])
            return[leftTag, upLeftTag, upTag, upRightTag, rightTag]
        } else if currentCell.tag == 90 {
            let upImage = UIImage(named: arrays[upTag])
            let upRightImage = UIImage(named: arrays[upRightTag])
            let rightImage = UIImage(named: arrays[rightTag])
            return[upTag, upRightTag, rightTag]
        } else if currentCell.tag == 99 {
            let upImage = UIImage(named: arrays[upTag])
            let upLeftImage = UIImage(named: arrays[upLeftTag])
            let leftImage = UIImage(named: arrays[leftTag])
            return[upTag, upLeftTag, leftTag]
        } else {
            return [rightTag, leftTag, upLeftTag, upRightTag, upTag, downRightTag,downLeftTag,downRightTag, downTag]
        }
        
    }
    
    
    
    @objc func tap(sender: UITapGestureRecognizer){
        
        // collectionView.alpha = 0
        
        
    }
    
    
    var hundred = 100
    let randomNumber = Int.random(in: 0 ... 99)
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewTwo: UICollectionView!
    
    
    //let youLose = UIAlertController(title: "You Lose", message: nil, preferredStyle: .alert)
    //let youLoseAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self , selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        for i in 0...9 {
            
            blankBoxArray.insert("bomb", at: Int(arc4random_uniform(UInt32(blankBoxArray.count))))
        
        }
        print(blankBoxArray)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/10.5
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    
    
    
    
    
    @IBAction func whenTapGesturePressed(_ sender: UITapGestureRecognizer) {
        
        // present(youLose, animated: true, completion: nil)
    }
    
    @IBAction func helpButton(_ sender: Any) {
        showSafariVC(for: "https://www.wikihow.com/Play-Minesweeper")
    }
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
   /* func chechGameEnd(){
        
        var message = " "
        var title = " "
    
var isWon = true
        
    
        
    
    if isWon == true{
    if millisceonds > 0 {
    
    timer?.invalidate()}
    
    title = "Congratulations!"
    message = " You've Won"
    
    
    }else{
    
    if millisceonds < 0 {
    return
    }
    title = "Game Over"
    message = " You've lost"
    }
        showAlert(title, message)
}

func showAlert(_ title:String, _ message:String){
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    alert.addAction(alertAction)
    
    present(alert, animated: true, completion: nil)
    
}*/
    




}
