//
//  PicCell.swift
//  InstagramLikeApp
//
//  Created by Alonso on 5/1/15.
//  Copyright (c) 2015 Alonso. All rights reserved.
//

import UIKit

class PicCell: PFTableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setElements(picName: String){
        nameLabel.text = picName
    }

}
