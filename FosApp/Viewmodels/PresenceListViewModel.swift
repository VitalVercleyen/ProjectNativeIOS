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
    
    func createArray() -> [ScoutsKid] {
        var tempScoutsKids: [ScoutsKid] = []
        
        let ScoutsKid1 = ScoutsKid(name : "Aya Coppens", gender : "girl",tak:  "welpen", aanwezig: false, vierUurtje : false)
        let ScoutsKid2 = ScoutsKid(name :"Timon Vermeers", gender :"boy", tak :"welpen", aanwezig :false, vierUurtje :false)
        let ScoutsKid3 = ScoutsKid(name : "Anton De Man", gender :"xgender", tak :"welpen", aanwezig :false,vierUurtje : false)
        let ScoutsKid4 = ScoutsKid(name :"Ilias Ikadouran", gender :"boy", tak :"welpen", aanwezig :false, vierUurtje :false)
        let ScoutsKid5 = ScoutsKid(name :"Lies Detandt", gender :"girl", tak :"welpen", aanwezig :false,vierUurtje : false)
        
        tempScoutsKids.append(ScoutsKid1)
        tempScoutsKids.append(ScoutsKid2)
        tempScoutsKids.append(ScoutsKid3)
        tempScoutsKids.append(ScoutsKid4)
        tempScoutsKids.append(ScoutsKid5)
        
        return tempScoutsKids
        
    }
    
}
