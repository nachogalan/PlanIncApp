//
//  VCPerfil.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 14/6/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCPerfil: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imgView:UIImageView?
    @IBOutlet var txtDescripcion:UITextView?
    @IBOutlet var txtInstagram:UITextField?
    @IBOutlet var txtFacebook:UITextField?
    @IBOutlet var txtGmail:UITextField?
    
    let imagePicker = UIImagePickerController()
    
    var imgData:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonPerfil(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accionBotonSubir(){
        if imgData != nil{
            let tiempoMilis:Int = Int((Date().timeIntervalSince1970 * 1000.0).rounded())
            let ruta:String = String(format: "Fotos/imagen%d.jpg", tiempoMilis)
            let imagenRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)
            let uploadTask = imagenRef?.putData(imgData!,metadata:nil){ (metadata,error)
                in
                guard let metadata = metadata else{
                    return
                }
                let downloadURL = metadata.downloadURL
            }
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
        
        imgView?.image = img
        self.dismiss(animated: true, completion: nil)
    }

}
