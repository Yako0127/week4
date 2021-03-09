//
//  ViewController.swift
//  week4
//
//  Created by 品妤陳 on 2021/2/28.
//

import UIKit

struct DrinkData {
    
    var image: String?
    var name: String?
    var price: String?
    var content: String?
    
}
class MenuListTableViewCell: UITableViewCell{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var img: UIImageView!
    
   //update data on menu page
    func update(with cellData: DrinkData) {
        name.text = cellData.name
        content.text = cellData.content
        price.text = cellData.price
        img.image = UIImage(named: cellData.image!)
    }
}
class Menu_Scene: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    

    
    // 設定Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // 設定cell有幾行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    // 設定cell內資料
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath) as! MenuListTableViewCell
        
        let cellData = cellContent[indexPath.row]
        cell.update(with: cellData)
        
        return cell
    }
    
    
    let cellContent = [
        DrinkData(image: "tea-1", name: "熟成紅茶", price: "$35.00", content: "解炸物或烤肉類油膩。果香。"),
        DrinkData(image: "tea-2", name: "麗春紅茶", price: "$35.00", content: "去除海鮮羶腥。花香。"),
        DrinkData(image: "tea-3", name: "太妃紅茶", price: "$45.00", content: "咖啡及茶。"),
        DrinkData(image: "tea-4", name: "熟成冷露", price: "35.00", content: "手工冬瓜及茶。"),
        DrinkData(image: "tea-5", name: "雪花冷露", price: "$35.00", content: "手工冬瓜。"),
        DrinkData(image: "tea-6", name: "春芽冷露", price: "$35.00", content: "手工冬瓜及綠茶。"),
        DrinkData(image: "tea-7", name: "春芽綠茶", price: "$35.00", content: "綠茶，系系中帶點彔彔。"),
        DrinkData(image: "tea-8", name: "春梅冰茶", price: "$45.00", content: "春梅與冬瓜相遇。"),
        DrinkData(image: "tea-9", name: "冷露歐蕾", price: "50.00", content: "手工冬瓜及鮮奶。"),
        DrinkData(image: "tea-10", name: "熟成歐蕾", price: "$50.00", content: "鮮奶茶。"),
        DrinkData(image: "tea-11", name: "白玉歐蕾", price: "$60.00", content: "白玉珍珠奶茶。"),
        DrinkData(image: "tea-12", name: "熟成檸果", price: "$60.00", content: "中杯。每日限量。搭配少糖最佳。")
        
    ]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? Order_Scene, let _ = menuTableView.indexPathForSelectedRow?.section, let row = menuTableView.indexPathForSelectedRow?.row {
                controller.cellData = cellContent[row]
            }
    }
    
}

