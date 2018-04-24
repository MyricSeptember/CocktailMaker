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
    
    init(with json: [AnyHashable: Any]) {
        if let title = json["title"] as? String {  self.title = title}
        if let author = json["author"] as? String {  self.author = author}
        if let lines = json["lines"] as? [String] {  self.lines = lines}
        if let linecount = json["linecount"] as? Int {  self.linecount = linecount}
    }
}
