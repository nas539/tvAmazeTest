//
//  SecondViewController.swift
//  tvAmazeTest
//
//  Created by MCS on 4/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

var episodeTitle: String?
var premierDate: String?
var airtime: String?
var season: String?
var number: String?
var summary: String?

    weak var episodeTitleLabel: UILabel!
    weak var premierDatetLabel: UILatlet
    weak var airtimeLabel: UILutlet
    weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabetlet
    weak var summaryLabel: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    
    episodeTitleLabel.text = episodeTitle
    premierDatetLabel.text = premierDate
    airtimeLabel.text = airtime
    seasonLabel.text = season
    episodeNumberLabel.text = episodeNumberLabel
    
    
    guard let summaryText = summary else {return}
    summaryLabel.text = summaryText
}

