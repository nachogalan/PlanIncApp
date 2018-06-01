//
//  VCUnirsePlan.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 31/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCUnirsePlan: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    
    @IBOutlet var tablaPlanes:UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arPlanes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCeldaPlanes") as! CeldaUP
        celda.lblNombre?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sNombre
        celda.lblDescripcion?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sDescripcion
        celda.lblFecha?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sFecha
        celda.lblHorario?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sHorario
        celda.lblTipo?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sTipo
        celda.lblLimitePersonas?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sLimitePersonas
        celda.lblCreador?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sCreador
        
        
        return celda
    }
    
    func DHDDescargaPlanes(blFin: Bool) {
        if blFin {
            self.refreshUI()
            print(DataHolder.sharedInstance.userActual!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarPlanes(delegate:self)
        // Do any additional setup after loading the view.
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
