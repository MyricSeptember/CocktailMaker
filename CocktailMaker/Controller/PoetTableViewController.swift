//
//  PoetTableViewController.swift
//  CocktailMaker
//
//  
//  Copyright © 2018 myric. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PoetTableViewController: UITableViewController {
    
    
    let BASE_URL = "http://poetrydb.org/authors"
    //MARK: Properties
    var poets = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPoetryData(url: BASE_URL)
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
        return poets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PoetTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PoetTableViewCell else {
            
            fatalError("The dequeue cell is not an instance of PoetTableViewCell")
            
        }
        
        //Fetches the appropriate meal for the data source layout
        let poet = poets[indexPath.row]
        
        cell.nameLabel.text = poet
        cell.photoImageView.image = #imageLiteral(resourceName: "defaultPhoto")
        
        if poet == "Adam Lindsay Gordon" {
            
            cell.photoImageView.image = #imageLiteral(resourceName: "Adam Lindsay Gordon")
        }
        else if poet == "Alan Seeger" {
            
            cell.photoImageView.image = #imageLiteral(resourceName: "Alan Seeger")
        }
        else if poet == "Alexander Pope" {
            
            cell.photoImageView.image = #imageLiteral(resourceName: "Alexander Pope")
        }
        else if poet == "Algernon Charles Swinburne" {
            
            cell.photoImageView.image = #imageLiteral(resourceName: "Algernon Charles Swinburne")
        }
        else if poet == "Ambrose Bierce" {
            
            cell.photoImageView.image = #imageLiteral(resourceName: "Ambrose Bierce")
        }
            
        else{
            
            cell.photoImageView.image = #imageLiteral(resourceName: "defaultPhoto")
        }
        
        return cell
    }
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getPoetryData method here:
    func getPoetryData(url : String){
        
        Alamofire.request(url,method : .get).responseJSON {
            response in
            if response.result.isSuccess{
                
                print("Success! Got the weather data")
                let poetryJSON : JSON = JSON(response.result.value!)
                let authorsArray = poetryJSON["authors"]
                let authors = poetryJSON["authors"]
                print("authors: \(authors)")
                self.updatePoetryData(json: authorsArray)
            }
            else{
                
                //Handle errors NB!
            }
            
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    //Write the updatePoetryData method here:
    func updatePoetryData (json : JSON){
        for author in json{
            
           // print("Author: \(author)")
            
            if let ss = author.1.rawString() {
                    poets.append(ss)
            }
        }
        self.tableView.reloadData()
    }
}
