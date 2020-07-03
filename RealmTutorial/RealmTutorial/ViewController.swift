//
//  ViewController.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 6/30/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var comicTableView : UITableView!
    
    private var commicListVM : CommicListViewModel!
    private var commicBookListVM : CommicListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addComic))
        navigationItem.rightBarButtonItem = add
        
        self.comicTableView.register(UINib(nibName: "ComicBookTableViewCell", bundle: nil), forCellReuseIdentifier: "ComicBookTableViewCell")
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let commicBookStore = CommicBookStore()
        self.commicBookListVM = CommicListViewModel(commicBookStore)
        let commicBookList = self.commicBookListVM.getCommicBookList()
        
        if let commicBookList = commicBookList{
            self.commicListVM = CommicListViewModel(commicBookList)
            DispatchQueue.main.async {
                self.comicTableView.reloadData()
            }
        }
    }
    
    @objc func addComic(){
        let newComicStoryBoard = UIStoryboard.init(name: "NewComic", bundle: nil)
        let newComicViewController = newComicStoryBoard.instantiateViewController(identifier: "NewCommicViewController") as! NewComicViewController
        
        self.navigationController?.pushViewController(newComicViewController, animated: true)
        
    }

}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.commicListVM.numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commicListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicBookTableViewCell", for: indexPath) as! ComicBookTableViewCell
        let comicBook = self.commicListVM.commicAtIndex(indexPath.row)
        cell.lblComicTitle.text = comicBook.title
        cell.lblComicDescription.text = comicBook.description
        cell.lblComicIssue.text = comicBook.issue
        return cell
    }
    
    
    
}
