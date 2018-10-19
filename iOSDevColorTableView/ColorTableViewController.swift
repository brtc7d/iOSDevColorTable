//
//  ViewController.swift
//  iOSDevColorTableView
//
//  Created by Ben on 9/28/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

struct ColorStruct {
    var name: String
    var UIColor: UIColor
}

class ColorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var colorTable: UITableView!
    @IBOutlet weak var colorsTableView: UITableView!
    
    var colors = [ColorStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorTable.delegate = self
        colorTable.dataSource = self
        
        //colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
        colors = [ColorStruct(name: "red", UIColor: UIColor.red), ColorStruct(name: "orange", UIColor: UIColor.orange), ColorStruct(name: "yellow", UIColor: UIColor.yellow), ColorStruct(name: "green", UIColor: UIColor.green), ColorStruct(name: "blue", UIColor: UIColor.blue), ColorStruct(name: "purple", UIColor: UIColor.purple), ColorStruct(name: "brown", UIColor: UIColor.brown)]
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
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as! ColorTableViewCell
        
        cell.colorLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].UIColor
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorsTableView.indexPathForSelectedRow?.row {
            destination.color = colors[row]
        }
    }
}

