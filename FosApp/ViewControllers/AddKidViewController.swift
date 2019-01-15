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
        if(selectedKid != nil){
            name.text = selectedKid!.name
        }
        super.viewDidLoad()
    }
    
    @IBAction func genderClicked(_ sender: UIButton) {
        if(!(((name.text?.isEmpty)!))){
            if(selectedKid == nil){
                viewmodel.addKid(name: name.text!, gender: genderMap[sender.tag]!)
                performSegue(withIdentifier: "presenceList", sender: self)
            } else {
                viewmodel.editKid(name: name.text!, gender: genderMap[sender.tag]!, kidId: selectedKid!.id, index : selectedIndex!)
                performSegue(withIdentifier: "presenceList", sender: self)
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
}



