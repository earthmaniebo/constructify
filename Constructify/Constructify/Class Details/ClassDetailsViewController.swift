//
//  ClassDetailsViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit

class ClassDetailsViewController: UIViewController {

    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.text = gSelectedCurrentInventory.className
        typeNameLabel.text = gSelectedCurrentInventory.className
    }

}


extension ClassDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gSelectedCurrentInventory.materials.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        cell.progressBar.borderWidth = 0
        cell.percentageLabel.isHidden = true
        cell.nameLabel.text = gSelectedCurrentInventory.materials[indexPath.item].name
        cell.outOfLabel.text = "\(gSelectedCurrentInventory.materials[indexPath.item].currentQuantity!) of \(gSelectedCurrentInventory.materials[indexPath.item].initialQuantity!)"
        
        let percentage = NSDecimalNumber(value: gSelectedCurrentInventory.materials[indexPath.item].currentQuantity!).dividing(by: NSDecimalNumber(value: gSelectedCurrentInventory.materials[indexPath.item].initialQuantity!))
        
        cell.progressBar.setProgress(CGFloat(truncating: percentage), animated: true)
        if CGFloat(truncating: percentage) >= 0.6 {
            cell.progressBar.primaryColor = ConColors.greenProgress.uiColor
        } else if CGFloat(truncating: percentage) < 0.6 && CFloat(truncating: percentage) > 0.3 {
            cell.progressBar.primaryColor = ConColors.orangeProgress.uiColor
        } else {
            cell.progressBar.primaryColor = ConColors.redProgress.uiColor
            cell.replenishButton.isHidden = false
        }
        
        switch indexPath.item {
        case 0:
            cell.imageView.image = UIImage(named: "pumpkins")
        case 1:
            cell.imageView.image = UIImage(named: "grassy_leaves")
        case 2:
            cell.imageView.image = UIImage(named: "money_plants")
        case 3:
            cell.imageView.image = UIImage(named: "thistle")
        default:
            print()
        }
        return cell
    }
}


extension ClassDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            performSegue(withIdentifier: "supplyDetailsSegue", sender: self)
        }
    }
}


extension ClassDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 94)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
