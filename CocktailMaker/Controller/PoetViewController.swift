//
//  PoetViewController.swift
//  CocktailMaker

//  Copyright © 2018 myric. All rights reserved.
//

import UIKit

class PoetViewController: UIViewController,UINavigationControllerDelegate  {
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorNameText: UILabel!
    @IBOutlet weak var poemTitleText: UILabel!
    @IBOutlet weak var poemfullText: UITextView!
    
    
    var poem: Poem?
    var fullPoem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Poem"
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let poem = poem {
            
            
            authorImage.image = #imageLiteral(resourceName: "defaultPhoto")
            
            if poem.author == "Adam Lindsay Gordon" {
                
                authorImage.image  = #imageLiteral(resourceName: "Adam Lindsay Gordon")
            }
            else if poem.author  == "Alan Seeger" {
                
                authorImage.image  = #imageLiteral(resourceName: "Alan Seeger")
            }
            else if poem.author  == "Alexander Pope" {
                
                authorImage.image = #imageLiteral(resourceName: "Alexander Pope")
            }
            else if poem.author  == "Algernon Charles Swinburne" {
                
                authorImage.image = #imageLiteral(resourceName: "Algernon Charles Swinburne")
            }
            else if poem.author  == "Ambrose Bierce" {
                
                authorImage.image  = #imageLiteral(resourceName: "Ambrose Bierce")
            }
                
            else{
                
                authorImage.image  = #imageLiteral(resourceName: "defaultPhoto")
            }
            
            authorNameText.text = poem.author
            poemTitleText.text = poem.title
            for i in 0..<poem.lines.count{
                fullPoem.append("\n \(poem.lines[i])")
            }
            poemfullText.text = fullPoem
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

