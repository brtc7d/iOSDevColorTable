//
//  ViewController.swift
//  iOSDevColorTableView
//
//  Created by Ben on 9/28/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

struct DataStruct {
    var title: String
    var body: String
}

class ColorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var colorTable: UITableView!
    @IBOutlet weak var colorsTableView: UITableView!
    
    var datas = [DataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorTable.delegate = self
        colorTable.dataSource = self
        
        //colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
//        colors = [ColorStruct(name: "red", UIColor: UIColor.red), ColorStruct(name: "orange", UIColor: UIColor.orange), ColorStruct(name: "yellow", UIColor: UIColor.yellow), ColorStruct(name: "green", UIColor: UIColor.green), ColorStruct(name: "blue", UIColor: UIColor.blue), ColorStruct(name: "purple", UIColor: UIColor.purple), ColorStruct(name: "brown", UIColor: UIColor.brown)]
        
        if(datas.count == 0) {
            self.datas = [
                DataStruct(title: "Note1", body: "This is my first note its legit"),
                DataStruct(title: "Another note", body: "This is my second note its also legit")
            ]
            print("made new arr")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as! ColorTableViewCell
        
        cell.colorLabel?.text = datas[indexPath.row].title
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController {
            
            if segue.identifier == "new" {
                datas.append(DataStruct(title: "", body: ""))
                destination.datas = datas
                destination.myIndex = datas.count - 1
            } else {
                if let row = colorsTableView.indexPathForSelectedRow?.row {
                    destination.datas = datas
                    destination.myIndex = row
                }
            }
        }
    }
}

