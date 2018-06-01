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
    @IBOutlet var btnRegister:UIButton?
    @IBOutlet var lblRecuerdame:UILabel?
    
    override func viewDidLoad() {
        btnLogin?.layer.cornerRadius = 15
        btnRegister?.layer.cornerRadius = 15
        lblRecuerdame?.layer.masksToBounds = true
        lblRecuerdame?.layer.cornerRadius = 5
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
        DataHolder.sharedInstance.confirmarLogin(email: (Email?.text)!, password: (Password?.text)!, delegate: self)
        
        
    }
    
    
    
}
