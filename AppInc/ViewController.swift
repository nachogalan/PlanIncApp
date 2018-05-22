//
//  ViewController.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 18/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var User:UITextField?
    @IBOutlet var Password:UITextField?
    @IBOutlet var btnLogin:UIButton?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogin() {
        self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }


}

