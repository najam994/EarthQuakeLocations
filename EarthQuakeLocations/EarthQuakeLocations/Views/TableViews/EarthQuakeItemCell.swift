//
//  EarthQuakeItemCell.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 07/08/2021.
//

import UIKit

class EarthQuakeItemCell: UITableViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var warningImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(earthQuakeItem: EarthQuakeItem) {
        self.dateTimeLabel.text =  earthQuakeItem.datetime.toDate()?.toString() ?? ""
        self.magnitudeLabel.text = "Magnitude: " + String(earthQuakeItem.magnitude)
        if (earthQuakeItem.magnitude >= 8.0){
            self.warningImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
        } else {
            self.warningImage.image = UIImage(systemName: "sleep")
        }
        
    }
}
