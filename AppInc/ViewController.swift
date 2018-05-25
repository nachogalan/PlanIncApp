//
//  ViewController.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 18/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//
import UIKit
import FirebaseAuth

class ViewController: UIViewController, DataHolderDelegate {
    
    
    @IBOutlet var Email:UITextField?
    @IBOutlet var Password:UITextField?
    @IBOutlet var btnLogin:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func DHDConfirmacionLogin(blFin:Bool) {
        if blFin {
            self.performSegue(withIdentifier: "transitionLogin", sender: self)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogin(){
        print("Hola " + (Email?.text)!)
        DataHolder.sharedInstance.confirmarLogin(user: (Email?.text)!, password: (Password?.text)!, delegate: self)
        
        
    }
    
    
    
}
