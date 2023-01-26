//
//  ContextTableViewCell.swift
//  ContextualMenu
//
//  Created by Thaaranya Subramani on 25/01/23.
//

import UIKit

class ContextTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageviewProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewbg: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configiUi(itemDetailsModel: ProfileDetails){
        viewbg.layer.shadowColor = UIColor.black.cgColor
        viewbg.layer.shadowOpacity = 0.2
        viewbg.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageviewProfile.layer.cornerRadius = imageviewProfile.frame.width/2
        labelName.text = itemDetailsModel.name
        imageviewProfile.image = UIImage(named: itemDetailsModel.profileImage)
    }
}
