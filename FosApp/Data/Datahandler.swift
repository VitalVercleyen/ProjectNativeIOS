//
//  Datahandler.swift
//  FosApp
//
//  Created by Aya Coppens on 29/12/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit
import FirebaseFirestore


class Datahandler {
    
    
    var scoutsKids : [ScoutsKid] = []
    let db : Firestore
    
    init(){
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        
        
        
        db = Firestore.firestore()
        db.settings = settings
        
        setupData()
    }
    
    func setupData(){
        db.collection("ScoutsKids").whereField("tak", isEqualTo: 3).getDocuments(){
            querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for doc in querySnapshot!.documents{
                    let scoutsKid : ScoutsKid = ScoutsKid(id : doc.documentID, name : doc.data()["name"] as! String, gender : doc.data()["gender"] as! String, aanwezig : false, vierUurtje : false)
                    self.scoutsKids.append(scoutsKid)
                    
                    
                }
            }
        }
    }
    
    func getKids() -> [ScoutsKid]{
        print(scoutsKids)
        return self.scoutsKids
    }
    
}
