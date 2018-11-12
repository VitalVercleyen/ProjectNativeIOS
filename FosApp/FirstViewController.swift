//
//  FirstViewController.swift
//  FosApp
//
//  Created by Aya Coppens on 03/11/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var scoutsKids: [ScoutsKid] = []
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoutsKids = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    func createArray() -> [ScoutsKid] {
        var tempScoutsKids: [ScoutsKid] = []
        
        let ScoutsKid1 = ScoutsKid(name : "Aya Coppens", gender : "girl",tak:  "welpen", aanwezig: false, vierUurtje : false)
        let ScoutsKid2 = ScoutsKid(name :"Timon Vermeers", gender :"boy", tak :"welpen", aanwezig :false, vierUurtje :false)
        let ScoutsKid3 = ScoutsKid(name : "Anton De Man", gender :"xgender", tak :"welpen", aanwezig :false,vierUurtje : false)
        let ScoutsKid4 = ScoutsKid(name :"Ilias Ikadouran", gender :"boy", tak :"welpen", aanwezig :false, vierUurtje :false)
        let ScoutsKid5 = ScoutsKid(name :"Lies Detandt", gender :"girl", tak :"welpen", aanwezig :false,vierUurtje : false)
        
        tempScoutsKids.append(ScoutsKid1)
        tempScoutsKids.append(ScoutsKid2)
        tempScoutsKids.append(ScoutsKid3)
        tempScoutsKids.append(ScoutsKid4)
        tempScoutsKids.append(ScoutsKid5)

        return tempScoutsKids

    }
}

extension FirstViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoutsKids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scoutsKid = scoutsKids[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoutsKidCell") as! ScoutsKidCell
        
        cell.setData(scoutsKid: scoutsKid)
        
        return cell
    }
    
    
}

