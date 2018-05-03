//
//  Book.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class Book {
    
    var title: String?
    var author: String?
    var cover: UIImage?
    
    
    init?(title: String, author: String, cover: UIImage?) {
        self.title = title
        self.author = author
        self.cover = cover
    }
    
    
}



