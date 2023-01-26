//
//  ContextCollectionViewCell.swift
//  ContextMenu
//
//  Created by Thaaranya Subramani on 07/10/22.
//

import UIKit

class ContextCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageviewContext: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configUI(itemDetailsModel: ContextMenuModel){
        imageviewContext.image = UIImage(named: itemDetailsModel.image)
    }
}
