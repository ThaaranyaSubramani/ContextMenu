//
//  CollectionViewController.swift
//  ContextualMenu
//
//  Created by Thaaranya Subramani on 25/01/23.
//
import UIKit
import Foundation

class CollectionViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionviewContextMenu: UICollectionView!

    // MARK: - Initilize
    var contextMenuModel :[ContextMenuModel] = []
    var contextMenuViewModel =  ContextMenuViewModel()
    var favorite = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        collectionviewContextMenu.register(UINib(nibName: "ContextCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContextCollectionViewCell")
        contextMenuModel = contextMenuViewModel.contextViewMode()
        collectionviewContextMenu.delegate = self
        collectionviewContextMenu.dataSource = self
        collectionviewContextMenu.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contextMenuModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ContextCollectionViewCell", for: indexPath)as! ContextCollectionViewCell
        cell.configUI(itemDetailsModel: contextMenuModel[indexPath.row] )
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(collectionView.bounds.width/3) - 10, height:  Int(collectionView.bounds.width/3))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
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

