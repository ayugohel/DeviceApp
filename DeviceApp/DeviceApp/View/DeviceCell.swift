//
//  DeviceCell.swift
//  DeviceApp
//
//  Created by Ayushi on 2022-04-23.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var imgDevice: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var viewBG: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgDevice.layer.cornerRadius = imgDevice.frame.height / 2
        self.viewBG.layer.cornerRadius = 8
        self.viewBG.layer.shadowOffset = CGSize.zero
        self.viewBG.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        self.viewBG.layer.shadowOpacity = 0.3
        self.viewBG.layer.shadowRadius = 4
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(cellVM: DeviceModel) {
        self.imgDevice.image = UIImage(named: cellVM.imageURL)
        self.titleLabel.text = cellVM.title

        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.darkGray, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let attributedString1 = NSMutableAttributedString(string: "Status: ", attributes:attrs1)
        attributedString1.append(NSMutableAttributedString(string: cellVM.status, attributes:attrs2))
        self.statusLabel.attributedText = attributedString1
    }

}
