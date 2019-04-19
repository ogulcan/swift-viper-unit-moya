//
//  ListCell.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    func set(for item: Actor) {
        self.nameLabel.text = item.name
        self.popularityLabel.text = "\(item.popularity)"
    }
}
