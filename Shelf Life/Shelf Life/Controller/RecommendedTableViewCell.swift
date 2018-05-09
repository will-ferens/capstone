//
//  RecommendedTableViewCell.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/9/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var author: UILabel!
    
    
    @IBOutlet weak var cover: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
