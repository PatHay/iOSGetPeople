//
//  FilmDetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Patrick Hayes on 11/14/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var movieTitle: String?
    var release: String?
    var director: String?
    var openingCrawl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Title: \(movieTitle!)"
        releaseDateLabel.text = "Release Date: \(release!)"
        directorLabel.text = "Director: \(director!)"
        openingCrawlLabel.text = "Opening Crawl: \(openingCrawl!)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
