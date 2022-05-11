DELIMITER $$
  CREATE TRIGGER dose_counter
  BEFORE INSERT ON book_slot
  FOR EACH ROW
    BEGIN
      DECLARE count_dose integer DEFAULT 0;
      SELECT COUNT(*) INTO count_dose
      FROM book_slot
      WHERE pid=new.pid;
      IF count_dose=0 THEN
        SET new.dose=1;
      ELSEIF count_dose=1 THEN
        SET new.dose=2;
      ELSE
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The person has already been vaccinated twice';
      END IF;
    END $$
DELIMITER ;
