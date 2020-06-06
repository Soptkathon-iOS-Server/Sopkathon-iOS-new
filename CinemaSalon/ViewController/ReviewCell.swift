//
//  ReviewCellTableViewCell.swift
//  CinemaSalon
//
//  Created by 최영재 on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    static let identifier: String = "ReviewCell"
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var reviewTextview: UITextView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
         reviewTextview.layer.cornerRadius = 10.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
