//
//  DetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Patrick Hayes on 11/14/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var name: String?
    var gender: String?
    var birthday: String?
    var mass: String?
    
//    weak var delegate: PersonDetailDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: \(name!)"
        genderLabel.text = "Gender: \(gender!)"
        birthYearLabel.text = "Birth Year: \(birthday!)"
        massLabel.text = "Mass: \(mass!)"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButton(_ sender: UIButton) {
//        delegate?.cancelButtonPressed(by: self)
        dismiss(animated: true, completion: nil)
    }
    
}
