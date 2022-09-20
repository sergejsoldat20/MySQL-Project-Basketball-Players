CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `get_clubs` AS
    SELECT 
        `klub`.`idKlub` AS `id`,
        `klub`.`naziv` AS `naziv`,
        `dvorana`.`naziv` AS `nazivDvorane`,
        `dvorana`.`kapacitet` AS `kapacitetDvorane`,
        `grad`.`naziv` AS `grad`,
        `drzava`.`naziv` AS `drzava`,
        `grad`.`idGrad` AS `idGrad`
    FROM
        (((`klub`
        JOIN `dvorana` ON ((`dvorana`.`idDvorana` = `klub`.`idDvorana`)))
        JOIN `grad` ON ((`grad`.`idGrad` = `klub`.`idGrad`)))
        JOIN `drzava` ON ((`grad`.`idDrzava` = `drzava`.`idDrzava`)))