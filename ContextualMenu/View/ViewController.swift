//
//  ViewController.swift
//  ContextualMenu
//
//  Created by Thaaranya Subramani on 21/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewContext: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        viewContext.isUserInteractionEnabled = true
        let interaction = UIContextMenuInteraction(delegate: self)
        viewContext.addInteraction(interaction)
    }
}

extension ViewController: UIContextMenuInteractionDelegate{
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        let actionProvider: ([UIMenuElement]) -> UIMenu? = { _ in
            let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), identifier: UIAction.Identifier(rawValue: "share")) { _ in
                // some action
            }
            let copyAction = UIAction(title: "Copy") { _ in
                // some action
            }
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), identifier: UIAction.Identifier("delete")) { _ in
                // some action
            }
            deleteAction.attributes = [.destructive]
           
            
            return UIMenu(title: "Edit..", image: nil, identifier: nil, children: [shareAction, copyAction, deleteAction])
        }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil,
                                          actionProvider: actionProvider)
    }
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        print("Move to next")
    }
    
}

