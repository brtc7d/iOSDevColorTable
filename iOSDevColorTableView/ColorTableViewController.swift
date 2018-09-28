//
//  ViewController.swift
//  iOSDevColorTableView
//
//  Created by Ben on 9/28/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

class ColorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var colorTable: UITableView!
    
    var colors = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorTable.delegate = self
        colorTable.dataSource = self
        
        colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
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
        
        cell.colorLabel?.text = colors[indexPath.row]
        
        return cell
    }
}

