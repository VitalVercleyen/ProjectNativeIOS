//
//  AddKidViewController.swift
//  FosApp
//
//  Created by Aya Coppens on 29/12/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class AddKidViewController : UIViewController {
    
    
    let genderMap = [0 : "boy",  2 : "girl",  1 : "xgender"]
    
    @IBOutlet weak var name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genderClicked(_ sender: UIButton) {
        if(!((name.text?.isEmpty)!)){
            if(selectedKid == nil){
                viewmodel.addKid(name: name.text ?? "kid", gender: genderMap[sender.tag]!)
                performSegue(withIdentifier: "presenceList", sender: self)
            } else {
                viewmodel.
            }
            
        }
        
    }
   
}



