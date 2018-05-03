//
//  ViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class ShelfViewController: UITableViewController {

  var books = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleBooks()
    }
    
   
    
    
    private func loadSampleBooks() {
        guard let book1 = Book(title: "Anna Karenina", author: "Leo Tolstoy", cover: nil) else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book2 = Book(title: "Brothers Karamazov", author: "Fyodor Dostoevsky", cover: nil) else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book3 = Book(title: "Doctor Zhivago", author: "Boris Pasternak", cover: nil) else {
            fatalError("Unable to instantiate book")
        }
        
        books += [book1, book2, book3]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else {
            fatalError("poop")
        }
        
        let book = books[indexPath.row]
        
        cell.author.text = book.author
        cell.title.text = book.title
        //cell.bookImage.image = book.cover
        
        return cell
    }
    
    

}

