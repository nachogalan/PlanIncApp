import UIKit

class PlanesGenerales: NSObject {
    
    var sDescripcion:String?
    var sFecha:String?
    var sHorario:String?
    var sLimitePersonas:String?
    var sNombre:String?
    var sTipo:String?
    var sLugar:String?
    var sCreador:String?
    
    
    
    func setMap(valores:[String:Any]){
        sDescripcion = valores ["Descripcion"] as? String
        sFecha = valores ["Fecha"] as? String
        sHorario = valores ["Horario"] as? String
        sLimitePersonas = valores ["LimitePersonas"] as? String
        sNombre = valores ["Nombre"] as? String
        sTipo = valores ["Tipo"] as? String
        sLugar = valores ["Lugar"] as? String
        sCreador = valores ["Creador"] as? String
        
    }
    
    func getMap() -> [String:Any]{
        return [
            "Descripcion": sDescripcion as Any,
            "Fecha": sFecha as Any,
            "Horario": sHorario as Any,
            "LimitePersonas": sLimitePersonas as Any,
            "Nombre": sNombre as Any,
            "Tipo": sTipo as Any,
            "Lugar": sLugar as Any,
            "Creador": sCreador as Any
            
        ]
    }
    
}
