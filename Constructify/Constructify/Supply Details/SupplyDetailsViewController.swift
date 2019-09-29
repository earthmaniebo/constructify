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
import Alamofire
import MBProgressHUD
import ObjectMapper

class SupplyDetailsViewController: UIViewController {
    
    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapDropDown(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func didTapUse(_ sender: Any) {
        let qty = Int(quantityTextField.text ?? "0")
        let parameters = ["quantity": qty, "action": "use", "areaId": gselectedArea.id ?? 1] as [String : Any]
        MBProgressHUD.showAdded(to: view, animated: true)
        Alamofire.request("\(ngrokAPI)/constructify/materials/\(gSelectedMaterial.id ?? 0)", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch response.result {
            case .success:
                MBProgressHUD.showAdded(to: self.view, animated: true)
                Alamofire.request("\(ngrokAPI)/constructify/projects/\(gSelectedProject.id ?? 0)/orders", method: .get, encoding: JSONEncoding.default).responseJSON { response in
                    MBProgressHUD.hide(for: self.view, animated: true)
                    switch response.result {
                    case .success:
                        debugPrint(response)
                        gOrderRequest = Mapper<OrderRequest>().map(JSONObject: response.result.value)!
                    case .failure(_):
                        print()
                    }
                }
            case .failure(_):
                print()
            }
        }
    }
    
    @IBAction func didTapReplenish(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        let qty = Int(quantityTextField.text ?? "0")
        let parameters = ["quantity": qty, "action": "replenish", "areaId": gselectedArea.id ?? 1] as [String : Any]
        Alamofire.request("\(ngrokAPI)/constructify/materials/\(gSelectedMaterial.id ?? 0)", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch response.result {
            case .success:
                MBProgressHUD.showAdded(to: self.view, animated: true)
                Alamofire.request("\(ngrokAPI)/constructify/projects/\(gSelectedProject.id ?? 0)/orders", method: .get, encoding: JSONEncoding.default).responseJSON { response in
                    MBProgressHUD.hide(for: self.view, animated: true)
                    switch response.result {
                    case .success:
                        debugPrint(response)
                        gOrderRequest = Mapper<OrderRequest>().map(JSONObject: response.result.value)!
                    case .failure(_):
                        print()
                    }
                }
            case .failure(_):
                print()
            }
        }
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
        dropDown = DropDown()
        var areaName = [String]()
        MBProgressHUD.showAdded(to: view, animated: true)
        Alamofire.request("\(ngrokAPI)/constructify/projects/\(gSelectedProject.id ?? 0)/areas", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch response.result {
            case .success:
                debugPrint(response)
                gArea = Mapper<Area>().mapArray(JSONObject: response.result.value)!
                for area in gArea {
                    areaName.append(area.name)
                }
                self.dropDown.dataSource = areaName
                self.dropDown.width = 240
                self.dropDown.anchorView = self.areaLabel
                self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    self.areaLabel.text = "Area: \(gArea[index].name ?? "")"
                    gselectedArea = gArea[index]
                }
            case .failure(_):
                print()
            }
        }
        
        
        
        quantityTextField.keyboardType = .numberPad
        
        supplyNameLabel.text = gSelectedMaterial.name
        progressBar.borderWidth = 0
        
        outOfLabel.text = "\(gSelectedMaterial.currentQuantity!) of \(gSelectedMaterial.initialQuantity!)"
        let percentage = NSDecimalNumber(value: gSelectedMaterial.currentQuantity!).dividing(by: NSDecimalNumber(value: gSelectedMaterial.initialQuantity!))
        
        progressBar.setProgress(CGFloat(truncating: percentage), animated: true)
        if CGFloat(truncating: percentage) >= 0.6 {
            progressBar.primaryColor = ConColors.greenProgress.uiColor
        } else if CGFloat(truncating: percentage) < 0.6 && CFloat(truncating: percentage) > 0.3 {
            progressBar.primaryColor = ConColors.orangeProgress.uiColor
        } else {
            progressBar.primaryColor = ConColors.redProgress.uiColor
        }
    }
    
}
