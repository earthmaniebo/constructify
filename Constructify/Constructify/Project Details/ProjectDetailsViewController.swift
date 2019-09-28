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
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


extension ProjectDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        cell.progressBar.borderWidth = 0
        switch indexPath.item {
        case 0:
            cell.progressBar.setProgress(0.96, animated: true)
            cell.progressBar.primaryColor = ConColors.greenProgress.uiColor
            cell.nameLabel.text = "Electrical"
            cell.percentageLabel.text = "96%"
            cell.outOfLabel.text = "3000 of 3125"
        case 1:
            cell.progressBar.setProgress(0.30, animated: true)
            cell.progressBar.primaryColor = ConColors.orangeProgress.uiColor
            cell.nameLabel.text = "Carpentry"
            cell.percentageLabel.text = "30%"
            cell.outOfLabel.text = "30 of 100"
            cell.imageView.image = UIImage(named: "carpentry")
        case 2:
            cell.progressBar.setProgress(0.10, animated: true)
            cell.progressBar.primaryColor = ConColors.redProgress.uiColor
            cell.nameLabel.text = "Miscellaneous"
            cell.percentageLabel.text = "10%"
            cell.outOfLabel.text = "100 of 1000"
            cell.imageView.image = UIImage(named: "misc")
            cell.replenishButton.isHidden = false
        default:
            print()
        }
        return cell
    }
}


extension ProjectDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            performSegue(withIdentifier: "classDetailsSegue", sender: self)
        }
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
