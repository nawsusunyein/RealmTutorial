//
//  NewComicViewController.swift
//  RealmTutorial
//
//  Created by Naw Su Su Nyein on 6/30/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

import UIKit

class NewComicViewController : UIViewController{
    
    @IBOutlet weak var comicTitle : UITextField!
    @IBOutlet weak var comicDescription : UITextField!
    @IBOutlet weak var comicIssue : UITextField!
    @IBOutlet weak var errorLabel : UILabel!
    
    private var commicBookStore = CommicBookStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showSuccessPopUp(){
        let successAlertController = UIAlertController(title: "", message: "Save successfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.comicTitle.text = ""
            self.comicDescription.text = ""
            self.comicIssue.text = ""
            self.errorLabel.text = ""
        })
        successAlertController.addAction(okAction)
        self.present(successAlertController, animated: true, completion: nil)
    }
    
    @IBAction func saveCommicAction(_ sender: Any) {
        let comicBook = ComicBook()
        comicBook.title = comicTitle.text ?? ""
        comicBook.character = comicDescription.text ?? ""
        comicBook.issue = Int(comicIssue.text ?? "0") ?? 0
        let errMsg = comicBook.checkCommicData()
        
        if errMsg == nil{
            commicBookStore.saveCommicBook(comicBook)
            self.showSuccessPopUp()
        }else{
            self.errorLabel.text = errMsg
        }
    }
    
}
