CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `get_table` AS
    SELECT 
        `drzava`.`naziv` AS `nazivDrzave`,
        `klub`.`idKlub` AS `idKlub`,
        `klub`.`naziv` AS `imeKluba`,
        `pozicija_na_tabeli`.`pozicija` AS `pozicija`
    FROM
        (((`klub`
        JOIN `pozicija_na_tabeli` ON ((`klub`.`idKlub` = `pozicija_na_tabeli`.`idKlub`)))
        JOIN `liga` ON ((`liga`.`idLiga` = `pozicija_na_tabeli`.`idLiga`)))
        JOIN `drzava` ON ((`drzava`.`idDrzava` = `liga`.`idDrzava`)))