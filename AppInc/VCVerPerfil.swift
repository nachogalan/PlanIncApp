//
//  VCVerPerfil.swift
//  AppInc
//
//  Created by IGNACIO OLAGORTA VERA on 14/6/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCVerPerfil: UIViewController, UINavigationControllerDelegate, DataHolderDelegate {
   @IBOutlet var imgProfile:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgProfile?.image = DataHolder.sharedInstance.imgPerfil
        self.imgProfile?.layer.cornerRadius = 20.0
        self.imgProfile?.clipsToBounds = true
        
        // Adding a border to the image profile
        self.imgProfile?.layer.borderWidth = 10.0
        self.imgProfile?.layer.borderColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
