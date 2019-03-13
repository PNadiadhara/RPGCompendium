//
//  SpellListViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SpellListViewController: UIViewController {
    
    @IBOutlet var spellListTableView: UITableView!
    @IBOutlet var spellListSearchBar: UISearchBar!
    @IBOutlet var backgroundImage: UIImageView!
    
    private var searching = false
    
    
    var endPointURLString = APIClient.endPointURLString
    private var localArrayToUseForSearch = [SpellResults]()
    
    private var spells = [SpellResults](){
        didSet {
            DispatchQueue.main.async {
                print(self.spells.count)
                self.localArrayToUseForSearch = self.spells
                self.spellListTableView.reloadData()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spellListTableView.dataSource = self
        spellListTableView.delegate = self
        spellListSearchBar.delegate = self
        getSpells()
        spellListTableView.register(UINib(nibName: "SpellCell", bundle: nil), forCellReuseIdentifier: "SpellCell")
        backgroundImage.image =  UIImage(named: "cave_bg")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail" {
        guard let indexPath = spellListTableView.indexPathForSelectedRow,let spellDetailViewController = segue.destination as? SpellDetailViewController else {fatalError("missing index path, spellDetailController")}
        let passedSpell = localArrayToUseForSearch[indexPath.row]
        spellDetailViewController.passedSpell = passedSpell
        } else {
            guard segue.destination is CreateSpellViewController else {fatalError("missing index path, createSpellViewController")}
        }
        
    }
    
    func getSpells () {
        APIClient.getSpell(endPointURLString: endPointURLString) { (error, data) in
            if let error = error {
                print(error)
            } else if let data = data {
                self.spells += data.results
                self.endPointURLString = data.next ?? "null"
                if self.endPointURLString != "null" {
                    self.getSpells()
                }
            }
            
        }
    }
    
    
    
    
}

extension SpellListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
        return localArrayToUseForSearch.count
        } else {
        return spells.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = spellListTableView.dequeueReusableCell(withIdentifier: "SpellCell", for: indexPath) as? SpellCell else {return UITableViewCell()} 
        //let cell = spellListTableView.dequeueReusableCell(withIdentifier: "spellListCell", for: indexPath)
        if searching {
            let spellToSet = localArrayToUseForSearch[indexPath.row]
            cell.spellName.text = spellToSet.name
            cell.spellSchool.text = spellToSet.school
            cell.spellClass.text = spellToSet.dnd_class
            cell.spellSchoolImage.image = UIImage(named: "\(spellToSet.school)") ?? UIImage(named: "PlaceHolder")
//            cell.textLabel?.text = spellToSet.name
//            cell.detailTextLabel?.text = spellToSet.school
//            cell.imageView?.image = UIImage(named: "\(spellToSet.school)") ?? UIImage(named: "PlaceHolder")
            return cell
            
        }else {
            let spellToSet = spells[indexPath.row]
            cell.spellName?.text = spellToSet.name
            cell.spellSchool?.text = spellToSet.school
            cell.spellClass?.text = spellToSet.dnd_class
            cell.spellSchoolImage?.image = UIImage(named: "\(spellToSet.school)") ?? UIImage(named: "PlaceHolder")
//        cell.textLabel?.text = spellToSet.name
//        cell.detailTextLabel?.text = spellToSet.school
//        cell.imageView?.image = UIImage(named: "\(spellToSet.school)") ?? UIImage(named: "PlaceHolder")
        return cell
    }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deleteTitle = NSLocalizedString("Deletez", comment: "Delete action")
        let deleteAction = UITableViewRowAction(style: .destructive, title: deleteTitle) { (action, indexPath) in
            if self.searching {
                self.localArrayToUseForSearch.remove(at: indexPath.row)
            } else {
                self.spells.remove(at: indexPath.row)
            }
        }
        let saveTitle = NSLocalizedString("Save", comment: "Save Action")
        let saveAction = UITableViewRowAction(style: .normal, title: saveTitle) { (action, indexpath) in
            if self.searching {
                self.localArrayToUseForSearch.remove(at: indexPath.row)
            } else {
                self.spells.remove(at: indexPath.row)
            }
        }
        
        spellListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToDetail", sender: Any?.self)
        spellListTableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension SpellListViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        localArrayToUseForSearch = spells.filter ({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        spellListTableView.reloadData()
        
    }

}
