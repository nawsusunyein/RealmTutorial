//
//  ComicBook.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 6/30/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//


import RealmSwift

class ComicBook: Object{
    @objc dynamic var title = ""
    @objc dynamic var character = ""
    @objc dynamic var issue = 0
    
    func checkCommicData() -> String?{
        if title == ""{
            return "Fill comic title"
        }else if character == ""{
            return "Fill comic character"
        }else if issue <= 0{
            return "Issue must be greater than 0"
        }
        return nil
    }
}
