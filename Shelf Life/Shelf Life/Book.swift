//
//  Book.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class Book {
    
//    let id = booksJSON["items"][0]["id"].string
//    let title = booksJSON["items"][0]["volumeInfo"]["title"].string
//    let author = booksJSON["items"][0]["volumeInfo"]["authors"][0].string
//    let pageCount = booksJSON["items"][0]["volumeInfo"]["pageCount"].int
//    let cover = booksJSON["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"].string
//    let description = booksJSON["items"][0]["volumeInfo"]["description"].string
    var id: String?
    var title: String?
    var author: String?
    var pageCount: Int?
    var cover: String?
    var description: String?
    
    
    init?(id: String, title: String, author: String, pageCount: Int, cover: String, description: String) {
        self.id = id
        self.title = title
        self.author = author
        self.pageCount = pageCount
        self.cover = cover
        self.description = description
    }
    
    
}



