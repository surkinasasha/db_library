/*Триггер для автоматического добавления задолженности при просрочке возврата книги*/

CREATE TRIGGER add_debt AFTER UPDATE ON Accounting_of_books FOR EACH ROW 
BEGIN 
  DECLARE total_rows INT; 
  SELECT COUNT(*) INTO total_rows FROM Debts;
  IF NEW.return_date > NEW.return_deadline_date THEN 
    INSERT INTO Debts (debt_id, movement_id, reader_id, debt_status) VALUES (total_rows + 1, NEW.movement_id, NEW.reader_id, 'Открыт'); 
  END IF; 
END;

/*Триггер для изменения статуса книги при ее бронировании*/

CREATE TRIGGER update_book_status AFTER INSERT ON Reservation FOR EACH ROW 
UPDATE Books 
  SET book_status = 'недоступна' 
    WHERE book_id = NEW.book_id;

/*Триггер для изменения статуса книги при ее выдаче/возврате*/
CREATE TRIGGER update_book_status AFTER INSERT ON Accounting_of_books FOR EACH ROW 
BEGIN 
  UPDATE Books 
    SET book_status = CASE WHEN NEW.return_date IS NULL 
        THEN 'issued' 
    ELSE 'available' 
END 
WHERE Books.book_id = NEW.book_id; 
END;
