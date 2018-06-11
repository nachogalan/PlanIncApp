//
//  PlanesRandom.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 11/6/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class PlanesRandom: NSObject {

    var sDescripcion:String?
    var sLimitePersonas:String?
    var sNombre:String?
    var sTipo:String?
    var sLugar:String?

    
    
    
    func setMap(valores:[String:Any]){
        sDescripcion = valores ["Descripcion"] as? String
        sLimitePersonas = valores ["LimitePersonas"] as? String
        sNombre = valores ["Nombre"] as? String
        sTipo = valores ["Tipo"] as? String
        sLugar = valores ["Lugar"] as? String
        
        
    }
    
    func getMap() -> [String:Any]{
        return [
            "Descripcion": sDescripcion as Any,
            "LimitePersonas": sLimitePersonas as Any,
            "Nombre": sNombre as Any,
            "Tipo": sTipo as Any,
            "Lugar": sLugar as Any,
            
        ]
    }
    
}
    

