//
//  SupplyDetailsViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit
import M13ProgressSuite
import DropDown

class SupplyDetailsViewController: UIViewController {
    
    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapDropDown(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func didTapUse(_ sender: Any) {
    }
    
    @IBAction func didTapReplenish(_ sender: Any) {
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var supplyNameLabel: UILabel!
    @IBOutlet weak var progressBar: M13ProgressViewBorderedBar!
    @IBOutlet weak var outOfLabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    
    var dropDown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let areas = ["Parking Lot", "Kitchen"]
        dropDown = DropDown()
        dropDown.width = 240
        dropDown.anchorView = areaLabel
        dropDown.dataSource = areas
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.areaLabel.text = "Area: \(areas[index])"
        }
        quantityTextField.keyboardType = .numberPad
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
