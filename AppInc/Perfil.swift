//
//  Perfil.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    var sID:String?
    var sEmail:String?
    var sUser:String?
    var arMisPlanes:[String] = []

    
    func setMap(valores:[String:Any]){
        sEmail = valores ["Email"] as? String
        sUser = valores ["User"] as? String
        arMisPlanes = (valores ["misPlanes"] as? [String])!
    }
    
    func getMap() -> [String:Any]{
        return [
            "Email": sEmail as Any,
            "User": sUser as Any,
            "misPlanes": arMisPlanes as Any
        ]
    }
    
    func save(){
        DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document(sID!).setData(getMap())
        
    }
    
    
}
