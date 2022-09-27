CREATE DEFINER=`root`@`localhost` PROCEDURE `get_matches_in_league_for_season`(in idLiga int, in idSezona int)
select * from get_matches
	where get_matches.idLiga = idLiga
    order by datumVrijeme