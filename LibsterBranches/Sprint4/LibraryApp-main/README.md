
Original App Design Project - README
## Group-26
===

# LibsterApp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)


## Overview

Description

A library app where a user may sign up/sign in/sign out, and browse through a collection of books. The user can utilize a navigation bar to navigate the app and can 
use a search bar to find books or sort them based on numerous search criteria like author/genre/rating. The user can also bookmark books for later reading and see all 
owned books on a library page, including bookmarked ones.

App Evaluation

Category: Books/Productivity

Mobile: This app would initally be developed for mobile but could easily have its features ported to a computer application or even a website application. The 
potential features on a computer or web app would be almost the same as the mobile features, allowing for a seamless transition if it was decided to have such 
applications.

Story: User signs up for an account or logs in and can select to pick up on a book they have already bookmarked, or search through a selection of books, finding the 
right one for them based on numerous kinds of search criteria. When the users wants to stop for now, they will bookmark the current page and it will save to their 
library.

Market: Individuals using this app would be any avid book reader or anyone would like to easy access to books in general. Since the app makes it very convenient to 
read and pick up where you left off, readers of all levels and frequencies would enjoy the app.

Habit: The usage of this app would depend entirely on the user. If they are used to often reading books, they may use it much more frequencty than other users. 
However, this app would be used especially for instances of travel, where it is more convenient to have books stored in an app rather than carrying physical copies.

Scope: At the begining our app would likely have a limited selection of books but we could exand this in the future. We could also expand the features, with the 
possibility of adding audiobooks and more accessibility options.


## Product Spec

### 1. User Stories

**Required Must-have Stories**

* User sees and taps on the app icon to open app
* User sees a styled launch screen while the app launches
* User can tap on login button to be taken to login screen or
* User can tap on signup button to be taken to signup screen
* If logging in, then check if username and password matches in order to go to the dashboard
* If signing up, then check that the username and email are not already being used
* If there's an error in the process, then the user sees the error displayed
* Fetch user row and rows of associated tables from the server
* If signing up, then add a new row to the server table for new user
* Fetch the top 20 books to be displayed in the selection tab by default
* User's session is opened and saved
* User sees the collection of books that they are borrowing sorted by name of book
* User also sees the navigation bar at the bottom of the screen
* User can navigate to the bookmarks screen using the navigation bar to continue reading each book
* User can navigate to the selection screen using the navigation bar to see the selection of books
* User can navigate to the profile screen using the navigation bar to see the logout button and profile details and settings
* User can continue reading the book
* User sees the book's cover author, summary, genre, rating, and how many others have read it
* User can rate the book
* User can favorite the book
* User taps on a bookmarked book to continue reading
* User reads the book
* User turns the pages
* User makes a bookmark
* User can scroll through the top 20 books that are displayed by default
* User can search for a book by genre, title, or author
* User can sort the books by rating, popularity, name of author (alphabetically), title of book (alphabetically), or length
* User can select a book to go to the book's checkout screen
* User sees the book's cover, title, author, summary, rating, and number of time it has been checked out
* User taps the checkout button
* User can logout
* User's session is closed when logging out
* User sees their username at the top (to the left of the logout button)
* User seen profile picture, a bio, and their favorited books

**Optional Nice-to-have Stories**

* User can add friends
* User can share their library
* User can direct message friends
* Can see and post reviews


### 2. Screen Archetypes

* Launch screen
   * App launches

* Welcome screen
   * User taps on login button to be taken to login screen or
   * user taps on signup button to be taken to signup screen
     
* Login Screen
   * User fills in their username and password, then taps the 'login' button
   * If there's an error in the process, then the user sees the error displayed
   * If logging in, then check if username and password matches in order to go to the dashboard
   * User's session is opened and saved

* Signup Screen
   * User fills in the desired username and password, verifies the password, the associated email, verifies the email, then taps the 'signup' button
   * If there's an error in the process, then the user sees the error displayed
   * If signing up, then check that the username and email are not already being used
     
 * Loading screen
   * If logging in, then fetch user row and rows of associated tables from the server
   * If signing up, then add a new row to the server table for new user
   * Fetch the top 20 books to be displayed in the selection tab by default
     
* Dashboard screen
   * User sees the collection of books that they are borrowing sorted by name of book
   * User also sees the navigation bar at the bottom of the screen
   * User can tap on a book to see the book's information screen
   * User can navigate to the bookmarks screen using the navigation bar to continue reading each book
   * User can navigate to the selection screen using the navigation bar to see the selection of books
   * User can navigate to the profile screen using the navigation bar to see the logout button and profile details and settings

