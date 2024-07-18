//
//  CupCollectionViewCell.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class CupCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cupImageView: UIImageView! {
        didSet {
            cupImageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
            cupImageView.layer.borderWidth = 1
            cupImageView.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var lblCupTitle: UILabel!
    @IBOutlet weak var lblCupCapacity: UILabel!
    
    override var isSelected: Bool {
        didSet {
            cupImageView.layer.borderColor = isSelected ? UIColor(named: ColorName.waterColor.rawValue)?.cgColor : UIColor.tertiaryLabel.cgColor
            lblCupTitle.textColor = isSelected ? UIColor(named: ColorName.waterColor.rawValue) : UIColor.label
        }
    }
    
    var cupData: CupModel? {
        didSet {
            guard let cupData else { return }
            cupImageView.image = UIImage(named: cupData.imageName.rawValue)
            lblCupTitle.text = cupData.cupTitle
            lblCupCapacity.text = "\(cupData.cupCapicity) ml"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
