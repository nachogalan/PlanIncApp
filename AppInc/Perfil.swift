//
//  Perfil.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    var sEmail:String?
    var sUser:String?

    
    func setMap(valores:[String:Any]){
        sEmail = valores ["Email"] as? String
        sUser = valores ["User"] as? String
        
    }
    
    func getMap() -> [String:Any]{
        return [
            "Email": sEmail as Any,
            "User": sUser as Any
            
        ]
    }
    
}
