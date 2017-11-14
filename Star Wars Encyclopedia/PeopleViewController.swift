//
//  PeopleViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Patrick Hayes on 11/13/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    var people: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //specify the url that we will be sending the GET request to
        let url = URL(string: "http://swapi.co/api/people/")
        //create a URLSession to handle the request tasks.  Created to run tasks to transfer data over HTTP
        let session = URLSession.shared
        //create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            //see: Swift closure expression syntax
            data, response, error in
//            print("in here")
            //see: Swift nil coalescing operator (double questionmark), used to provide an alternative argument in the case that an optional is nil
//            print(data ?? "no data") //the "no data" is a default value to use if data is nil
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
//                    print(jsonResult)
                    
                    if let results = jsonResult["results"] as? NSArray {
                        
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict["name"]! as! String)
                        }
                        
//                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
//                        print(resultsArray.count)
//                        print(resultsArray[0])
//                        print(resultsArray.firstObject)

                        
                    }
                }
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        })
        //execute the task and wait for the response before
        //running the completion handler.  This is async!
        //resume actually executes the task by running the resume method on our task object
        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    
}

