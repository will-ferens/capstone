//
//  GoogleBooks.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/3/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//Anna Karenina isbn 9780191500374
//google books search url https://www.googleapis.com/books/v1/volumes?q=search+terms

import Foundation
import SwiftyJSON
import Alamofire

class GoogleBooks {
    let GOOGLE_BOOKS = "https://www.googleapis.com/books/v1/volumes?q=search+terms"
    
    
    
    static func getBooks(url: String, parameters: [String : String]) {
        Alamofire.request(url, method: .get, parameters: parameters).validate().responseJSON{
            response in
            if response.result.isSuccess {
                print("shit yeah")
                
                let booksJSON : JSON = JSON(response.result.value!)
                
                let id = booksJSON["items"][0]["id"].string
                let title = booksJSON["items"][0]["volumeInfo"]["title"].string
                let author = booksJSON["items"][0]["volumeInfo"]["authors"][0].string
                let pageCount = booksJSON["items"][0]["volumeInfo"]["pageCount"].int
                let cover = booksJSON["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"].string
                let description = booksJSON["items"][0]["volumeInfo"]["description"].string
                
                Book.init(id: id!, title: title!, author: author!, pageCount: pageCount!, cover: cover!, description: description!)
                
                print(booksJSON)
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    
    

}

//{
//    "totalItems" : 3962,
//    "kind" : "books#volumes",
//    "items" : [
//    {
//    "selfLink" : "https:\/\/www.googleapis.com\/books\/v1\/volumes\/zYw3sYFtz9kC",
//    "kind" : "books#volume",
//    "id" : "zYw3sYFtz9kC",
//    "accessInfo" : {
//    "embeddable" : true,
//    "publicDomain" : false,
//    "webReaderLink" : "http:\/\/play.google.com\/books\/reader?id=zYw3sYFtz9kC&hl=&printsec=frontcover&source=gbs_api",
//    "quoteSharingAllowed" : false,
//    "pdf" : {
//    "isAvailable" : true,
//    "acsTokenLink" : "http:\/\/books.google.com\/books\/download\/The_Contemporary_Thesaurus_of_Search_Ter-sample-pdf.acsm?id=zYw3sYFtz9kC&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//    },
//    "accessViewStatus" : "SAMPLE",
//    "epub" : {
//    "isAvailable" : false
//    },
//    "viewability" : "PARTIAL",
//    "textToSpeechPermission" : "ALLOWED",
//    "country" : "US"
//    },
//    "searchInfo" : {
//    "textSnippet" : "Now in its second edition, Sara Knapp has updated and expanded this invaluable resource. Unlike any other thesaurus available, this popular guide offers a wealth of natural language options in a convenient, A-to-Z format."
//    },
//    "saleInfo" : {
//    "listPrice" : {
//    "currencyCode" : "USD",
//    "amount" : 179.94999999999999
//    },
//    "buyLink" : "https:\/\/play.google.com\/store\/books\/details?id=zYw3sYFtz9kC&rdid=book-zYw3sYFtz9kC&rdot=1&source=gbs_api",
//    "retailPrice" : {
//    "currencyCode" : "USD",
//    "amount" : 143.96000000000001
//    },
//    "isEbook" : true,
//    "saleability" : "FOR_SALE",
//    "offers" : [
//    {
//    "listPrice" : {
//    "amountInMicros" : 179950000,
//    "currencyCode" : "USD"
//    },
//    "finskyOfferType" : 1,
//    "giftable" : true,
//    "retailPrice" : {
//    "amountInMicros" : 143960000,
//    "currencyCode" : "USD"
//    }
//    }
//    ],
//    "country" : "US"
//    },"etag" : "6roC73zs\/4A",
//"volumeInfo" : {
//    "imageLinks" : {
//        "thumbnail" : "http:\/\/books.google.com\/books\/content?id=zYw3sYFtz9kC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//        "smallThumbnail" : "http:\/\/books.google.com\/books\/content?id=zYw3sYFtz9kC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//    },
//    "authors" : [
//    "Sara D. Knapp"
//    ],
//    "maturityRating" : "NOT_MATURE",
//    "readingModes" : {
//        "image" : true,
//        "text" : false
//    },
//    "language" : "en",
//    "previewLink" : "http:\/\/books.google.com\/books?id=zYw3sYFtz9kC&printsec=frontcover&dq=search+terms&hl=&cd=1&source=gbs_api",
//    "description" : "Whether your search is limited to a single database or is as expansive as all of cyberspace, you won't find the intended results unless you use the words that work. Now in its second edition, Sara Knapp has updated and expanded this invaluable resource. Unlike any other thesaurus available, this popular guide offers a wealth of natural language options in a convenient, A-to-Z format. It's ideal for helping users find the appropriate word or words for computer searches in the humanities, social sciences, and business. The second edition has added more than 9,000 entries to the first edition's extensive list. Now, the Thesaurus contains almost 21,000 search entries! New or expanded areas include broader coverage of business terms and humanities-including arts literature, philosophy, religion, and music.",
//    "industryIdentifiers" : [
//    {
//    "type" : "ISBN_10",
//    "identifier" : "157356107X"
//    },
//    {
//    "type" : "ISBN_13",
//    "identifier" : "9781573561075"
//    }
//    ],
//    "allowAnonLogging" : false,
//    "infoLink" : "https:\/\/play.google.com\/store\/books\/details?id=zYw3sYFtz9kC&source=gbs_api",
//    "pageCount" : 682,
//    "publisher" : "Greenwood Publishing Group",
//    "printType" : "BOOK",
//    "panelizationSummary" : {
//        "containsEpubBubbles" : false,
//        "containsImageBubbles" : false
//    },
//    "categories" : [
//    "Computers"
//    ],
//    "subtitle" : "A Guide for Natural Language Computer Searching",
//    "contentVersion" : "1.1.0.0.preview.1",
//    "canonicalVolumeLink" : "https:\/\/market.android.com\/details?id=book-zYw3sYFtz9kC",
//    "title" : "The Contemporary Thesaurus of Search Terms and Synonyms",
//    "publishedDate" : "2000"
//}
//}
