//
//  CharacterSpellsControllerViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/4/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit



class CharacterSpellsControllerViewController: UIViewController {
    @IBOutlet var characterSpellSearchBar: UISearchBar!
    @IBOutlet var characterSpellTableView: UITableView!
    @IBOutlet var backgroundImage: UIImageView!
    private let authservice = AppDelegate.authservice
    private var usersListOfSavedSpells = [SpellResults]() {
        didSet {
            DispatchQueue.main.async {
                self.characterSpellTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
        characterSpellTableView.dataSource = self
        characterSpellTableView.delegate = self
        if let userName = authservice.getCurrentUser()?.displayName as? String {
            usersListOfSavedSpells = DataPersistenceModel.getSpells(userName: userName)
            characterSpellTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SpellDetailViewController else {return}
        vc.delegate = self
        //vc.colorPickedByUser = colorPickedByUser
        
    }
    
    private func configureSettings() {
       backgroundImage.image = UIImage(named: "cave_bg")
        
    }
   
    @IBAction func spellSlotIndicatorButton(_ sender: UIButton) {
      // TOGGLES SPELL SLOT INDICATORS
        if sender.image(for: .normal) == UIImage(named: "clearButton") {
            sender.setImage(UIImage(named: "purple"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "clearButton"), for: .normal)
        }
        

    }
    
    @IBAction func signOutButtonPressed(_ sender: UIBarButtonItem) {
        authservice.signOutAccount()
        let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
        let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") 
        loginController.modalTransitionStyle = .crossDissolve
        loginController.modalPresentationStyle = .overFullScreen
        present(loginController, animated: true)
    }
}



extension CharacterSpellsControllerViewController : SpellDetailViewControllerDelegate {
    func saveSpellToCharacterInfo(spell: SpellResults) {
        usersListOfSavedSpells.append(spell)
        print(usersListOfSavedSpells)
    }
    
    
}

extension CharacterSpellsControllerViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersListOfSavedSpells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterSpellTableView.dequeueReusableCell(withIdentifier: "characterSpellListCell", for: indexPath)
        let spellToSet = usersListOfSavedSpells[indexPath.row]
        cell.textLabel?.text = spellToSet.name
        
        return cell
    }
    
    
}
