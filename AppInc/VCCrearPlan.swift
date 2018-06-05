//
//  VCCrearPlan.swift
//  AppInc
//
//  Created by IGNACIO GALAN DE PINA on 25/5/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCCrearPlan: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, DataHolderDelegate {
    @IBOutlet weak var lblnumPersonas: UILabel?
    @IBOutlet weak var stepper: UIStepper?
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblEvento: UILabel!
    @IBOutlet var txtDescripcion:UITextView?
    @IBOutlet var txtFecha:UITextField?
    @IBOutlet var txtHorario:UITextField?
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtLugar:UITextField?
    @IBOutlet var btnGruadarPlan:UIButton?
    
    let planes = ["Fiesta","Quedada","Bares","Excursión","Concierto","Videojuegos"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblEvento.text = planes[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblnumPersonas?.text = "\(self.stepper?.value ?? 50)"
        // Do any additional setup after loading the view.
    }
    
    func DHDCrearPlan(blFin:Bool) {
        if blFin {
            self.performSegue(withIdentifier: "transitionPlan", sender: self)
        }
    }
    @IBAction func clickGuardarPlan(){
        DataHolder.sharedInstance.miPlan.sDescripcion = txtDescripcion?.text
        DataHolder.sharedInstance.miPlan.sFecha = txtFecha?.text
        DataHolder.sharedInstance.miPlan.sHorario = txtHorario?.text
        DataHolder.sharedInstance.miPlan.sLimitePersonas = lblnumPersonas?.text
        DataHolder.sharedInstance.miPlan.sNombre = txtNombre?.text
        DataHolder.sharedInstance.miPlan.sTipo = lblEvento?.text
        DataHolder.sharedInstance.miPlan.sLugar = txtLugar?.text
        DataHolder.sharedInstance.miPlan.sCreador = DataHolder.sharedInstance.userActual
        if txtNombre?.text=="" || txtDescripcion?.text == "" || txtFecha?.text == "" || txtHorario?.text == "" || txtLugar?.text == "" || lblEvento?.text == "Label" {
            print("Hay que rellenar todos los campos, hijoputa!!!!!")
        } else{
            DataHolder.sharedInstance.crearPlan(nombre: (txtNombre?.text)!, descripcion: (txtDescripcion?.text)!,fecha: (txtFecha?.text)!,horario: (txtHorario?.text)!,limitePersonas: (lblnumPersonas?.text)!,tipo: (lblEvento?.text)!,lugar: (txtLugar?.text)!,creador:(DataHolder.sharedInstance.userActual)!, delegate: self)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        self.lblnumPersonas?.text = "\(self.stepper?.value ?? 50)"
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
