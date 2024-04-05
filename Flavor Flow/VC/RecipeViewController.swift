//
//  RecipeViewController.swift
//  Flavor Flow
//
//  Created by Nishanththarun on 29/03/24.
//

import UIKit

class RecipeViewController: UIViewController{
    
    var img: String?
    var lab: String?
    var dishlab: String?
    
        
    @IBOutlet weak var paraLabel: UILabel!
    
    @IBOutlet weak var whiteView: UIView!
    

    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var ingrediendLabel: UILabel!
    
    @IBOutlet weak var resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultImg.image = UIImage(named: img ?? "")
        resultlabel.text = lab ?? "data not found"
        paraLabel.text = dishlab ?? "dish not found"
        whiteView.layer.cornerRadius = 25
        resultImg.layer.cornerRadius = 20
        
        if resultlabel.text == "data not found"{
            ingrediendLabel.text = ""
        }
    }
}
