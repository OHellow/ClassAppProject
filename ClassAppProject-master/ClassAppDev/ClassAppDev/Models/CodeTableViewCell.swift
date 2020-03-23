//
//  CodeTableViewCell.swift
//  ClassAppDev
//
//  Created by Satsishur on 18.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class CodeTableViewCell: UITableViewCell {

    static let cellid = "CodeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
