//
//  CeldaUP.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 31/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class CeldaUP: UITableViewCell, DataHolderDelegate {
    @IBOutlet weak var cellView: UIView!
    var sIDEvento:String?
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var lblDescripcion:UILabel?
    @IBOutlet var lblFecha:UILabel?
    @IBOutlet var lblHorario:UILabel?
    @IBOutlet var lblTipo:UILabel?
    @IBOutlet var lblLimitePersonas:UILabel?
    @IBOutlet var lblLugar:UILabel?
    @IBOutlet var lblCreador:UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func btnUnirse(){
        
        DataHolder.sharedInstance.miPerfil.arMisPlanes.append(sIDEvento!)
        DataHolder.sharedInstance.miPerfil.save()
    }
    
    
    
}
