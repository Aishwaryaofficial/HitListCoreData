//
//  MainVC.swift
//  HitListCoreData
//
//  Created by Appinventiv on 24/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: @IBOutlet
    
    @IBOutlet weak var addBTOutlet: UIBarButtonItem!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    // MARK: PROPERTY
    
    var list : [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // SETTING UP DELEGATE AND DATASOURCE
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        // registering up Nib
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableViewOutlet.register(cellNib, forCellReuseIdentifier: "TableViewCellID")
        
        // Do any additional setup after loading the view.
    }
    
}
extension MainVC: UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        cell.labelOutlet.text = list[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    @IBAction func addBTAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Name",
                                      message: "Add a new name",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField = alert.textFields?.first,
                                            let nameToSave = textField.text else {
                                                return
                                        }
                                        
                                        self.list.append(nameToSave)
                                        self.tableViewOutlet.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
}

