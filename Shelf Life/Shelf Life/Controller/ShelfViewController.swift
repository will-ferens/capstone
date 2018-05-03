//
//  ViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit
import os.log
import AVFoundation

class ShelfViewController: UITableViewController {

  var books = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleBooks()
    }
    
   
    
    
    private func loadSampleBooks() {
        guard let book1 = Book(title: "Anna Karenina", author: "Leo Tolstoy", cover: nil)
            else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book2 = Book(title: "Brothers Karamazov", author: "Fyodor Dostoevsky", cover: nil) else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book3 = Book(title: "Doctor Zhivago", author: "Boris Pasternak", cover: nil)
            else {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)

        switch(segue.identifier ?? "") {
        case "ShowBookDetail":
            guard let BookDetailViewController = segue.destination as? BookDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedBookCell = sender as? BookTableViewCell else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let indexPath = tableView.indexPath(for: selectedBookCell) else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            let selectedBook = books[indexPath.row]
//            BookDetailViewController.book = selectedBook.title!
            BookDetailViewController.book = Book(title: String(selectedBook.title!), author: String(selectedBook.author!), cover: nil)
//            BookDetailViewController.author.text = selectedBook.author
//            BookDetailViewController.cover.image = selectedBook.cover
            
        default:
            fatalError("Unexpected destination: \(segue.identifier)")
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
            
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let avMetadata = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
            let isbn = avMetadata.stringValue else { return }
        DispatchQueue.main.sync {
            
        }
    }
    

}

