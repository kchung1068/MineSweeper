//
//  ViewController.swift
//  MineSweeper
//
//  Created by Kyle Chung on 5/1/19.
//  Copyright © 2019 Kyle Chung. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    let youLose = UIAlertController(title: "You Lose", message: nil, preferredStyle: .alert)
    let youLoseAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youLose.addAction(youLoseAction)
    } //test
    @IBAction func helpButton(_ sender: Any) {
    }
    

}

