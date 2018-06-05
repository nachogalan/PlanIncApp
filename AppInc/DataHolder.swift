

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
    
    
    
    var miPerfil:Perfil = Perfil()
    var arPlanes:[PlanesGenerales] = []
    var miPlan:PlanesGenerales = PlanesGenerales()
    var userActual:String?
    var tabBarSelectedIndex:Int = 0
    var firStorage:Storage?
    var fireStoreDB:Firestore?
    var firStorageRef:StorageReference?
    
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
        
    }
    
    func crearPlan(nombre:String, descripcion:String, fecha:String, horario:String, limitePersonas:String, tipo:String, lugar:String, creador:String, delegate:DataHolderDelegate) {
        DataHolder.sharedInstance.fireStoreDB?.collection("PlanesGenerales").document().setData(DataHolder.sharedInstance.miPlan.getMap())
        delegate.DHDCrearPlan!(blFin: true)
    }
    
    func descargarPlanes(delegate:DataHolderDelegate){
        
        fireStoreDB?.collection("PlanesGenerales").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaPlanes!(blFin: false)
            } else {
                self.arPlanes=[]
                for document in querySnapshot!.documents {
                    
                    let nombre:PlanesGenerales = PlanesGenerales()
                    nombre.setMap(valores: document.data())
                    self.arPlanes.append(nombre)
                    
                    print("\(document.documentID) => \(document.data())")
                    
                }
                print("------->>>>>> ",self.arPlanes.count)
                delegate.DHDDescargaPlanes!(blFin: true)
                //self.tbTablaChamp?.reloadData()
                //self.refreshUI()
                
                
                
            }
        }
        
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
    
    
    func confirmarLogin(email:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil{
                let ruta =
                    DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!);
                ruta?.getDocument { (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDConfirmacionLogin!(blFin: true)
                        self.userActual = email
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
    @objc optional func DHDDescargaPlanes(blFin:Bool)
    @objc optional func DHDConfirmacionLogin(blFin:Bool)
    @objc optional func DHDCrearUsuarioRegistro(blFin:Bool)
    @objc optional func DHDCrearPlan(blFin:Bool)
    @objc optional func DHDDescargarImganes(imagen:UIImage)
}
