//
//  CommicBookStore.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 6/30/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import Foundation
import RealmSwift


class CommicBookStore{
    var realm : Realm = try! Realm()
    
    public func saveCommicBook(_ comic : ComicBook){
        try! realm.write{
            realm.add(comic)
        }
    }
    
    public func getCommicBooks() -> Results<ComicBook>{
        return realm.objects(ComicBook.self)
    }
    
    public func findComicByTitle(_ title : String) -> Results<ComicBook>{
        let predicate = NSPredicate(format: "title = %@", title)
        return realm.objects(ComicBook.self).filter(predicate)
    }
    
    public func makeNewComicBook(_ title : String,character : String, issue : Int) -> ComicBook{
        let newComic = ComicBook()
        newComic.title = title
        newComic.character = character
        newComic.issue = issue
        return newComic
    }
}
