//
//  SearchDetailsViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/7/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit
import os.log

class SearchDetailsViewController: UIViewController {

    @IBOutlet weak var searchTitle: UILabel!
    
    @IBOutlet weak var searchAuthor: UILabel!
    
    
    @IBOutlet weak var searchCover: UIImageView!
    
    @IBOutlet weak var searchDescription: UITextView!
    
    @IBOutlet weak var searchCategory: UILabel!
    
    @IBOutlet weak var searchPageCount: UILabel!
    
    var bookViewed: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URL_IMAGE = URL(string: (bookViewed?.cover)!)
        
        let session = URLSession(configuration: .default)
        
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            if let e = error {
                print("error: \(e)")
            } else {
                if(response as? HTTPURLResponse) != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        
                        self.searchCover.image = image
                    } else {
                        print("image no good")
                    }
                }
            }
        }
        getImageFromUrl.resume()
        searchTitle.text = bookViewed?.title
        searchAuthor.text =  bookViewed?.author
        //searchCover.image = bookViewed?.cover
        searchDescription.text = bookViewed?.description
        searchPageCount.text = "Pages: \(String(describing: bookViewed?.pageCount))"
        
        
    }
    
//    guard let button = sender as? UIBarButtonItem, button === saveButton else {
//    os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
//    return
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIButton, button === addToShelfPressed else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let newBook = bookViewed
    }
    
    @IBOutlet weak var addToShelfPressed: UIButton!
    
   
    
    

}
