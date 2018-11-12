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
    let image : UIImage
    let name : String
    let gender : String
    let tak : String
    let aanwezig : Bool
    let vierUurtje: Bool
    var genderMap = ["boy" : #imageLiteral(resourceName: "boy"), "girl" : #imageLiteral(resourceName: "girl"), "xgender" : #imageLiteral(resourceName: "xgender")]

    
    init(name: String, gender: String, tak: String, aanwezig:Bool, vierUurtje : Bool){
        self.image = genderMap[gender]!
        self.name = name
        self.gender = gender
        self.tak = tak
        self.aanwezig = aanwezig
        self.vierUurtje = vierUurtje
    }
}
