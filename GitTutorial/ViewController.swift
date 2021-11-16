//
//  ViewController.swift
//  GitTutorial
//
//  Created by 廖翔 on 2021/11/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reverseLabel: UILabel!
    let message = "Hello Git!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(message)
        
        let reversed = reverse(text: "stressed")
        print(reversed)
        reverseLabel.text = reversed
        
    }

    func reverse(text: String) -> String {
        return String(text.reversed())
    }
}

