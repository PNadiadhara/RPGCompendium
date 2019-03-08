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
        getSpells()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = spellListTableView.indexPathForSelectedRow,let spellDetailViewController = segue.destination as? SpellDetailViewController else {fatalError("missing index path, spellDetailController")}
        let passedSpell = localArrayToUseForSearch[indexPath.row]
        spellDetailViewController.passedSpell = passedSpell
        
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
        return localArrayToUseForSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // guard let cell = spellListTableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as? spellTableViewCell else {return UITableViewCell()} For Use When changed to CustomCell
        let cell = spellListTableView.dequeueReusableCell(withIdentifier: "spellListCell", for: indexPath)
        let spellToSet = localArrayToUseForSearch[indexPath.row]
        cell.textLabel?.text = spellToSet.name
        cell.detailTextLabel?.text = spellToSet.school
        cell.imageView?.image = UIImage(named: "\(spellToSet.school)") ?? UIImage(named: "PlaceHolder")
        return cell
    }
    
    
    
}
