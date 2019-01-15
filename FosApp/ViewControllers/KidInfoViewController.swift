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
        
        let refreshAlert = UIAlertController(title: "Verwijder kind", message: "Ben je zeker dat je dit kind wilt verwijderen?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Jazeker", style: .default, handler: { (action: UIAlertAction!) in
            viewmodel.verwijderKid(scoutsKid: selectedIndex!)
            self.performSegue(withIdentifier: "presenceList", sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Neen", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func wijzigKind(_ sender: Any) {
        performSegue(withIdentifier: "editKid", sender: self)
    }
    
}
