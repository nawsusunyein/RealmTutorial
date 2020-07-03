//
//  ComicBookTableViewCell.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 7/3/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import UIKit

class ComicBookTableViewCell: UITableViewCell {

    @IBOutlet weak var lblComicTitle : UILabel!
    @IBOutlet weak var lblComicDescription : UILabel!
    @IBOutlet weak var lblComicIssue : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
