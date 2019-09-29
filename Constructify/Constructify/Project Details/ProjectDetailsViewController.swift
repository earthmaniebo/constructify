//
//  ProjectDetailsViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {

    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        projectNameLabel.text = gSelectedProject.name
        areaNameLabel.text = gOrderRequest.pendingRequests[0].areaName
    }
        
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
}


extension ProjectDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gOrderRequest.currentInventory.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        cell.progressBar.borderWidth = 0
        cell.nameLabel.text = gOrderRequest.currentInventory[indexPath.item].className

        let materials = gOrderRequest.currentInventory[indexPath.item].materials
        
        var totalCurrentQty = 0
        var totalInitialQty = 0
        for mt in materials! {
            totalCurrentQty += mt.currentQuantity
            totalInitialQty += mt.initialQuantity
        }
        
        let percentage = NSDecimalNumber(value: totalCurrentQty).dividing(by: NSDecimalNumber(value: totalInitialQty))
        
        let percentageText = Double(truncating: percentage.multiplying(by: 100)).rounded()
        cell.outOfLabel.text = "\(totalCurrentQty) of \(totalInitialQty)"
        cell.percentageLabel.text = "\(String(format:"%.f", percentageText))%"
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
            cell.imageView.image = UIImage(named: "electrical")
        case 1:
            cell.imageView.image = UIImage(named: "carpentry")
        case 2:
            cell.imageView.image = UIImage(named: "misc")
        default:
            print()
        }
        return cell
    }
}


extension ProjectDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gSelectedCurrentInventory = gOrderRequest.currentInventory[indexPath.item]
        performSegue(withIdentifier: "classDetailsSegue", sender: self)
    }
}


extension ProjectDetailsViewController: UICollectionViewDelegateFlowLayout {
    
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
