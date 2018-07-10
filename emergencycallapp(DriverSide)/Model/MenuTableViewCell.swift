//
//  MenuTableViewCell.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/2/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
