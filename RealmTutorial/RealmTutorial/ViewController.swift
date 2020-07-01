//
//  ViewController.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 6/30/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var commicBookStore = CommicBookStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addComic))
        navigationItem.rightBarButtonItem = add
        let commic1 = commicBookStore.makeNewComicBook("Comic 1", character: "Comic Char 1", issue: 10)
        let commic2 = commicBookStore.makeNewComicBook("Comic 2", character: "Comic Char 2", issue: 20)
        let commic3 = commicBookStore.makeNewComicBook("Comic 3", character: "Comic Char 3", issue: 13)
        let commic4 = commicBookStore.makeNewComicBook("Comic 4", character: "Comic Char 4", issue: 23)
        commicBookStore.saveCommicBook(commic1)
        commicBookStore.saveCommicBook(commic2)
        commicBookStore.saveCommicBook(commic3)
        commicBookStore.saveCommicBook(commic4)
        
        let commics = commicBookStore.getCommicBooks()
        
    }

    @objc func addComic(){
        print("here tap")
        let newComicStoryBoard = UIStoryboard.init(name: "NewComic", bundle: nil)
        let newComicViewController = newComicStoryBoard.instantiateViewController(identifier: "NewCommicViewController") as! NewComicViewController
        
        self.navigationController?.pushViewController(newComicViewController, animated: true)
        
    }

}

