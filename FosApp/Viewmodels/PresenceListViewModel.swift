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
    
    init(){
        scoutsKids = createArray()
    }
    
    
    func addKid(name : String, gender : String){
        let scoutsKid = ScoutsKid(name : name, gender : gender, aanwezig : false, vierUurtje : false)
        print(name)
        scoutsKids.append(scoutsKid)
        
    }
    
    func editKid(name : String, gender : String, kid : ScoutsKid, index : Int){
        
        
    }
    
    func verwijderKid(scoutsKid : Int){
        scoutsKids.remove(at: scoutsKid)
    }
    
    
    
    func createArray() -> [ScoutsKid] {
        var tempScoutsKids: [ScoutsKid] = []
        
        let ScoutsKid1 = ScoutsKid(name : "Aya Coppens", gender : "girl", aanwezig: false, vierUurtje : false)
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
        
    }
    
}
