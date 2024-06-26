CREATE TABLE Readers (
      reader_id INTEGER NOT NULL PRIMARY KEY,
      surname VARCHAR(200) NOT NULL,
      name VARCHAR(200) NOT NULL,
      middle_name VARCHAR(200),
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
      title VARCHAR(200) NOT NULL,
      author VARCHAR(200) NOT NULL,
      volume INTEGER NOT NULL,
      publishing_year INTEGER NOT NULL,
      book_status VARCHAR(20) NOT NULL
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
      debt_id INTEGER NOT NULL PRIMARY KEY,
      FOREIGN KEY (movement_id) REFERENCES Accounting_of_books(movement_id),
      FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
      debt_status VARCHAR(20) NOT NULL
);
