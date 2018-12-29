//
//  FirstViewController.swift
//  FosApp
//
//  Created by Aya Coppens on 03/11/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

let viewmodel : PresenceListViewModel = PresenceListViewModel()
var selectedKid : ScoutsKid? = nil
var selectedIndex : Int? = nil

class FirstViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var scoutsKids: [ScoutsKid] = []
    var filteredScoutsKids : [ScoutsKid] = []
    
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedKid = nil
        selectedIndex = nil
        scoutsKids = viewmodel.scoutsKids
        filteredScoutsKids = scoutsKids
        searchbar.barTintColor = .white
        searchbar.delegate = self
        navigationItem.hidesBackButton = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    
    @IBAction func opslaan(_ sender: Any) {
    }
    
    
    @IBAction func checkBoxTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText : String){
        guard !searchText.isEmpty else {
            filteredScoutsKids = scoutsKids
            tableView.reloadData()
            return
        }
        filteredScoutsKids = scoutsKids.filter({ (scoutsKid) -> Bool in
            
            return scoutsKid.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    

    
}

extension FirstViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredScoutsKids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scoutsKid = filteredScoutsKids[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoutsKidCell") as! ScoutsKidCell
        
        cell.setData(scoutsKid: scoutsKid)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedKid = scoutsKids[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "kidInfo", sender: self)
    }
    
    
}

