//
//  VCMisPlanes.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCMisPlanes: UIViewController,DataHolderDelegate {
    @IBOutlet var tablaPlanes: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarMisPlanes(delegate:self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaMisPlanes(blFin: Bool) {
        if blFin {
            self.refreshUI()
           
        }
    }
    
    
    
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tablaPlanes?.reloadData()
        })
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