* Details screen
   * User can continue reading the book
   * User sees the book's cover, author, summary, genre, rating, and how many others have read it
   * User can rate the book
   * User can favorite the book
 
* Book screen
   * User reads the book
   * User turns the pages
   * User makes a bookmark

* Bookmarks screen
   * User taps on a bookmarked book to continue reading

* Selection screen
   * User can scroll through the top 20 books that are displayed by default
   * User can search for a book by genre, title, or author
   * User can sort the books by rating, popularity, name of author (alphabetically), title of book (alphabetically), or length
   * User can select a book to go to the book's checkout screen

* Checkout screen
   * User sees the book's cover, title, author, summary, rating, and number of time it has been checked out
   * User taps the checkout button

* Profile screen
   * User can logout
   * User's session is closed when logging out
   * User sees their username at the top (to the left of the logout button)
   * User seen profile picture, a bio, and their favorited books


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dashboard
* Bookmarks
* Selection
* Profile

**Flow Navigation** (Screen to Screen)

* From: Welcome screen
   * To: Signup screen (and back using cancel at the bottom)
   * To: Login screen (and back using cancel at the bottom)

* From: Signup screen
   * To: Loading Screen (forced on successful submission)

* From: Login screen
   * To: Loading Screen (forced on successful submission)

* From: Loading screen
   * To: Dashboard (forced when done loading) 

* From: Dashboard
   * To: Details Screen (by tapping on a book)

* From: Details screen
   * To: Dashboard (using back at the top)
   * To: Book screen (by tapping on the read button)
   * To: Selection screen (using back at the top)

* From: Book screen
   * To: Details screen (using back at the top)
   * To: Bookmarks screen (using back at the top)

* From: Bookmarks screen
   * To: Book screen (by tapping on a bookmark)

* From: Book screen
   * To: Details screen (using back at the top)

* From: Selection screen
   * To: Details screen (by tapping on a book)

* From: Profile screen
   * To: Details screen (by tapping on a book)
   * To: Welcome screen (by tapping on the signout button)


## Wireframes
<img src="https://github.com/Group-26-COP4655/LibraryApp/blob/main/IMG_7300.jpg" width=600>


## Schema 

### Models

#### User

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| User Id            | String             | An alphanumeric string uniquely identifying a user object                          |
| Username           | String             | The name chosen for an account that is displayed on the user's profile page        |
| Email              | String             | An email to be tied to an account                                                  |

#### Account

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| Profile Picture    | File               | An image that is displayed on the user's profile page                              |
| Bio                | String             | A description of the user that is displayed on the user's profile page             |
| Borrowed Books     | Array of Pointers  | Pointers to each book object of the books that the user has borrowed               |
| Bookmarks          | Array of Pointers  | Pointers to each of the bookmark objects                                           |
| Favorites          | Array of Pointers  | Pointers to each book object of the books that the user has favorited              |
| Friends            | Array of Pointers  | Pointers to each user object of the users who have been friended                   |

#### Author

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| Author Id          | String             | An alphanumeric string uniquely identifying an author object                       |
| Name               | String             | The name of the author                                                             |
| Works              | Array of Pointers  | Pointers to each book object of the books written by the author                    |

#### Book

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| Book Id            | String             | An alphanumeric string uniquely identifying a book object                          |
| Title              | String             | The name of the book                                                               |
| Author             | String             | The name of the author                                                             |
| Cover              | File               | An image that is displayed on the book details page                                |
| ISBN               | String             | A numeric string uniquely identifying a book                                       |
| Genre              | String             | The content by which the book is categorized                                       |
| Summary            | String             | A description of the book's plot                                                   |
| Date Published     | String             | The date the book was published                                                    |
| Rating             | Float              | A decimal value representing how will liked is the book                            |
| Readers            | Integer            | The number of people who have the book in their library                            |
| Book               | String             | The link to the book                                                               |
| Bookmark           | String             | The link of the last page read by the reader                                       |

#### Bookmark

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| Book Id            | Pointer            | An array of pointers to strings uniquely identifying each book object              |
| Page Number        | Integer            | The page number of the selected bookmark                                           |
| Sentence           | String             | The exact sentence where the reader stopped reading                                |
| Last Read          | String             | The date and time the reader last read the book                                    |

