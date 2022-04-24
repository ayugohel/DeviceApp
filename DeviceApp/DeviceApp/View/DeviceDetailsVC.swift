//
//  DeviceDetailsVC.swift
//  DeviceApp
//
//  Created by Ayushi on 2022-04-23.
//

import UIKit

class DeviceDetailsVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var imgDevice: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var OSLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!

    //MARK: Variables
    var deviceData : DeviceModel?

    
    //MARK: View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    

    
    //MARK: Private Methods

    private func setupData() {
        self.imgDevice.image = UIImage(named: deviceData?.imageURL ?? "")

        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.darkGray, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        
        let attributedName = NSMutableAttributedString(string: "Name: ", attributes:attrs1)
        attributedName.append(NSMutableAttributedString(string: deviceData?.title ?? "", attributes:attrs2))
        self.titleLabel.attributedText = attributedName
        
        let attributedOS = NSMutableAttributedString(string: "OS: ", attributes:attrs1)
        attributedOS.append(NSMutableAttributedString(string: deviceData?.os ?? "", attributes:attrs2))
        self.OSLabel.attributedText = attributedOS
        
        let attributedStatus = NSMutableAttributedString(string: "Status: ", attributes:attrs1)
        attributedStatus.append(NSMutableAttributedString(string: deviceData?.status ?? "", attributes:attrs2))
        self.statusLabel.attributedText = attributedStatus
        
        let attributedPrice = NSMutableAttributedString(string: "Price: ", attributes:attrs1)
        attributedPrice.append(NSMutableAttributedString(string:  "\(deviceData?.price ?? 0) \(deviceData?.currency ?? "")", attributes:attrs2))
        self.priceLabel.attributedText = attributedPrice
        
        let attributedSize = NSMutableAttributedString(string: "Size: ", attributes:attrs1)
        attributedSize.append(NSMutableAttributedString(string: deviceData?.size ?? "", attributes:attrs2))
        self.sizeLabel.attributedText = attributedSize
    }

    //MARK: IBActions

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
}
