//
//  VCMisPlanes.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCMisPlanes: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    @IBOutlet var tabla1Planes: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarMisPlanes(delegate:self)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arPlanes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda:CeldaUP = tableView.dequeueReusableCell(withIdentifier: "idCeldaPlanes") as! CeldaUP
        
        celda.lblNombre?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sNombre
        celda.lblDescripcion?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sDescripcion
        celda.lblFecha?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sFecha
        celda.lblHorario?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sHorario
        celda.lblTipo?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sTipo
        celda.lblLimitePersonas?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sLimitePersonas
        celda.lblLugar?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sLugar
        celda.lblCreador?.text =  DataHolder.sharedInstance.arPlanes[indexPath.row].sCreador
        celda.sIDEvento = DataHolder.sharedInstance.arPlanes[indexPath.row].sID
        
        
        return celda
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
            self.tabla1Planes?.reloadData()
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
