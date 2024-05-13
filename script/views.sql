/* Представление читателей и их бронирований*/
CREATE VIEW Readers_reservations_info AS
SELECT r.reader_id AS "Идентификатор читателя"
       r.surname AS "Фамилия"
       r.name AS "Имя"
       r.middle_name AS "Отчество"
       r.date_of_birth AS "Дата рождения"
       r.phone_number AS "Номер телефона"
       b.book_name AS "Название книги"
       b.book_id AS "Идентификатор книги"
       b.author AS "Автор книги"
       r.reserv_date AS "Начало бронирования"
       r.end_of_reservation AS "Конец бронирования"
FROM Reader r
INNER JOIN Reservation r
      ON r.reader_id = r.reader_id
INNER JOIN Books b
      ON r.book_id = b.book_id;

/* Представление отделов и книг, которые к ним относятся */
  
CREATE VIEW Departments_books_info
SELECT d.department_id AS "Идентификатор отдела"
       d.dep_name AS "Название отдела"
       b.book_id AS "Идентификатор книги"
       b.book_name AS "Название книги"
       b.author AS "Автор книги"
INNER JOIN Books b 
       ON d.department_id = b.department_id;


       

      
