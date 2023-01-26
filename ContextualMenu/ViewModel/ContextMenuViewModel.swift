//
//  ContextMenuViewModel.swift
//  ContextMenu
//
//  Created by Thaaranya Subramani on 07/10/22.
//

import Foundation

class ContextMenuViewModel: NSObject {
    func contextViewMode() -> [ContextMenuModel] {
        let image1 = ContextMenuModel(image: "image1")
        let image2 = ContextMenuModel(image: "image2")
        let image3 = ContextMenuModel(image: "image3")
        let image4 = ContextMenuModel(image: "image4")
        let image5 = ContextMenuModel(image: "image5")
        let image6 = ContextMenuModel(image: "image6")
        let image7 = ContextMenuModel(image: "image7")
        let image8 = ContextMenuModel(image: "image8")
        
        return [image1, image2, image3, image4, image5, image6, image7, image8]
    }
}
class ListViewModel: NSObject {
    
    func ListProductModel() -> [ProfileDetails] {
        let List1 = ProfileDetails(name: "Enginer", profileImage: "person1", role: "Developer")
        let List2 = ProfileDetails(name: "Doctor", profileImage: "person2", role: "Developer")
        let List3 = ProfileDetails(name: "Anaesthesia", profileImage: "person3", role: "Developer")
        let List4 = ProfileDetails(name: "Oncology", profileImage: "person5", role: "Developer")
        let List5 = ProfileDetails(name: "Radiology", profileImage: "person6", role: "Developer")
        let List6 = ProfileDetails(name: "Paediatrics", profileImage: "person7", role: "Developer")
        
        return [List1, List2, List3, List4, List5, List6]
    }
}


