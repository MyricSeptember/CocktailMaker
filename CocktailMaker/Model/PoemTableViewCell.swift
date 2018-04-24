//
//  PoemTableViewCell.swift
//  CocktailMaker
//
//  Created by Pieter Venter on 4/24/18.
//  Copyright © 2018 myric. All rights reserved.
//

import UIKit

class PoemTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var poemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
