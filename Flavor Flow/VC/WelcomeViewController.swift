//
//  ViewController.swift
//  Flavor Flow
//
//  Created by Nishanththarun on 28/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var cookBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cookBtn.titleLabel?.textAlignment = .center
    }

    @IBAction func OnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "connect", sender: nil)
    }
    
}

