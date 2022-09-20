CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `get_players` AS
    SELECT 
        `osoba`.`idOsoba` AS `idOsoba`,
        `osoba`.`ime` AS `ime`,
        `osoba`.`prezime` AS `prezime`,
        `klub`.`idKlub` AS `idKlub`,
        `klub`.`naziv` AS `imeKluba`,
        `kosarkas`.`brojDresa` AS `brojDresa`,
        `kosarkas`.`prosjekPoena` AS `prosjekPoena`,
        `kosarkas`.`prosjekAsistencija` AS `prosjekAsistencija`,
        `kosarkas`.`prosjekSkokova` AS `prosjekSkokova`,
        `kosarkas`.`visina` AS `visina`,
        `kosarkas`.`tezina` AS `tezina`
    FROM
        (((`osoba`
        JOIN `kosarkas` ON ((`osoba`.`idOsoba` = `kosarkas`.`idOsoba`)))
        JOIN `kosarkas_igra_za_klub` ON ((`osoba`.`idOsoba` = `kosarkas_igra_za_klub`.`idOsoba`)))
        JOIN `klub` ON ((`klub`.`idKlub` = `kosarkas_igra_za_klub`.`idKlub`)))