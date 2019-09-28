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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ClassDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        cell.progressBar.borderWidth = 0
        cell.percentageLabel.isHidden = true
        switch indexPath.item {
        case 0:
            cell.progressBar.setProgress(0.20, animated: true)
            cell.progressBar.primaryColor = ConColors.orangeProgress.uiColor
            cell.nameLabel.text = "Halloween Pumpkins"
            cell.outOfLabel.text = "10 of 50"
            cell.imageView.image = UIImage(named: "pumpkins")
        case 1:
            cell.progressBar.setProgress(0.60, animated: true)
            cell.progressBar.primaryColor = ConColors.orangeProgress.uiColor
            cell.nameLabel.text = "Grassy Leaves"
            cell.outOfLabel.text = "30 of 100"
            cell.imageView.image = UIImage(named: "grassy_leaves")
        case 2:
            cell.progressBar.setProgress(0.06, animated: true)
            cell.progressBar.primaryColor = ConColors.redProgress.uiColor
            cell.nameLabel.text = "Money Plants"
            cell.outOfLabel.text = "60 of 900"
            cell.imageView.image = UIImage(named: "money_plants")
        case 3:
            cell.progressBar.setProgress(0.0, animated: true)
            cell.progressBar.primaryColor = .clear
            cell.nameLabel.text = "Thistle"
            cell.outOfLabel.text = "0 of 10"
            cell.imageView.image = UIImage(named: "thistle")
        default:
            print()
        }
        return cell
    }
}


extension ClassDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 2 {
            performSegue(withIdentifier: "classDetailsSegue", sender: self)
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
