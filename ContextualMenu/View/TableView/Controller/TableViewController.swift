//
//  TableViewController.swift
//  ContextualMenu
//
//  Created by Thaaranya Subramani on 25/01/23.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableviewList: UITableView!
    
    var profileDetails :[ProfileDetails] = []
    var listViewModel = ListViewModel()
    var favorite = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        tableviewList.register(UINib(nibName: "ContextTableViewCell", bundle: nil), forCellReuseIdentifier: "ContextTableViewCell")
        profileDetails = listViewModel.ListProductModel()
        tableviewList.delegate = self
        tableviewList.dataSource = self
        tableviewList.reloadData()
        
    }
}
extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ContextTableViewCell", for: indexPath) as! ContextTableViewCell
        cell.configiUi(itemDetailsModel: profileDetails[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 15
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.shadowColor = UIColor.black.cgColor
        maskLayer.shadowOpacity = 0.5
        maskLayer.shadowOffset = CGSize(width: 0, height: 1)
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ collectionView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            
            let openAction = UIAction(title: "Open",
                                image: UIImage(systemName: "link"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                print("open tapped")
            }
            let favoriteAction = UIAction(title: self.favorite.contains(indexPath.row) == true ? "Remove Favorite" : "Favorite",
                                image: UIImage(systemName: "star"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { [weak self] _ in
                if self?.favorite.contains(indexPath.row) == true{
                    self?.favorite.removeAll(where: { $0 == indexPath.row})
                }else{
                    self?.favorite.append(indexPath.row)
                }
                print("Favorite added")
            }
            let searchAction = UIAction(title: "Search",
                                image: UIImage(systemName: "magnifyingglass"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                print("Search")
            }
            
            return UIMenu(title: "Actions",
                          subtitle: nil,
                          image: nil,
                          identifier: nil,
                          options: UIMenu.Options.displayInline,
                          children: [openAction, favoriteAction, searchAction]
            )
        }
        return config
    }
    
    
}