#### Popular 20

| Property           | Type               | Description                                                                        |
| -------------      | -------------      | -------------                                                                      |
| Popular Books      | Array of Pointers  | Array of pointers to each book object that for each of the 20 most popular books   |


### Networking

List of network requests by screen

   * Login Screen
      * (Read/GET) Query Parse for username and password 
      ```swift
      let username = usernameField.text!
      let password = passwordField.text!
      PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        ```
    
   * Signup Screen
      * (Create/POST) Add a user as a new row to the User table of the parse server 
      ```swift
      let user = PFUser()
      user.username = usernameField.text
      user.password = passwordFIeld.text
      user.signUpInBackground{ (success, error) in
          if success {
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
              print("Error: \(String(describing: error?.localizedDescription))")
          }
      }
      ```
        
      * (Create/POST) Add an account as a new row to the 'Accounts' table of the parse server 
      ```swift
      var user = PFUser.current()
      let Account = PFObject(className: "Accounts")
      print(user)
      Account["profilePicture"] = "url"
      Account["bio"] = "ipsem lorem"
      Account["borrowedBooks"] = []
      Account["bookmarks"] = []
      Account["favorites"] = []
      Account["friends"] = []
      Account["user"] = user
      Account.saveInBackground{ (success, error) in
          if success {
              print("saved!")
          }else{
              print("error!")
          }
      }
      ```
    
   * Loading Screen
      * (Read/GET) Query Parse for an instance of the 'User' object
      ```swift
      var query = PFUser.query()
      query!.whereKey("username", equalTo:usernameField.text)
      do {
          var queryResult = try (query?.findObjects())
          var currentUserObj = queryResult! as [PFObject]
          var currentUser = currentUserObj[0]
          print(currentUser)
      } catch {
          print("User creation failed with error: \(error)")
      }
      ```
        
      * (Read/GET) Query Parse for the 'Popular 20' object
      ```swift
      let query = PFQuery(className:"Popular")
      query.getObjectInBackground(withId: "8IhEeAImgN") { (top, error) in
          if error == nil {
              print(top)
          } else {
              // Fail!
          }
      }
      ``` 

   * Details Screen
      * (Update/PUT) Append a 'Book' object to the 'Favorites' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["favorites"] = bookObjArr
             account.saveInBackground()
         }
      }
      ```
      
      * (Update/PUT) Remove a 'Book' object from the 'Favorites' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["favorites"] = bookObjArr
             account.saveInBackground()
         }
      }
      ```

   * Book Screen
      * (Update/PUT) Append a 'Bookmark' object to the 'Bookmarks' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["bookmarks"] = bookmarkObjArr
             account.saveInBackground()
         }
      }
      ```
      
      * (Update/PUT) Remove a 'Bookmark' object from the 'Bookmarks' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["bookmarks"] = bookmarkObjArr
             account.saveInBackground()
         }
      }
      ```

   * Selection Screen
      * (Read/GET) Query Open Library API to look for a book or collection of books
      ```swift
      var url : String = "https://openlibrary.org/search.json?q=<search key>"
      var request : NSMutableURLRequest = NSMutableURLRequest()
      request.URL = NSURL(string: url)
      request.HTTPMethod = "GET"

      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error:         NSError!) -> Void in
      var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
      let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as?           NSDictionary

      if (jsonResult != nil) {
        // process jsonResult
      } else {
       // couldn't load JSON, look at error
      }
      })
      ```
      
      * (Read/GET) Query Open Library API for the details of a selected book
      ```swift
      var url : String = "https://openlibrary.org/api/books?                                       
      bibkeys=ISBN:9780980200447&jscmd=details&format=json"
      var request : NSMutableURLRequest = NSMutableURLRequest()
      request.URL = NSURL(string: url)
      request.HTTPMethod = "GET"

      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error:         NSError!) -> Void in
      var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
      let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as?           NSDictionary

      if (jsonResult != nil) {
        // process jsonResult
      } else {
       // couldn't load JSON, look at error
      }
      })
      ```

   * Profile Screen
      * (DELETE) Remove the current user's account row from the 'User' table (when account is deleted)
      ```swift
      PFObject.deleteAll(inBackground: objectArray) { (succeeded, error) in
      if (succeeded) {
          // The array of objects was successfully deleted.
      } else {
          // There was an error. Check the errors localizedDescription.
          }
      }
      ```

      * (Update/PUT) Append a 'User' object to the 'Friends' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["friends"] = friendsObjArr
             account.saveInBackground()
         }
      }
      ```
      
      * (Update/PUT) Remove a 'User' object from the 'Friends' array
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["friends"] = friendsObjArr
             account.saveInBackground()
         }
      }
      ```
      
      * (Update/PUT) Change the image used for the 'Profile Picture'
      ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["profilePicture"] = "profileUrl"
             account.saveInBackground()
         }
      }
      ```   
      
      * (Update/PUT) Change the string used for the 'Bio'
       ```swift
      let query = PFQuery(className:"Accounts")
      query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
          if let error = error {
             print(error.localizedDescription)
          } else if let account = account {
             account["bio"] = "new bio"
             account.saveInBackground()
         }
      }
      ```

Existing API Endpoints

Open Library

   * BASE URL - https://openlibrary.org/developers/api

      | HTTP Verb     | Endpoint                                          | Description                                  |
      | ------------- | -------------                                     | -------------                                |
      | `GET`         | /search.json?q=query                              | Search for books                             |
      | `GET`         | /authors.json?q=query                             | Search for authors                           |
      | `GET`         | /authors/key/works.json                           | Get works of an author                       |
      | `GET`         | /volumes/brief/isbn/key.json                      | Get the link to read a book                  |
      | `GET`         | /books?bibkeys=ISBN:key&jscmd=details&format=json | Get the details of a book                    |
      
      
      
## Functionality

### User Stories

**Required Must-have Stories**

#### Sprint 1

- [X] User sees and taps on the app icon to open app
- [X] User sees a styled launch screen while the app launches
- [X] User can tap on login button to be taken to login screen or
- [X] User can tap on signup button to be taken to signup screen
- [X] If signing up, then check that the username and email are not already being used

- ![](https://github.com/Group-26-COP4655/LibraryApp/blob/main/group26.gif)

- [X] If logging in, then check if username and password matches in order to go to the dashboard
- [X] If there's an error in the process, then the user sees the error displayed

- ![](https://github.com/Group-26-COP4655/LibraryApp/blob/main/group26b.gif)

- [X] Fetch user row and rows of associated tables from the server
- [X] If signing up, then add a new row to the server table for new user
- [X] Fetch the top 20 books to be displayed in the selection tab by default
- [X] User's session is opened and saved

- ![](https://github.com/Group-26-COP4655/LibraryApp/blob/main/group26c.gif)

#### Sprint 2

- [X] User sees the collection of books that they are borrowing
- [X] User also sees the navigation bar at the bottom of the screen
- [X] User can continue reading the book
- [X] User can tap on a book in their collection to see the details page
- [X] User sees the book's cover author, summary, genre, rating, and how many others have read it
- [X] User can rate the book
- [X] User can favorite the book
- [X] User reads the book
- [X] User turns the pages

- ![](https://github.com/Group-26-COP4655/LibraryApp/blob/main/group26d.gif))

#### Sprint 3


- [X] User can navigate to the bookmarks screen using the navigation bar
- [X] User can navigate to the selection screen using the navigation bar to see the selection of books
- [X] User can see the top 20 books that are displayed by default
- [X] User can navigate to the profile screen using the navigation bar
- [X] User can see logout button on the profile page
- [X] User can logout
- [X] User's session is closed when logging out

- ![](https://github.com/Group-26-COP4655/LibraryApp/blob/main/group26e.gif)

#### Sprint 4

- [X] User makes a bookmark
- [X] User sees their bookmarks as a collection of covers
- [X] User clicks on a bookmark (book cover) to go to the continue reading page
- [X] User clicks continue reading to start at the page where they made the bookmark
- [X] User clicks close to stop reading
- [X] User click remove to remove the bookmark and gets taken back to the bookmarks page
- [X] User taps on a bookmark to keep reading
- [X] User can search for a book by title
- [X] User can select a book to go to the book's checkout screen
- [X] User sees the book's cover, title, author, summary, rating, and number of time it has been checked out
- [X] User taps the borrow button to get taken to OpenLibrary
- [X] User can borrow a book by clicking the save button
- [X] User sees their username at the top of the profile page
- [X] User sees their favorited books on the profile page
- [X] User can return a borrowed book


**Optional Nice-to-have Stories**

- [ ] User can add friends
- [ ] User can share their library
- [ ] User can direct message friends
- [ ] Can see and post reviews
