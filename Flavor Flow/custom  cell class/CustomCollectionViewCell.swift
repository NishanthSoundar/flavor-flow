//
//  CustomCollectionViewCell.swift
//  Flavor Flow
//
//  Created by Nishanththarun on 29/03/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var RecipeImage: UIImageView!
    
    @IBOutlet weak var RecipeTitle: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Make the image view circular
        RecipeImage.layer.cornerRadius = RecipeImage.frame.size.width / 10
        RecipeImage.clipsToBounds = true
    }
    
  
}





