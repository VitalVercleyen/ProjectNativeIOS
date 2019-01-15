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
        db.collection("AanwezigKid").whereField("aanwezigheid", isEqualTo : getDateID()).addSnapshotListener({
            querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for doc in querySnapshot!.documents{
                    for kid in self.scoutsKids {
                        if(kid.id == doc.data()["kid"] as! String){
                            kid.aanwezig = doc.data()["aanwezig"] as! Bool
                            kid.vierUurtje = doc.data()["vieruurtje"] as! Bool
                        }
                    }
                }
            }
        })
    }
    
    func editKid(id : String, name : String, gender : String, index : Int){
        db.collection("ScoutsKids").document(id).setData([
            "name": name,
            "gender": gender,
            "tak": 3
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
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
    
    func saveAanwezigheid(AanwezigheidID : String, date : String, scoutsKids : [ScoutsKid]){
        db.collection("Aanwezigheden").document(AanwezigheidID).setData( [
            "date" : date,
            "tak" : 3
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        for kid in scoutsKids {
            db.collection("AanwezigKid").document(kid.id + AanwezigheidID).setData([
                "aanwezig" : kid.aanwezig,
                "vieruurtje" : kid.vierUurtje,
                "kid" : kid.id,
                "aanwezigheid" : AanwezigheidID
                
            ]){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
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
    
    func getDateID() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyy"
        return formatter.string(from: date)
    }
    
    
    
    
    
}
