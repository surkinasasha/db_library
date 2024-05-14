/*Процедура добавления нового читателя*/

CREATE PROCEDURE AddReader
(
    @surname VARCHAR(200),
    @name VARCHAR(200),
    @middle_name VARCHAR(200),
    @date_of_birth DATE,
    @phone_number VARCHAR(20)
)
AS
BEGIN
    INSERT INTO Readers (surname, name, middle_name, date_of_birth, phone_number)
    VALUES (@surname, @name, @middle_name, @date_of_birth, @phone_number);
END;


/*Процедура добавления новой книги*/
CREATE PROCEDURE AddBook
(
    @department_id INTEGER,
    @title VARCHAR(200),
    @author VARCHAR(200),
    @volume INTEGER,
    @publishing_year INTEGER,
    @book_status VARCHAR(20)
)
AS
BEGIN
    INSERT INTO Books (department_id, title, author, volume, publishing_year, book_status)
    VALUES (@department_id, @title, @author, @volume, @publishing_year, @book_status);
END;

/*Функция проверки читателя на открытые задолженности*/
CREATE FUNCTION CheckReaderDebts(reader_id INTEGER) 
RETURNS VARCHAR(20) 
AS 
$$ 
DECLARE total_debts INTEGER;
BEGIN SELECT COUNT(*) INTO total_debts FROM Debts WHERE reader_id = $1 AND debt_status = 'Открыт';
IF total_debts > 0 THEN
    RETURN 'Есть задолженности';
ELSE
    RETURN 'Нет задолженностей';
END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'Нет задолженностей';
END;
$$ 
LANGUAGE plpgsql;

/*Процедура, которая удаляет бронирования с истекшим временем бронирования*/
CREATE PROCEDURE DeleteExpiredReservations() 
  BEGIN 
  DELETE FROM Reservations 
  WHERE end_of_reservation < CURDATE(); 
END
