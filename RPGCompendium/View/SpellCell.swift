//
//  SpellCell.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SpellCell: UITableViewCell {
    @IBOutlet var spellSchoolImage: UIImageView!
    
    @IBOutlet var spellName: UILabel!
    @IBOutlet var spellSchool: UILabel!
    @IBOutlet var spellClass: UILabel!
    @IBOutlet var spellCellBackground: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        spellCellBackground.image = UIImage(named: "textLabelBG")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
