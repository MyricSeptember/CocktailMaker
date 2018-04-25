//
//  Poem.swift
//  CocktailMaker
//
//  Created by Pieter Venter on 4/24/18.
//  Copyright © 2018 myric. All rights reserved.
//

import Foundation

class Poem {
    var title =  ""
    var author = ""
    var lines = [""]
    var linecount = 0
    
    init(title:String,author:String,lines: [String],linecount:Int) {
        self.title = title
     self.author = author
     self.lines = lines
     self.linecount = linecount
    }
}
