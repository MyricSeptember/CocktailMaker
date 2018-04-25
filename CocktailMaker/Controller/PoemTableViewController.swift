//
//  PoemTableViewController.swift
//  CocktailMaker
//
//  Copyright © 2018 myric. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PoemTableViewController: UITableViewController,UINavigationControllerDelegate {
    
    //MARK: Properties
    var poems = [Poem]()
    var poetNameText : String?
    
    //TODO moVe this to the Constants class
    var BASE_URL = "http://poetrydb.org/author/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Poems"
        
        let formattedString = poetNameText!.replacingOccurrences(of: " ", with: "%20")
        getPoemData(url:"\(BASE_URL)\(formattedString)")
        
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
                
                print("Success! Got the poem data")
                let poemJSON = JSON(response.result.value!)
                let title = poemJSON
                //                print("TITLES: \(title)")
                //                print("HELO")
                self.updatePoemData(json: poemJSON)
            }
            else{
                
                
                print( response.error)
                //Handle errors NB!
            }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    //Write the updatePoemData method here:
    func updatePoemData (json : JSON){
        print(json.count)
        
        for i in 0..<json.count {
            let poem = Poem(title: json[i]["title"].stringValue,author: json[i]["author"].stringValue,lines: json[i]["lines"].arrayValue.map({$0[].stringValue}),linecount: json[i]["linecount"].intValue)
            poems.append(poem)
            
        }
        self.tableView.reloadData()
    }
}
