Project Description
    # Problem statement

        - Have you ever been in a reading rut? After finishing something you loved, you find yourself drifting, bereft of a new book to look forward to when you get home. Or maybe you're in the bookstore, holding something that almost piques your interest but after opening the first page it just falls flat. If only there were a tool to help you find that next love in your life, the next book you'll tear through in a matter of days only to grieve when you've finished it. Introducing Shelf Life!

        - Every book list application I've used is more or less the same - search a book, add it to your list, mark it as finished. My main gripe is a lack of personalization: the search results can return titles you didn't intend, and it will never suggest titles in a similar genre or by a another author.  While there a lot of reading list apps that let you save what books you'd like to read, none of them offer you the option of taking a picture of the title or author of a book to return information about the author, other titles in the genre, and authors you also might like.

        - With Shelf Life, your books will always be fresh! 

    # How will your project solve this problem?

        - By using the Google Vision API, Shelf Life will recognize a picture of a title or an author of the book in your hands. At the library, in the book store, or off your friend's bookcase, anywhere you have data or wifi and a book in your hands, Shelf Life can recoginize the author or title with a clear picture.
        - Once you've sent your picture off to Google Vision, the text will be resolved and forwarded to Good Reads, a network of book lovers that have over 700 thousand titles to choose from. The catalogued titles include descriptions, information including genre and summaries, short bios about the author, and 10 million user reviews. It's the perfect API to power personalized reccomendations based on the picture you've inputed.

    # Map the user experience

        - Upon opening their IOS app, users will be able to review the books on their Shelf. On their Shelf, users will be able to see information about their books, the author, and can prompt the app to find more recommendations based on that book's profile. They'll also be offered an option to find a new book based on a photo - either catalogued in their photo roll or to be taken live. Once they've chosen a clear, well lit photo, the app will send it to Google to parse the text in the user title. It will ultimately be forwarded to Good Reads. Good Reads will send information based on the book in the photo. This will include a brief summary of the title, the author of the title, other books the author has written, and suggestions based on that author and the genre of the title. From here, the user can choose to add new titles to their Shelf, either from the original book they've searched, or the other titles from the results that Good Reads has fetched. Users can then navigate to their shelf and behold the fresh reading life that lies ahead of them, where they'll never out of something good to read.

    # What technologies do you plan to use?

        - Swift: Swift is the language IOS developers use for iPhones, iPads, Apple Watches, and Apple TV's. It's simple, declarative syntax and design heavy interface in xCode makes it easy to build applications on a short time frame.
        - Realm Mobile Database: Using IOS core data, Realm is an interface that allows you to build a database that stores user input without having to set up a server or join traditional tables. It's an object relational database to support the data model.
        - Google Vision API: Google Vision is on the cutting edge of text recognition technology; if it's clearly printed, it can be read by the API. This saves the user the effort of typing a title and scanning through search results.
        - GoodReads API: The best community for book lovers, the data rich API has everything a personalized book app like Shelf Life needs: bios on authors, 700 thousand titles, summaries, reviews, and suggestions!

        
        
        
        
import UIKit

class ShelfViewController: UITableViewController {

    var bookArray = ["Anna Karenina", "Brothers Karamazov", "Doctor Zhivago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        
        cell.textLabel?.text = bookArray[indexPath.row]
    
        return cell
    }
}

