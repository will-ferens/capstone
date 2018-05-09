//
//  RecommendationsTableViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/9/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

class RecommendationsTableViewController: UITableViewController {

    
    var recommendedBooks = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRecommendedBooks()

    }

    private func loadRecommendedBooks() {
        guard let book1 = Book(id: "1", title: "War and Peace", author: "Leo Tolstoy", pageCount: 1200, cover: "https://books.google.com/books/content?id=5lpoAwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE71KCBx22uF2DownLOmquotXTbZ8dFs-OQQKKixuThgZmUbjfUGqlLn7vFrX6Dx17EIEkJYK-o1TQ0QgYpI103JXfzrwYrfnyk1rW2Tq8FvxGJRhdQyfewdueDjzOyDb0Xf3bL6B", description: "War and Peace tells the story of five aristocratic families—the Bezukhovs, the Bolkonskys, the Rostovs, the Kuragins and the Drubetskoys—and the entanglements of their personal lives with the then contemporary history of 1805 to 1813, principally Napoleon's invasion of Russia in 1812. The Bezukhovs, while very rich, are a fragmented family as the old Count, Kirill Vladimirovich, has fathered dozens of illegitimate sons. The Bolkonskys are an old established and wealthy family based at Bald Hills. Old Prince Bolkonsky, Nikolai Andreevich, served as a general under Catherine the Great, in earlier wars. The Moscow Rostovs have many estates, but never enough cash. They are a closely knit, loving family who live for the moment regardless of their financial situation. The Kuragin family has three children, who are all of questionable character. The Drubetskoy family is of impoverished nobility, and consists of an elderly mother and her only son, Boris, whom she wishes to push up the career ladder.")
            else {
                fatalError("Unable to instantiate book")
        }
        guard let book2 = Book(id: "2", title: "Dead Souls", author: "Nikolai Gogol", pageCount: 634, cover: "https://books.google.com/books/content?id=zs41DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE72FpK8eILHj59AtworUkdnys_9ijOaI1Q9rO7CpZyIa1mZ70UFRjKmKPscG2oUYBaBgb6LJOjgXYgraetG3Bnfa41V52wutw63Ltqs1PcngVVGocOTibhsmA-uCMVEAwpk1tUte", description: "The story follows the exploits of Chichikov, a middle-aged gentleman of middling social class and means. Chichikov arrives in a small town and turns on the charm to woo key local officials and landowners. He reveals little about his past, or his purpose, as he sets about carrying out his bizarre and mysterious plan to acquire dead souls.")
            else {
                fatalError("Unable to instantiate book")
        }
        guard let book3 = Book(id: "3", title: "Madame Bovary", author: "Gustav Flaubert", pageCount: 335, cover: "https://books.google.com/books/content?id=Cg5CwY-GAl0C&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE71ndHDyCC769rBK3y7spfPJzO-bcFh0rq25L0Ti_Kd5OUsS6dfaJ8cZDOaaKQjdUU8iCtPfegAiSHNaT8Jg-7R8FLUKBDuIPuRMxXk2KStKuYwmxFD-Ylxyhjkbc0GIlWZsXbOY", description: "For this novel of French bourgeois life in all its inglorious banality, Flaubert invented a paradoxically original and wholly modern style. His heroine, Emma Bovary, a bored provincial housewife, abandons her husband to pursue the libertine Rodolphe in a desperate love affair. A succès de scandale in its day, Madame Bovary remains a powerful and scintillating novel.")
            else {
                fatalError("Unable to instantiate book")
        }
        guard let book4 = Book(id: "4", title: "Sofia Petrovna", author: "Lydia Chukovskaya", pageCount: 120, cover: "https://books.google.com/books/content?id=XZK3wOoCsGgC&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE72o44lsDouR6P-Ri1rKBrgfAf1MlmwCd4DnOs04oGCpSWTfb7SmNlUzW7M_qLDhnlkmx20epLHqOkqWpSH_NY8TKCHTajA3ZuVCHGhqFOzb42cScFIRieBfGCqxpKpFRr-x26_K", description: "Sofia Petrovna is Lydia Chukovskaya's fictional account of the Great Purge. Sofia is a Soviet Everywoman, a doctor's widow who works as a typist in a Leningrad publishing house. When her beloved son is caught up in the maelstrom of the purge, she joins the long lines of women outside the prosecutor's office, hoping against hope for good news. Confronted with a world that makes no moral sense, Sofia goes mad, a madness which manifests itself in delusions little different from the lies those around her tell every day to protect themselves. Sofia Petrovna offers a rare and vital record of Stalin's Great Purges.")
            else {
                fatalError("Unable to instantiate book")
        }
        guard let book5 = Book(id: "5", title: "The Big Green Tent", author: " Ludmila Ulitskaya", pageCount: 576, cover: "https://books.google.com/books/content?id=4-2yAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73NquTBbQX8qg_HOcWH_kFiaNUUuL2q2vSoWgnpp6x0cOu8mEfby63l0tfRm6aXkz9jMYDravj7KDoxzWL30OKdLoP2R7T5SXFQpsY4BFoaEYaljXKELLUgcCkhZIQ2n4qZR2VO", description: "The Big Green Tent epitomizes what we think of when we imagine the classic Russian novel. With epic breadth and intimate detail, Ludmila Ulitskaya’s remarkable work tells the story of three school friends who meet in Moscow in the 1950s and go on to embody the heroism, folly, compromise, and hope of the Soviet dissident experience. These three boys—an orphaned poet; a gifted, fragile pianist; and a budding photographer with a talent for collecting secrets—struggle to reach adulthood in a society where their heroes have been censored and exiled. Rich with love stories, intrigue, and a cast of dissenters and spies, The Big Green Tent offers a panoramic survey of life after Stalin and a dramatic investigation into the prospects for individual integrity in a society defined by the KGB. Each of the central characters seeks to transcend an oppressive regime through art, a love of Russian literature, and activism. And each of them ends up face-to-face with a secret police that is highly skilled at fomenting paranoia, division, and self-betrayal. A man and his wife each become collaborators, without the other knowing; an artist is chased into the woods, where he remains in hiding for four years; a researcher is forced to deem a patient insane, damning him to torture in a psychiatric ward. Ludmila Ulitskaya’s novel belongs to the tradition of Dostoevsky, Tolstoy, and Pasternak: it is a work consumed with politics, love, and belief—and a revelation of life in dark times.")
            else {
                fatalError("Unable to instantiate book")
        }
        
        recommendedBooks += [book1, book2, book3, book4, book5]
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recommendedBooks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedTableViewCell", for: indexPath) as? RecommendedTableViewCell else {
            fatalError("not an instance")
        }
        
        let rBook = recommendedBooks[indexPath.row]
        
        cell.title.text = rBook.title
        cell.author.text = rBook.author
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        switch(segue.identifier ?? "") {
        case "ShowRecommendedDetail":
            guard let rDetailVC = segue.destination as? RecommendedDetailsViewController else {
                fatalError("")
            }
            guard let selectedBookCell = sender as? RecommendedTableViewCell else {
                fatalError("")
            }
            guard let indexPath = tableView.indexPath(for: selectedBookCell) else {
                fatalError("")
            }
            
            let selectedBook = recommendedBooks[indexPath.row]
            
            rDetailVC.book = Book(id: String(selectedBook.id!), title: String(selectedBook.title!), author: String(selectedBook.author!), pageCount: Int(selectedBook.pageCount!), cover: String(selectedBook.cover!), description: String(selectedBook.description!))
        default:
            fatalError()
        }
       
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
