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
        db.collection("ScoutsKids").whereField("tak", isEqualTo: 3).addSnapshotListener({
            querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for doc in querySnapshot!.documents{
                    let scoutsKid : ScoutsKid = ScoutsKid(id : doc.documentID, name : doc.data()["name"] as! String, gender : doc.data()["gender"] as! String, aanwezig : false, vierUurtje : false)
                    
                    if(!self.contains(array: self.scoutsKids, element: scoutsKid)){
                        self.scoutsKids.append(scoutsKid)
                    }
                    
                }
            }
        })
    }
    
    func deleteKid(id : String, index : Int){
        scoutsKids.remove(at: index)
        db.collection("ScoutsKids").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }

    }
    
    func addKid(name : String, gender : String){
        db.collection("ScoutsKids").addDocument(data: [
            "name": name,
            "gender": gender,
            "tak": 3
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
    func getKids() -> [ScoutsKid]{
        print(scoutsKids)
        return self.scoutsKids
    }
    
    func contains(array : [ScoutsKid], element : ScoutsKid) -> Bool{
        for kid in array{
            if(kid.id == element.id){
                return true
            }
        }
        return false
    }
    
}
