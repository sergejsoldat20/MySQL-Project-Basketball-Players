CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `get_matches` AS
    SELECT 
        `utakmica`.`idUtakmica` AS `idUtakmica`,
        `liga`.`idLiga` AS `idLiga`,
        `klubd`.`idKlub` AS `idDomaci`,
        `klubg`.`idKlub` AS `idGosti`,
        `utakmica`.`datumVrijeme` AS `datumVrijeme`,
        `klubd`.`naziv` AS `domaci`,
        `klubg`.`naziv` AS `gosti`
    FROM
        (((`utakmica`
        JOIN `klub` `klubd` ON ((`klubd`.`idKlub` = `utakmica`.`idDomaci`)))
        JOIN `klub` `klubg` ON ((`klubg`.`idKlub` = `utakmica`.`idGosti`)))
        JOIN `liga` ON ((`liga`.`idLiga` = `utakmica`.`idLiga`)))