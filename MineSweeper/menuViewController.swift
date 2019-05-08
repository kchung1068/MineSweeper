//
//  menuViewController.swift
//  MineSweeper
//
//  Created by zach calcagno on 5/8/19.
//  Copyright © 2019 Kyle Chung. All rights reserved.
//

import UIKit
import SafariServices

class menuViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func menuHelpButton(_ sender: Any) {
        showSafariMenuVC(for: "https://www.wikihow.com/Play-Minesweeper")
    }
    
    func showSafariMenuVC(for url: String) {
        
        guard let url = URL(string: url) else
            
        {return}
        
        let safariMenuVC = SFSafariViewController(url: url)
        
        present(safariMenuVC, animated: true, completion: nil)
    }
 
}



