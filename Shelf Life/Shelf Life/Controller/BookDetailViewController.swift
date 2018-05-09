//
//  ViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/3/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailAuthor: UILabel!
    
    @IBOutlet weak var detailDescription: UITextView!
    
    @IBOutlet weak var detailCover: UIImageView!
    
    @IBOutlet weak var detailCategory: UILabel!
    
    @IBOutlet weak var detailPage: UILabel!
    
    
    var book: Book?
    var titlePassed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let URL_IMAGE = URL(string: (book?.cover)!)
        
        let session = URLSession(configuration: .default)
        
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            if let e = error {
                print("error: \(e)")
            } else {
                if(response as? HTTPURLResponse) != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        
                        self.detailCover.image = image
                    } else {
                        print("image no good")
                    }
                }
            }
        }
        getImageFromUrl.resume()
        
        
        
        detailTitle.text = book?.title
        detailAuthor.text = book?.author
        detailDescription.text = book?.description
        detailPage.text = "Total Pages: \(book?.pageCount)"
        //detailCover.image =
    }

    @IBAction func recommendationsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showRecommendations", sender: self)
        dismiss(animated: true, completion: nil)
    }
    
    
}
