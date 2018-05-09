//
//  ViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit
import os.log

var books = [Book]()

class ShelfViewController: UITableViewController {
    
    var scannedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        loadSampleBooks()
       
    }
    
    private func loadSampleBooks() {
        guard let book1 = Book(id: "a", title: "Anna Karenina", author: "Leo Tolstoy", pageCount: 800, cover: "https://books.google.com/books/content?id=JuMdBQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE73_u0U4noVUwZfyW3V1Gnve21kfC-6Lepe4GTqNU-a4txggArYOABQLsK6awA4WxigaFKxzZv-JVqWZhmoBf1gbOnWO-gnJjm6ruurmGTsjLw17ZTcl-F__4iWnNnL6x2jy5efQ", description: "Tolstoy produced many drafts of Anna Karenina. Crafting and recrafting each sentence with careful intent, he was anything but casual in his use of language. His project, translator Marian Schwartz observes, “was to bend language to his will, as an instrument of his aesthetic and moral convictions.” In her magnificent new translation, Schwartz embraces Tolstoy’s unusual style—she is the first English language translator ever to do so. Previous translations have departed from Tolstoy’s original, “correcting” supposed mistakes and infelicities. But Schwartz uses repetition where Tolstoy does, wields a judicious cliché when he does, and strips down descriptive passages as he does, re-creating his style in English with imagination and skill. Tolstoy’s romantic Anna, long-suffering Karenin, dashing Vronsky, and dozens of their family members, friends, and neighbors are among the most vivid characters in world literature. In the thought-provoking Introduction to this volume, Gary Saul Morson provides unusual insights into these characters, exploring what they reveal about Tolstoy’s radical conclusions on romantic love, intellectual dishonesty, the nature of happiness, the course of true evil, and more. For readers at every stage—from students first encountering Anna to literary professionals revisiting the novel—this volume will stand as the English reader’s clear first choice.")
            else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book2 = Book(id: "b", title: "Brothers Karamazov", author: "Fyodor Doestevsky", pageCount: 600, cover: "https://books.google.com/books/content?id=FdfFCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE73SYEeqxXsSKIdNwSJXGfkOGA2m665_k4KOEJZQrn7gYoTk6dE0JXz9h1E8SlnwOEcbMZ3vj_MVGiv966_4CGg8XDK8Fd3iEEyNf8pUecCtcc2KMRUkuCHAyluI7MCK7fGwSS5V", description: "The Brothers Karamazov, also translated as The Karamazov Brothers, is the final novel by the Russian author Fyodor Dostoyevsky. Dostoyevsky spent nearly two years writing The Brothers Karamazov, which was published as a serial in The Russian Messenger and completed in November 1880. The author died less than four months after its publication. The Brothers Karamazov is a passionate philosophical novel set in 19th century Russia, that enters deeply into the ethical debates of God, free will, and morality. It is a spiritual drama of moral struggles concerning faith, doubt, judgement, and reason, set against a modernizing Russia, with a plot which revolves around the subject of patricide. Dostoyevsky composed much of the novel in Staraya Russa, which inspired the main setting. Since its publication, it has been acclaimed as one of the supreme achievements in world literature.") else {
            fatalError("Unable to instantiate book")
        }
        
        guard let book3 = Book(id: "c", title: "Doctor Zhivago", author: "Boris Pasternak", pageCount: 800, cover: "https://books.google.com/books/content?id=cP9eKNARm4UC&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE71VVlLaxVuVKSz-y6xTvwjblU9ZlaAf4Ic0OlEs0fVo6Z6YSV-Dg3pVlTPP7PO5v12A-Eqxir5GrvLAaUMOYaEnTKcSEyubYSb3brgaJCjU7YcJZJ4dk3vx4msLLXVbAubaTxve", description: "First published in Italy in 1957 amid international controversy, Doctor Zhivago is the story of the life and loves of a poet/physician during the turmoil of the Russian Revolution. Taking his family from Moscow to what he hopes will be shelter in the Ural Mountains, Zhivago finds himself instead embroiled in the battle between the Whites and the Reds. Set against this backdrop of cruelty and strife is Zhivago's love for the tender and beautiful Lara, the very embodiment of the pain and chaos of those cataclysmic times. Pevear and Volokhonsky masterfully restore the spirit of Pasternak's original—his style, rhythms, voicings, and tone—in this beautiful translation of a classic of world literature.")
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

            BookDetailViewController.book = Book(id: String(selectedBook.id!), title: String(selectedBook.title!), author: String(selectedBook.author!), pageCount: Int(selectedBook.pageCount!), cover: String(selectedBook.cover!), description: String(selectedBook.description!))

        case "BarCodeShow":
            guard segue.destination is BarCodeViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
        case "searchDetails":
            let searchDetailsVC = segue.destination as! SearchDetailsViewController
       
        default:
            fatalError("Unexpected destination: \(String(describing: segue.identifier))")
        }
    }
    
    @IBOutlet weak var barCodeAdd: UIBarButtonItem!
    
    @IBAction func unwindToShelf(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SearchDetailsViewController, let newBook = sourceViewController.bookViewed {
            let newIndexPath = IndexPath(row: books.count, section: 0)
            books.append(newBook)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}


