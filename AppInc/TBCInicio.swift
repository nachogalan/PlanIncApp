//
//  TBCInicio.swift
//  AppInc
//
//  Created by IGNACIO OLAGORTA VERA on 1/6/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class TBCInicio: UITabBarController, DataHolderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = DataHolder.sharedInstance.tabBarSelectedIndex
        //tabBar.selectedItem = DataHolder.sharedInstance.tabBarSelectedItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //print("HOLA!!!! ")
        DataHolder.sharedInstance.tabBarSelectedIndex = self.selectedIndex
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
