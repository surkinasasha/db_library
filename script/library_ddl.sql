CREATE TABLE Readers (
      reader_id INTEGER NOT NULL PRIMARY KEY,
      full_name VARCHAR(200) NOT NULL,
      date_of_birth DATE NOT NULL,
      phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE Departments(
      department_id INTEGER NOT NULL PRIMARY KEY,
      dep_name VARCHAR(200) NOT NULL
);

CREATE TABLE Books (
      book_id INTEGER NOT NULL PRIMARY KEY,
      FOREIGN KEY (department_id) REFERENCES Departments(department_id),
      title VARSHAR(200) NOT NULL,
      author VARCHAR(200) NOT NULL,
      volume INTEGER NOT NULL,
      publishing_year INTEGER NOT NULL,
      status VARCHAR(20) NOT NULL
);

CREATE TABLE Reservation(
      reservation_id INTEGER NOT NULL PRIMARY KEY,
      FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
      FOREIGN KEY (book_id) REFERENCES Books(book_id),
      reserv_date DATE NOT NULL,
      end_of_reservation DATE NOT NULL
);

CREATE TABLE Accounting_of_books(
      movement_id INTEGER NOT NULL PRIMARY KEY,
      FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
      FOREIGN KEY (book_id) REFERENCES Books(book_id),
      issue_date DATE NOT NULL,
      return_deadline_date DATE NOT NULL,
      return_date DATE
);

CREATE TABLE Debts(
      FOREIGN KEY (movement_id) REFERENCES Accounting_of_books(movement_id),
      FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
      status VARCHAR(20) NOT NULL
);
