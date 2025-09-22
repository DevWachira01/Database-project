-- Create DATABASE libraryDb
CREATE DATABASE libraryDb;
USE libraryDb;

-- Create members Table
CREATE TABLE members(
                   member_Id INT AUTO_INCREMENT PRIMARY KEY,
                   firstName VARCHAR(100) NOT NULL,
                   lastName VARCHAR(100) NOT NULL,
                   email VARCHAR(150) UNIQUE NOT NULL,
                   phoneNumber VARCHAR(20),
                   joinDate  DATETIME 
                   );

-- create Authors Table
CREATE TABLE authors(
				   authorId INT AUTO_INCREMENT PRIMARY KEY,
                   Name VARCHAR(150) NOT NULL
                     );


CREATE TABLE categories(
					   categoryId INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(100) NOT NULL
                        );

-- create Books Table
CREATE TABLE books(
				bookId INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(200) NOT NULL,
                isbn VARCHAR(20) UNIQUE NOT NULL,
                categoryId INT,
                totalCopies INT NOT NULL DEFAULT 1,
                available_copies INT NOT NULL DEFAULT 1,
                FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
                   );
					

CREATE TABLE bookAuthors (
			        bookId INT,
                    authorId INT,
                    PRIMARY KEY (bookId, authorId),
                    FOREIGN KEY (bookId) REFERENCES books(bookId),
                    FOREIGN KEY (authorId) REFERENCES authors(authorId)
				        );

-- Create Borrow Table
CREATE TABLE borrow(
             borrowId INT AUTO_INCREMENT PRIMARY KEY,
             member_Id INT NOT NULL,
             bookId INT NOT NULL,
             borrowDate DATETIME,
             dueDate DATE,
             FOREIGN KEY (member_Id) REFERENCES members(member_Id),
             FOREIGN KEY (bookId) REFERENCES books(bookId)
);




