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
    
    var episodesArray: [episodes] = [episodes]()
    
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
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        SecondViewController.episodeTitle = self.episodesArray[indexPath.row].episodeTitle
        SecondViewController.premierDate = self.episodesArray[indexPath.row].premierDate
        SecondViewController.airtime = self.episodesArray[indexPath.row].airtime
        SecondViewController.season = String(self.episodesArray[indexPath.row].season)
        SecondViewController.episodeNumber = String(self.episodesArray[indexPath.row].episodeNumber)
        SecondViewController.summary = self.episodesArray[indexPath.row].summary
        navigationController?.pushViewController(SecondViewController, animated: true)
    }
        
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
