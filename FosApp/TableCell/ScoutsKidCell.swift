//
//  ScoutsKidCell.swift
//  FosApp
//
//  Created by Aya Coppens on 12/11/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class ScoutsKidCell: UITableViewCell {
    
    @IBOutlet weak var scoutsKidName: UITextField!
    
    var scoutsKidId : String = ""
    
    @IBOutlet weak var aanwezig: UIButton!
    
    @IBOutlet weak var vieruurtje: UIButton!
    
    @IBOutlet weak var portrait: UIImageView!
    
        
    func setData(scoutsKid : ScoutsKid){
        scoutsKidId = scoutsKid.id
        portrait.image = scoutsKid.image
        scoutsKidName.text = scoutsKid.name
        aanwezig.isSelected = scoutsKid.aanwezig
        vieruurtje.isSelected = scoutsKid.vierUurtje
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        if(sender.tag == 0){
            viewmodel.checkAanwezigheid(kidID: scoutsKidId)
        } else if(sender.tag == 1){
            viewmodel.checkVieruurtje(kidID: scoutsKidId)
        }
    }
}
