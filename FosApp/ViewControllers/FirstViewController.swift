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
    var refreshControl : UIRefreshControl? = nil
    let searchController = UISearchController(searchResultsController: nil)
    var scoutsKids: [ScoutsKid] = []
    var filteredScoutsKids : [ScoutsKid] = []
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedKid = nil
        selectedIndex = nil
        
        searchbar.barTintColor = .white
        searchbar.delegate = self
        navigationItem.hidesBackButton = true
        
        addRefreshControl()
        refresh()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    
    @IBAction func opslaan(_ sender: Any) {
        viewmodel.saveAanwezigheid()
        amount.text = "aantal: " + String(viewmodel.getAanwezigAmount())
        self.showToast(message: "opgeslagen")
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
    
    func refresh(){
        viewmodel.getKids()
        scoutsKids = viewmodel.scoutsKids
        filteredScoutsKids = scoutsKids
    }
    

    @IBAction func voegToeClicked(_ sender: Any) {
        selectedKid = nil
        selectedIndex = nil
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
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
    
    func addRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.red
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList(){
        refresh()
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedKid = scoutsKids[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "kidInfo", sender: self)
    }
    
    
}

