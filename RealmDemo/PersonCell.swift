//
//  PersonCell.swift
//  RealmDemo
//
//  Created by Murat Yıldırım on 7.05.2023.
//

import UIKit

class PersonCell: UITableViewCell {
  // MARK: IBOutlet
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
