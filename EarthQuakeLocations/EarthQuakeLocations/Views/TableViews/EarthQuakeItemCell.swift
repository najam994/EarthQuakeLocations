//
//  EarthQuakeItemCell.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 07/08/2021.
//

import UIKit

class EarthQuakeItemCell: UITableViewCell {
    
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var warningImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(earthQuakeItem: EarthQuakeItem) {
        self.dateTimeLabel.text = earthQuakeItem.datetime
        self.magnitudeLabel.text = String(earthQuakeItem.magnitude)
        if (earthQuakeItem.magnitude >= 8.0){
            self.warningImage.alpha = 1.0
        } else {
            self.warningImage.alpha = 0.0
        }
    }

}
