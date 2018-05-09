//
//  RecommendedDetailsViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/9/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class RecommendedDetailsViewController: UIViewController {

    @IBOutlet weak var rCover: UIImageView!
    
    @IBOutlet weak var rTitle: UILabel!
    
    @IBOutlet weak var rAuthor: UILabel!
    
    
    @IBOutlet weak var rDescription: UITextView!
    @IBOutlet weak var rCategory: UILabel!
    
    @IBOutlet weak var rPageCount: UILabel!
    
    var book: Book?

    
    
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
                        
                        self.rCover.image = image
                    } else {
                        print("image no good")
                    }
                }
            }
        }
        getImageFromUrl.resume()

        rTitle.text = book?.title
        rAuthor.text = book?.author
        rDescription.text = book?.description
        rPageCount.text = "Pages : \(book?.pageCount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
