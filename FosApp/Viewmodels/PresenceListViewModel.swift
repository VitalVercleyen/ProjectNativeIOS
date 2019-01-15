//
//  PresenceListViewModel.swift
//  FosApp
//
//  Created by Aya Coppens on 28/12/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class PresenceListViewModel{
    
    var scoutsKids: [ScoutsKid] = []
    var dataHandler : Datahandler
    
    init(){
        
        dataHandler = Datahandler()
        getKids()
    }
    
    
    func addKid(name : String, gender : String){
        dataHandler.addKid(name: name, gender: gender)
    }
    
    func editKid(name : String, gender : String, kidId : String, index: Int){
        dataHandler.editKid(id: kidId, name: name, gender: gender, index : index)
        editKidLocal(kidId: kidId, name: name, gender: gender, index: index)
        
    }
    
    func verwijderKid(scoutsKid : Int){
        
        let scoutsKidObj = scoutsKids[scoutsKid]
        dataHandler.deleteKid(id: scoutsKidObj.id, index : scoutsKid)
        scoutsKids.remove(at: scoutsKid)
    }
    
    func getKids() {
        scoutsKids = dataHandler.getKids()
    }
    
    func editKidLocal(kidId : String, name : String, gender : String, index : Int){
        scoutsKids[index].name = name
        scoutsKids[index].gender = gender
    }
    
    func checkAanwezigheid(kidID : String){
        for kid in scoutsKids{
            if kid.id == kidID{
                kid.aanwezig = !kid.aanwezig
            }
        }
    }
    
    func checkVieruurtje(kidID : String){
        for kid in scoutsKids{
            if kid.id == kidID{
                kid.vierUurtje = !kid.vierUurtje
            }
        }
    }
    
    func saveAanwezigheid(){
        let date = getDate()
        let id = date.replacingOccurrences(of: "/", with: "")
        dataHandler.saveAanwezigheid(AanwezigheidID: id, date: date, scoutsKids: scoutsKids)
    }
    
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: date)
    }
    
    
    /*func createArray() -> [ScoutsKid] {
        var tempScoutsKids: [ScoutsKid] = []
        
        let ScoutsKid1 = ScoutsKid(idname : "Aya Coppens", gender : "girl", aanwezig: false, vierUurtje : false)
        let ScoutsKid2 = ScoutsKid(name :"Timon Vermeers", gender :"boy", aanwezig :false, vierUurtje :false)
        let ScoutsKid3 = ScoutsKid(name : "Anton De Man", gender :"xgender", aanwezig :false,vierUurtje : false)
        let ScoutsKid4 = ScoutsKid(name :"Ilias Ikadouran", gender :"boy", aanwezig :false, vierUurtje :false)
        let ScoutsKid5 = ScoutsKid(name :"Lies Detandt", gender :"girl", aanwezig :true,vierUurtje : false)
        
        tempScoutsKids.append(ScoutsKid1)
        tempScoutsKids.append(ScoutsKid2)
        tempScoutsKids.append(ScoutsKid3)
        tempScoutsKids.append(ScoutsKid4)
        tempScoutsKids.append(ScoutsKid5)
        
        return tempScoutsKids
        
    }*/
    
}
