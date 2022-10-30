Original App Design Project - README
===

# LibsterApp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)


## Overview

### Description
[Description of your app]


### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**


## Product Spec

### 1. User Stories

**Required Must-have Stories**

* User sees and taps on the app icon to open app
* User sees a styled launch screen while the app launches
* User can tap on login button to be taken to login screen or
* User can tap on signup button to be taken to signup screen
* If logging in, then check if username and password matches in order to go to the dashboard
* If signing up, then check that the username and email are not already being used
* Fetch user row and rows of associated tables from the server
* If signing up, then add a new row to the server table for new user
* Fetch the top 20 books to be displayed in the all books tab by default
* User's session is opened and saved
* User sees the collection of books that they are borrowing sorted by name of book
* User also sees the navigation bar at the bottom of the screen
* User can navigate to the bookmarks screen using the navigation bar to continue reading each book
* User can navigate to the all books screen using the navigation bar to see the selection of books
* User can navigate to the profile screen using the navigation bar to see the logout button and profile details and settings
* User can continue reading the book
* User sees the book's cover author, summary, genre, rating, and how many others have read it
* User can rate the book
* User can favorite the book
* User taps on a bookmarked book to continue reading
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

* User can share their library


### 2. Screen Archetypes

* Launch screen
   * App launches

* Welcome screen
   * User taps on login button to be taken to login screen or
   * user taps on signup button to be taken to signup screen
     
* Login Screen
   * User fills in their username and password, then taps the 'login' button
   * If logging in, then check if username and password matches in order to go to the dashboard
   * Fetch user row and rows of associated tables from the server
   * User's session is opened and saved

* Signup Screen
   * User fills in the desired username and password, verifies the password, the associated email, verifies the email, then taps the 'signup' button
   * If signing up, then check that the username and email are not already being used
   * Add a new row to the server table for new user
     
 * Loading screen
   * If logging in, then fetch user row and rows of associated tables from the server
   * If signing up, then add a new row to the server table for new user
   * Fetch the top 20 books to be displayed in the all books tab by default
     
* Dashboard screen
   * User sees the collection of books that they are borrowing sorted by name of book
   * User also sees the navigation bar at the bottom of the screen
   * User can tap on a book to see the book's information screen
   * User can navigate to the bookmarks screen using the navigation bar to continue reading each book
   * User can navigate to the all books screen using the navigation bar to see the selection of books
   * User can navigate to the profile screen using the navigation bar to see the logout button and profile details and settings

* Details screen
   * User can continue reading the book
   * User sees the book's cover, author, summary, genre, rating, and how many others have read it
   * User can rate the book
   * User can favorite the book

* Bookmarks screen
   * User taps on a bookmarked book to continue reading

* All books screen
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

* [fill out your first tab]
* [fill out your second tab]
* [fill out your third tab]

**Flow Navigation** (Screen to Screen)

* [list first screen here]
   * [list screen navigation here]
   * ...
* [list second screen here]
   * [list screen navigation here]
   * ...

## Wireframes
<img src="https://github.com/Group-26-COP4655/LibraryApp/blob/main/IMG_7300.jpg" width=600>
