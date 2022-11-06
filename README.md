
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
| UserId             | String             | An alphanumeric string uniquely identifying a user object                          |
| Username           | String             | The name chosen for an account that is displayed on the user's profile page        |
| Email              | String             | An email to be tied to an account                                                  |
| Profile Picture    | File               | An image that is displayed on the user's profile page                              |
| Bio                | String             | A description of the user that is displayed on the user's profile page             |
| Borrowed Books     | Array of Pointers  | Pointers to each book object of the books that the user has borrowed               |
| Bookmarks          | Array of Integers  | The page numbers of each book that the user has bookmarked                         |
| Favorites          | Array of Pointers  | Pointers to each book object of the books that the user has favorited              |
| Friends            | Array of Pointers  | Pointers to each user object of the users who have been friended                   |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
