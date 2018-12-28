//
//  FirstViewController.swift
//  FosApp
//
//  Created by Aya Coppens on 03/11/2018.
//  Copyright © 2018 Vital Vercleyen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var scoutsKids: [ScoutsKid] = []
    var filteredScoutsKids : [ScoutsKid] = []
    var viewmodel : PresenceListViewModel = PresenceListViewModel()
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoutsKids = viewmodel.scoutsKids
        filteredScoutsKids = scoutsKids
        searchbar.barTintColor = .white
        searchbar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func aanwezigCheckBoxTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    
    @IBAction func vieruurtjeCheckBoxTapped(_ sender: UIButton) {
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
    
    
}

