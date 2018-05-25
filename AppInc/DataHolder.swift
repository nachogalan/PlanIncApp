//
//  DataHolder.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    var DHtxtUser:ViewController?
    var fireStoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    var firStorage:Storage?
    var arUsuarios:[Perfil] = []
    var firStorageRef:StorageReference?
    
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
        
    }
    
   
    
    
    func crearUsuario (user:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().createUser(withEmail: user, password: password) { (user, error) in
            if user != nil{
                print("Registrado")
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                delegate.DHDCrearUsuarioRegistro!(blFin: true)
                
            }else{
                print(error!)
            }
            print("Hola")
        }
    }
    
    
    func confirmarLogin(user:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: user, password: password) { (user, error) in
            if user != nil{
                let ruta =
                    DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!);
                ruta?.getDocument { (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDConfirmacionLogin!(blFin: true)
                        
                    } else {
                        print(error!)
                    }
                }
                
            }
            else{
                print("NO SE HA LOGEADO!")
                print(error!)
            }
            
        }
        
        
    }
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaPerfilesCompleta(blFin:Bool)
    @objc optional func DHDConfirmacionLogin(blFin:Bool)
    @objc optional func DHDCrearUsuarioRegistro(blFin:Bool)
    @objc optional func DHDDescargarImganes(imagen:UIImage)
}

