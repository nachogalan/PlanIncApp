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
    var sDescripcion:String?
    var sInstagram:String?
    var sFacebook:String?
    var sGmail:String?

    
    func setMap(valores:[String:Any]){
        sEmail = valores ["Email"] as? String
        sUser = valores ["User"] as? String
        arMisPlanes = (valores ["misPlanes"] as? [String])!
        sDescripcion = valores ["Descripcion"] as? String
        sInstagram = valores ["Instagram"] as? String
        sFacebook = valores ["Facebook"] as? String
        sGmail = valores ["Mail"] as? String
    }
    
    func getMap() -> [String:Any]{
        return [
            "Email": sEmail as Any,
            "User": sUser as Any,
            "misPlanes": arMisPlanes as Any,
            "Descripccion": sDescripcion as Any,
            "Instagram": sInstagram as Any,
            "Facebook": sFacebook as Any,
            "Gmail": sGmail as Any
        ]
    }
    
    func save(){
        DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document(sID!).setData(getMap())
        
    }
    
    
}
