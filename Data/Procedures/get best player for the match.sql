CREATE DEFINER=`root`@`localhost` PROCEDURE `get_best_player_for_match`(in idUtakmice int, out pIme varchar(50), out pPrezime varchar(40))
BEGIN
		declare idNajboljegIgraca int;
		select idOsoba into idNajboljegIgraca from kosarkas_registrovan_za_utakmicu 
		where idUtakmica=22
		order by brojPoena desc limit 1;
        
        select ime into pIme
		from osoba o where o.idOsoba=idNajboljegIgraca;
      
		select Prezime into pPrezime
		from osoba o where o.idOsoba=idNajboljegIgraca;
        
END