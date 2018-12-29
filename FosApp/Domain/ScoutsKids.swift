//
//  ScoutsKids.swift
//  FosApp
//
//  Created by Aya Coppens on 12/11/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import Foundation
import UIKit

class ScoutsKid {
    let id : String
    let image : UIImage
    let name : String
    let gender : String
    let aanwezig : Bool
    let vierUurtje: Bool
    let genderMap = ["boy" : #imageLiteral(resourceName: "boy"), "girl" : #imageLiteral(resourceName: "girl"), "xgender" : #imageLiteral(resourceName: "xgender")]

    
    init(id : String, name: String, gender: String, aanwezig:Bool, vierUurtje : Bool){
        self.id = id
        self.image = genderMap[gender]!
        self.name = name
        self.gender = gender
        self.aanwezig = aanwezig
        self.vierUurtje = vierUurtje
    }
}
