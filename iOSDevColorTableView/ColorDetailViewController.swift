//
//  ColorDetailViewController.swift
//  iOSDevColorTableView
//
//  Created by Ben on 10/19/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    
    var datas: [DataStruct]?
    var myIndex: Int?
    
    @IBOutlet weak var colorLabel: UITextField!
    @IBOutlet weak var dataBody: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorLabel.text = datas?[myIndex!].title
        self.dataBody.text = datas?[myIndex!].body
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorTableViewController {
            
            datas?[myIndex!].title = colorLabel.text ?? ""
            datas?[myIndex!].body = dataBody.text ?? ""
            
            destination.datas = datas!
        }
    }

}
