//
//  DashboardViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit
import M13ProgressSuite

class DashboardViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProjectCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "projectCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

}


extension DashboardViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as! ProjectCollectionViewCell
        cell.progressBar.borderWidth = 0
        if indexPath.item == 1 {
            cell.progressBar.setProgress(0.8, animated: true)
            cell.progressBar.primaryColor = ConColors.greenProgress.uiColor
        } else {
            cell.progressBar.setProgress(0.3, animated: true)
            cell.progressBar.primaryColor = ConColors.orangeProgress.uiColor
            cell.imageView.image = UIImage(named: "sonrisa")
            cell.percentageLabel.text = "30%"
        }
        cell.projectNameLabel.text = projects[indexPath.item].name
        return cell
    }
}


extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            performSegue(withIdentifier: "projectDetailsSegue", sender: self)
        }
    }
}


extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
