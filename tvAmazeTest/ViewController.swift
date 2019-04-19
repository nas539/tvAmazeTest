//
//  ViewController.swift
//  tvAmazeTest
//
//  Created by MCS on 4/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

var jsonData: TVAmazeVars?
class ViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self as UITableViewDataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GoT")
        
        let url = Bundle.main.url(forResource: "GameOfThrones", withExtension: "json")
        
        print(url!)
        
        let data = try? Data(contentsOf: url!)
        
        print(data!)
        
        jsonData = try? JSONDecoder().decode(TVAmazeVars.self, from: data!)
        
        print(jsonData)
        
        tableView.reloadData()
    }
    
}
        

    fileprivate func fetchPokemonJSON(completion: @escaping(Result<[Character], Error>) -> ()) {
        
        let url = Bundle.main.url(forResource: "GameOfThrones", withExtension: "json")
        
        let data = try? Data(contentsOf: url!)
        
        jsonData = try? JSONDecoder().decode(TVAmazeVars.self, from: data!)
       
    
    }
extension ViewController : UITableViewDelegate {
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.cellForRow(at: indexPath)?.isSelected = false
        }
    }
    
extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (jsonData == nil) ? 0 : 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "GoT")
            
            cell.textLabel?.text = jsonData?.name
            
            return cell
        }
    



}
