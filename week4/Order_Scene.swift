
//
//  OrderMaxTableViewController.swift
//  order
//
//  Created by Max on 2019/8/30.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class Order_Scene: UITableViewController {
    
    var cellData: DrinkData?
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        setCellData(with: cellData!)
    }
  //  var user = Firebase.auth().currentUser;
//    Choose Order Label
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
 //   @IBOutlet weak var imgLabel: UIImageView!
    
//    Choose Order Type Label
    @IBOutlet weak var orderNameLabel: UITextField!
    @IBOutlet weak var orderSizeLabel: UISegmentedControl!
    @IBOutlet weak var orderSugerLabel: UISegmentedControl!
    @IBOutlet weak var orderColdLabel: UISegmentedControl!
    
    func setCellData(with cellData: DrinkData) {
        nameLabel.text = cellData.name
        priceLabel.text = cellData.price
        contentLabel.text = cellData.content
       /* imgLabel.image = UIImage(named: cellData.image!)*/
    }

    @IBAction func orderSend(_ sender: Any) {
        
        if orderNameLabel.text == ""{
            print("[name] == empty")
        }else{
            db.collection("orders").addDocument(data: [
                "name": orderNameLabel.text ?? "",
                "drink": nameLabel.text ?? "",
                "price": priceLabel.text ?? "",
                "size": orderSizeLabel.titleForSegment( at: orderSizeLabel.selectedSegmentIndex) ?? "",
                "sugar": orderSugerLabel.titleForSegment( at: orderSugerLabel.selectedSegmentIndex) ?? "",
                "cold": orderColdLabel.titleForSegment( at: orderColdLabel.selectedSegmentIndex) ?? ""
            ]) { (error) in
                if let error = error {
                    print(error)
                }
            }
        self.performSegue(withIdentifier: "pass_order", sender: nil)
        }
    }
    
}
