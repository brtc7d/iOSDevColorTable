//
//  ColorDetailViewController.swift
//  iOSDevColorTableView
//
//  Created by Ben on 10/19/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color: ColorStruct?
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorLabel.text = color?.name
        self.view.backgroundColor = color?.UIColor
        self.title = color?.name
        
        // Do any additional setup after loading the view.
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
