//
//  VCRandom.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 11/6/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCRandom:UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    
    @IBOutlet var tablaPlanes:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DataHolder.sharedInstance.descargarRandom(delegate:self)
    // Do any additional setup after loading the view.
    }
    
    @IBAction func random (){
        DataHolder.sharedInstance.descargarRandom(delegate:self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arPlanesRandom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCeldaPlanes") as! CeldaUP
        celda.lblNombre?.text =  DataHolder.sharedInstance.arPlanesRandom[indexPath.row].sNombre
        celda.lblDescripcion?.text =  DataHolder.sharedInstance.arPlanesRandom[indexPath.row].sDescripcion
        celda.lblTipo?.text =  DataHolder.sharedInstance.arPlanesRandom[indexPath.row].sTipo
        celda.lblLimitePersonas?.text =  DataHolder.sharedInstance.arPlanesRandom[indexPath.row].sLimitePersonas
        celda.lblLugar?.text =  DataHolder.sharedInstance.arPlanesRandom[indexPath.row].sLugar
       
        
        
        return celda
    }
    
    func DHDDescargaPlanes(blFin: Bool) {
        if blFin {
            self.refreshUI()
            
        }
    }
    
    
    
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tablaPlanes?.reloadData()
        })
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
