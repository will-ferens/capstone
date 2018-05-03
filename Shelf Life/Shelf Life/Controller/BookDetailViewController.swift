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
    

    @IBOutlet weak var detailCover: UIImageView!
    
    
    var book: Book?
    var titlePassed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitle.text = book?.title
        detailAuthor.text = book?.author
    }

    @IBAction func recommendationsPressed(_ sender: UIButton) {
    }
}
