//
//  PhoneTableViewCell.swift
//  QuizPhone
//
//  Created by Muhammad Hilmy Fauzi on 25/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class PhoneTableViewCell: UITableViewCell {

    @IBOutlet weak var LabelPhone: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelMerk: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
