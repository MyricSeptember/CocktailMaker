//
//  PoemTableViewController.swift
//  CocktailMaker
//
//  Copyright © 2018 myric. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PoemTableViewController: UITableViewController {
    
    //MARK: Properties
    var poems = [Poem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Poems"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PoemTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PoemTableViewCell else {
            
            fatalError("The dequeue cell is not an instance of PoemTableViewCell")
        }
        
        //Fetches the appropriate meal for the data source layout
        let poem = poems[indexPath.row]
        
        cell.poemNameLabel.text = poem.title
        
        return cell
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getPoemData method here:
    func getPoemData(url : String){
        
        Alamofire.request(url,method : .get).responseJSON {
            response in
            if response.result.isSuccess{
                
                print("Success! Got the weather data")
                let poemJSON : JSON = JSON(response.result.value!)
                let title = poemJSON["title"]
                self.updatePoemData(json: title)
            }
            else{
                
                //Handle errors NB!
            }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    //Write the updatePoemData method here:
    func updatePoemData (json : JSON){
        //let poem = Poem(with: (json as? [AnyHashable: Any])!)
        
        //        for poem in json{
        //            if let ss = poem.1.rawString() {
        //                print(ss)
        //                poems.append(ss)
        //            }
        //        }
        self.tableView.reloadData()
    }
}
