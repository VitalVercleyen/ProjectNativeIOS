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
        db.collection("ScoutsKids")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                for doc in documents{
                    print(doc)
                }
        }

    }
    
    func getKids() -> [ScoutsKid]{
        return scoutsKids
    }
    
}
