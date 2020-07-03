//
//  CommicListViewModel.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 7/1/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import Foundation

class CommicListViewModel {
    var commicList : [ComicBook] = []
    var commicBookStore : CommicBookStore = CommicBookStore()
    
    init(_ commicBookStore : CommicBookStore) {
        self.commicBookStore = commicBookStore
    }
    
    init(_ commicList : [ComicBook]) {
        self.commicList = commicList
    }
}

extension CommicListViewModel{
    
    var numberOfSection : Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section : Int) -> Int{
        return self.commicList.count
    }
    
    func commicAtIndex(_ index : Int) -> CommicViewModel{
        let comic = self.commicList[index]
        return CommicViewModel(comic)
    }
    
    func getCommicBookList() -> [ComicBook]?{
        return self.commicBookStore.getCommicBooks()
    }
}


class CommicViewModel {
    let commic : ComicBook
    
    init(_ commic : ComicBook) {
        self.commic = commic
    }
}



extension CommicViewModel{
    var title : String{
        return self.commic.title
    }
    
    var description : String{
        return self.commic.character
    }
    
    var issue : String{
        return String(self.commic.issue)
    }
}


