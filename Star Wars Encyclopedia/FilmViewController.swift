//
//  FilmViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Patrick Hayes on 11/14/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {

    var films: [String]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilms(completionHandler: {data, response, error in
            do {
                //Try convering the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.films.append(filmDict["title"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
        
        
//        let url = URL(string: "http://swapi.co/api/films/")
//
//        let session = URLSession.shared

//        let task = session.dataTask(with: url!, completionHandler: {
//            data, response, error in
//            do{
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    if let results = jsonResult["results"] as? NSArray { //casting results from JSON into an array object
//                        for film in results { //iterating through all results received
//                            let filmDict = film as! NSDictionary // making filmdict a variable to hold each iteration which is cast as a dictionary object
//                            self.films.append(filmDict["title"]! as! String) //appending films to films array, cast as a string
//                        }
//                    }
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                }
//            }catch{
//                print(error)
//            }
//        })
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = films[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FilmViewController will appear")
    }
    

}
