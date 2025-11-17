# Dictionary App with RESTful API Integration

**This project is a dynamic dictionary application that includes word listing, search, and detail view features using Flutter, Dart, and an external RESTful API.**


##  About the Project

This application functions as a mobile dictionary, allowing users to browse a list of words (English-Turkish) and search for specific terms. The primary focus of this project is on **data fetching** from a remote source, **JSON parsing**, and efficiently displaying the results using Flutter's **`FutureBuilder`** and **search functionality** within the AppBar.

* **Data Fetching:** The app connects to a provided **RESTful service endpoint** (`http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php`) to retrieve the dictionary data.
* **Architecture:** Utilizes separate classes (`Kelimeler`, `KelimelerCevap`, `Kelimelerdao`) for clean data modeling, JSON response handling, and data access operations.
* **Dynamic Search:** The application implements a dynamic search feature directly in the AppBar, which filters the displayed word list in real-time.


##  Technologies

* **Main Language:**  **Dart** The programming language for application logic and data processing.
* **Framework:** **Flutter SDK** Used for building the cross-platform mobile user interface.
* **Networking:** **`http` Package** Used for making synchronous/asynchronous GET requests to the remote API.
* **Data Handling:** **`dart:convert` (JSON)** Handling the serialization and deserialization of the JSON responses.
  

##  Key Features

The application provides robust features for a modern dictionary app:

* **Word Listing:** Displays all words fetched from the remote API in a scrollable `ListView`.
* **Dynamic Search Bar:** The AppBar dynamically converts into a `TextField` when the search icon is pressed, allowing users to enter a search term.
* **API Integration:** Functions (`tumKelimeler`, `aramaYap`) handle fetching the entire word list and specific search queries from the external service.
* **Detail Page Navigation:** Tapping on any word in the list navigates the user to the `DetaySayfa` (Detail Page) to view more information about that word.
* **Real-time Filtering:** The displayed results are instantly updated based on the `aramaKelimesi` (search term).

