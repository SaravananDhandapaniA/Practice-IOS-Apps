//
//  ViewController.swift
//  Application1
//
//  Created by Tringapps on 21/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    let greets=["How are you","Hope all fine","Thank You","Welcome All"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let randomNumber = Int.random(in: 0...(greets.count-1))
        label.text = greets[randomNumber]
    }
}

