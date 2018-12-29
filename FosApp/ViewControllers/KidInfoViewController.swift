//
//  KidInfoViewController.swift
//  FosApp
//
//  Created by Aya Coppens on 29/12/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class KidInfoViewController: UIViewController {

    @IBOutlet weak var portrait: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portrait.image = selectedKid?.image
        name.text = selectedKid?.name
    }
    
    @IBAction func verwijderKind(_ sender: Any) {
        viewmodel.verwijderKid(scoutsKid: selectedIndex!)
        performSegue(withIdentifier: "presenceList", sender: self)
    }
    
    @IBAction func wijzigKind(_ sender: Any) {
        
    }
    
}
