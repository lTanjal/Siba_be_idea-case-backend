USE casedb;

/* INSERTS */
/* --- Insert: GlobalSettings --- */
INSERT INTO GlobalSetting(name, description, numberValue, textValue) VALUES
    ('X', 'Korkea prioriteettiarvo', 800, NULL);

/* --- Insert: Department --- */
INSERT INTO Department(name, description) VALUES
	('Jazz', 'Aineryhmän kuvaus'),
    ('Laulumusiikki', 'Aineryhmän kuvaus'),
    ('Piano, harmonikka, kitara ja kantele', 'Aineryhmän kuvaus'),
    ('Musiikkikasvatus', 'Aineryhmän kuvaus'),
    ('MuTri', "Aineryhmän kuvaus"),
    ('Vanha musiikki', "Aineryhmän kuvaus"),
    ('Musiikkiteknologia', 'Aineryhmän kuvaus'),
    ('Musiikinjohtaminen sekä orkesteri- ja kuorotoiminta', 'Aineryhmän kuvaus'),
    ('Taidejohtaminen ja yrittäjyys', 'Aineryhmän kuvaus'),
    ('DocMus', 'Tohtoritason koulutusohjelma'),
    ('Kansanmusiikki ja Global music & GLOMAS', 'Aineryhmän kuvaus'),
    ('Kirkkomusiikki ja urut', 'Aineryhmän kuvaus'),
    ('Jouset ja kamarimusiikki', 'Aineryhmän kuvaus'),
    ('Puhaltimet, lyömäsoittimet ja harppu', 'Aineryhmän kuvaus'),
    ('Sävellys ja musiikinteoria', 'Aineryhmän kuvaus'),
    ('Avoin Kampus', 'Aineryhmän kuvaus');

/* --- Insert: `User` --- */
INSERT INTO `User`(email, isAdmin) VALUES
    ('fake_admin@test.co', 1),
    ('fake_planner@test.co', 0),
    ('fake_planner2@test.co', 0);

/* --- Insert: DepartmentPlanner * --- */
INSERT INTO DepartmentPlanner(userId, departmentId) VALUES
    (202, 101),
    (202, 105),
    (203, 103),
    (203, 104),
    (202, 102);

    
/* --- Insert: Building * --- */
INSERT INTO `Building` (`name`, `description`) VALUES
	('Musiikkitalo', 'Sibeliusakatemian päärakennus'),
	('N-talo', 'Sibeliusakatemian opetus ja harjoittelu talo '),
	('R-talo', 'Sibeliusakatemian konserttitalo');

/* --- Insert: SpaceType --- */
INSERT INTO SpaceType (name) VALUES
    ("Studio"),
    ("Luentoluokka"),
    ("Esitystila"),
    ("Musiikkiluokka");

/* --- Insert: `Space` * --- */
INSERT INTO `Space` (`name`, `area`, `personLimit`, `buildingId`, `availableFrom`, `availableTo`, `classesFrom`, `classesTo`, `info`, `spaceTypeId`) VALUES
	('S6117 Jouset/Kontrabasso', 31.9, 7, 401, '08:00:00', '21:00:00', '09:00:00', '16:00:00', 'ONLY FOR BASSISTS', 5004),
	('S6104 Didaktiikkaluokka Inkeri', 62.5, 30, 401, '08:00:00', '21:00:00', '10:00:00', '17:00:00', 'Musiikkikasvatus', 5004),
	('S7106 Kansanmusiikki/AOV', 63.7, 22, 401, '08:00:00', '21:00:00', '08:00:00', '18:00:00', 'Yhtyeluokka', 5004), 
    ('S6114 Perkussioluokka/Marimbaluokka', 33.3, 4, 401, '08:00:00', '22:00:00', '09:00:00', '15:00:00', 'Vain lyömäsoittajat', 5004),
    ('S1111 Studio Erkki', 36.0, 15, 401, '08:00:00', '22:00:00', '11:00:00', '15:00:00', 'Tilatyyppi: Studio', 5001),
    ('S5109 Jazz/Bändiluokka', 17.5, 2, 401, '08:00:00', '20:00:00', '08:00:00', '16:00:00', 'ONLY FOR JAZZ DEPARTMENT', 5004),
    ('S6112 Harppuluokka', 28.8, 4, 401, '08:00:00', '17:00:00', '11:00:00', '16:00:00', 'Vain harpistit', 5004),
    ('S6113 Puhaltimet/Klarinetti/Harppu', 18.1, 4, 401, '08:00:00', '19:00:00', '08:00:00', '19:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    
    ('R312 Opetusluokka', 16.6, 6, 403, '08:00:00', '21:00:00', '08:00:00', '18:00:00', 'Tilatyyppi: Musiikkiluokka', 5004), 
    ('R530 Opetusluokka', 50.0, 18, 403, '08:00:00', '21:00:00', '08:00:00', '19:00:00', 'Luentoluokka', 5002),
    ('R213 Harjoitushuone', 20.0, 4, 403, '08:00:00', '21:00:00', '10:00:00', '16:00:00', 'Ensisijainen varausoikeus vanhan musiikin aineryhmällä', 5004),
    ('R510 Opetusluokka', 81.0, 30, 403, '08:00:00', '21:00:00', '09:00:00', '15:00:00', 'Luentoluokka', 5002),
    ('R416 Opetusluokka', 23.0, 9, 403, '08:00:00', '21:00:00', '10:00:00', '17:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('R422 Opetusluokka', 23.0, 11, 403, '08:00:00', '19:00:00', '08:00:00', '22:00:00', 'Kitara', 5004),
    ('R410 Opetusluokka', 42.4, 20, 403, '08:00:00', '19:00:00', '08:00:00', '20:00:00', 'Pianopedagogiikka', 5004),
    ('R531 Opetusluokka', 53.0, 17, 403, '09:00:00', '20:00:00', '10:00:00', '14:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),

    ('N522 Säestysluokka', 33.0, 8, 402, '08:00:00', '21:00:00', '08:00:00', '19:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N319 Jazz/Lyomäsoittimet, piano ja yhtyeet', 34.0, 5, 402, '08:00:00', '19:00:00', '08:00:00', '17:00:00', 'Varaukset Jukkis Uotilan kautta', 5004),
    ('N315 Jouset', 15.5, 4, 402, '08:00:00', '21:00:00', '08:00:00', '14:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N419 Kirkkomusiikki/Urkuluokka', 34.0, 5, 402, '09:00:00', '20:00:00', '08:00:00', '18:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N517 Opetusluokka', 15.5, 3, 402, '08:00:00', '21:00:00', '08:00:00', '15:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N425 Jouset/Sello', 33.0, 8, 402, '08:00:00', '22:00:00', '09:00:00', '15:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N312 Musiikkikasvatus/Vapaasäestys', 34.0, 8, 402, '08:00:00', '22:00:00', '08:00:00', '15:00:00', 'Tilatyyppi: Musiikkiluokka', 5004),
    ('N220 Tohtorikoulut', 49.5, 20, 402, '08:00:00', '19:00:00', '08:00:00', '17:00:00', 'Tilatyyppi: Luentoluokka', 5002);


/* --- Insert: Equipment --- */
INSERT INTO `Equipment` (`name`, `isMovable`, `priority`, `description`) VALUES
	('Urut', 0, 600, 'Valtavan kokoinen soitin'),
	('Kantele', 1, 50, 'Väinämöisen soitin'),
    ('Nokkahuilu', 1, 50, 'Kaikki rakastaa'),
    ('Rumpusetti', 1, 250, 'Ääntä riittää'),
    ('Äänityslaitteisto Xyz', 0, 900, '8 kanavaa'),
    ('Viulu', 1, 50, 'Jousisoitin, 4-kieltä'),
    ('Alttoviulu', 1, 50, 'Jousisoitin, suurempi kuin viulu'),
    ('Sello', 1, 100, 'Suuri, 4-kielinen jousisoitin'),
    ('Kontrabasso', 1, 100, 'Suurin jousisoitin'),
    ('Piano', 0, 900, 'Piano-opetus vaatii kaksi flyygeliä'),
    ('Kitara', 1, 100, '6-kielinen soitin'),
    ('Harmonikka', 1, 200, 'Hanuri'),
    ('Fortepiano', 0, 500, 'Pianon varhaismuoto'),
    ('Huilu', 1, 50, 'puhallinsoitin'),
    ('Oboe', 1, 100, 'puupuhallinsoitin'),
    ('Tuuba', 1, 100, 'Suurehko puhallinsoitin'),
    ('Trumpetti', 1, 50, 'Puhallinsoitin'),
    ('Clavinova', 1, 100, 'Sähköpiano'),
    ('Bassovahvistin', 1, 50, 'Boom boom'),
    ('Kitaravahvistin', 1, 50, 'Äänekäs laatikko'),
    ('Flyygeli', 1, 200, ''),
    ('DVD-soitin', 1, 50, ''),
    ('Äänentoisto (ei PA-laitteet)', 0, 100, ''),
    ('Näyttölaite (videoprojektori)', 0, 200, ''),
    ('Yhtyeluokan äänentoisto', 0, 300, 'PA-laitteet'),
    ('Dokumenttikamera', 0, 250, '');
    
/* --- Insert: SpaceEquipment * --- */
INSERT INTO `SpaceEquipment` (`spaceId`, `equipmentId`) VALUES
	(1001, 2021),
    (1001, 2022),
    (1001, 2023),
    (1001, 2024),
	(1002, 2021),
    (1002, 2004),
    (1002, 2019),
    (1002, 2020),
    (1002, 2022),
    (1002, 2023),
    (1002, 2025),
    (1002, 2024),
    (1002, 2026),
	(1009, 2010),
    (1009, 2021),
    (1009, 2023),
    (1013, 2021),
    (1013, 2023),
    (1020, 2001),
    (1020, 2022),
    (1020, 2023),
    (1020, 2024),
    (1019, 2021),
    (1019, 2022),
    (1019, 2023),
    (1019, 2024);
    
/* --- Insert: Program * --- */
INSERT INTO Program (name , departmentId) VALUES
    ('Piano', 103), -- id 3001
    ('Laulutaide pääaineena', 102),
    ('Kitara', 103),
    ('Kantele', 103),
    ('Jazzsävellys', 101),
    ('Laulutaide', 102),
    ('Musiikinteoria pääaineena', 104),
    ('Jazzmusiikin instrumentti- tai lauluopinnot pääaineena', 102),
    ('Fortepiano', 103),
    ('Global Music', 112),
    ('Harmonikka', 103),
    ('Harppu', 114),
    ('Jousisoitin', 113),
    ('Kansanmusiikki', 111),
    ('Kirkkomusiikki', 112),
    ('Korrepetitio', 102),
    ('Lyömäsoitin', 114),
    ('Musiikin johtaminen', 108),
    ('Musiikin tohtorikoulutus', 110),
    ('Musiikkikasvatus', 104),
    ('Musiikkiteknologia', 107),
    ('Nordic Master in Folk Music', 111),
    ('Nordic Master in Jazz', 101),
    ('Oopperalaulu', 102),
    ('Pianokamarimusiikki ja lied', 103),
    ('Puhallinsoitin', 114),
    ('Sävellys', 115),
    ('Taidejohtaminen ja yrittäjyys', 109),
    ('Urut', 112),
    ('Vanha musiikki', 106),
    ('Avoin Kampus', 110); 

/* --- Insert: Subject * --- */
INSERT INTO Subject(name, groupSize, groupCount, sessionLength, sessionCount, area, programId, spaceTypeId) VALUES
    ('Saksan kielen perusteet', 20, 2, '01:30:00', 2, 35, 3002, 5002), 
    ('Jazzimprovisoinnin ja -teorian perusteet', 17, 1, '02:30:00', 2, 35, 3005, 5004),
    ('Piano yksilöopetus', 1, 1, '02:30:00', 2, 10, 3001, 5004),
    ('Trumpetin ryhmäsoitto', 10, 1,'01:30:00', 3, 40, 3002, 5004),
    ('Kirkkomusiikin ryhmäsoittoa', 5, 2, '02:30:00', 2, 30, 3015, 5004),
    ('Ruotsin kielen oppitunti', 40, 2, '01:45:00', 1, 40, 3031, 5002),
    ('Kitaran soiton perusteet', 11, 1, '01:30:00', 2, 60, 3003, 5004),
    ('Kontrabassonsoitto, taso A', 1, 3, '01:00:00', 2, 10, 3013, 5004),
    ('Kanteleensoitto (musiikin kandidaatti)', 1, 4, '01:00:00', 1, 10, 3004, 5004),
    ('Yhteissoitto / kantele', 16, 1, '01:30:00', 1, 20, 3004, 5004),
    ('Urkujensoitto (musiikin kandidaatti)', 1, 3, '01:30:00', 1, 20, 3029, 5004),
    ('Yhteissoitto / kitara', 34, 1, '01:30:00', 1, 35, 3003, 5004),
    ('Huilunsoitto, taso A', 1, 5, '01:00:00', 1, 10, 3026, 5004),
    ('Fortepianonsoitto 1', 1, 7, '01:10:00', 2, 30, 3001, 5004),
    ('Nokkahuilunsoitto, taso B', 1, 3, '01:00:00', 1, 10, 3026, 5004),
    ('Viulunsoitto, taso D', 1, 12, '01:00:00', 1, 10, 3013, 5004),
    ('Tuubansoitto, taso C', 1, 5, '01:00:00', 1, 15, 3026, 5004),
    ('Harmonikansoitto (musiikin kandidaatti)', 1, 2, '01:00:00', 1, 15, 3011, 5004),
    ('Jazz, rumpujensoitto, taso B', 1, 4, '01:00:00', 1, 15, 3017, 5004),
    ('Kansanmusiikkiteoria 1', 20, 1, '01:00:00', 2, 30, 3014, 5002),
    ("Kirkkomusiikin käytännöt 1", 20, 1, '03:00:00', 1, 30, 3015, 5002),
    ("Nuottikirjoitus", 15, 1, "02:00:00", 1, 25, 3031, 5002),
    ("Harpun orkesterikirjallisuus", 15, 1, "03:00:00", 1, 25, 3012, 5002),
    ("Global Orchestra", 12, 2, "02:30:00", 2, 35, 3010, 5004),
    ("Populaarimusiikin historia", 20, 1, "03:00:00", 1, 30, 3020, 5002),
    ("Oppimaan oppiminen", 15, 2, "02:30:00", 1, 25, 3031, 5002),
    ("Body Mapping", 25, 2, "02:30:00", 2, 35, 3031, 5002),
    ("Muusikon Terveys", 20, 1, "02:30:00", 1, 30, 3031, 5002);


/* --- Insert: SubjectEquipment * --- */
INSERT INTO SubjectEquipment(subjectId, equipmentId, priority) VALUES
    (4003, 2021, 900),
    (4004, 2017, 50),
    (4005, 2001, 900),
    (4007, 2011, 100),
    (4008, 2009, 90),
    (4009, 2002, 50),
    (4010, 2002, 90),
    (4011, 2001, 900),
    (4012, 2011, 90),
    (4013, 2012, 50),
    (4014, 2013, 900),
    (4015, 2003, 50),
    (4016, 2006, 90),
    (4017, 2016, 90),
    (4018, 2012, 90),
    (4019, 2014, 800),
    (4020, 2010, 400);

/* --- Insert: AllocRound * --- */
INSERT INTO AllocRound(name, isSeasonAlloc, userId, description) VALUES
    ("Testipriorisointi", 0, 201, "Testidata lisätään AllocSubject tauluun, mutta laskentaa ei vielä suoritettu eli opetuksille ei ole vielä merkitty tiloja"),
    ("Testilaskenta", 1, 201, "Testidata lisätty ja huoneet merkitty"),
    ("Kevät 2023", 0, 201, "");

/* --- Insert: AllocSubject * --- */
INSERT INTO AllocSubject(subjectId, allocRound, isAllocated, allocatedDate, priority) VALUES
    (4011, 10001, 0, '2022-10-28', 1),
    (4014, 10001, 0, '2022-10-28', 2),
    (4019, 10001, 0, '2022-10-28', 3),
    (4013, 10001, 0, '2022-10-28', 4),
    (4001, 10001, 0, '2022-10-28', 5),

    (4011, 10002, 1, '2022-10-28', 1), -- Urkujensoitto, 1ppl, 1:30/4:30, 20m2, musiikkiluokka
    (4003, 10002, 1, '2022-10-28', 2), -- Piano yksilöopetus, 1ppl, 2:30/05:00, 10m2, musiikkiluokka
    (4005, 10002, 1, '2022-10-28', 3), -- Kirkkomusiikin ryhmäsoitto, 5ppl, 2:30/10:00, musiikkiluokka
    (4024, 10002, 1, '2022-10-28', 4), -- Global Orchestra, 12ppl, 2:30/10:00, 35m2, musiikkiluokka
    (4004, 10002, 1, '2022-10-28', 5), -- Trumpetin ryhmäsoitto, 10ppl, 1:30/4:30, 40m2 
    (4014, 10002, 1, '2022-10-28', 6), -- fortepianosoitto, 1ppl, 16:20, 30m2, musiikkiluokka, 
    (4019, 10002, 1, '2022-10-28', 7), -- jazz rummut, 1ppl, 4:00, 15m2, musiikkiluokka
    (4013, 10002, 1, '2022-10-28', 8), -- huilujensoitto taso a, 1ppl, 05:00, 10m2, musiikkiluokka
    (4002, 10002, 1, '2022-10-28', 9), -- jazz improvisoinnin perusteet, 17ppl, 2:30/5:00, 35m2, musiikkiluokka
    (4016, 10002, 1, '2022-10-28', 10), -- Viulunsoitto taso D, 1ppl, 01:00/12:00, 10m2, musiikkiluokka
    (4017, 10002, 1, '2022-10-28', 11), -- Tuubansoitto Taso C, 1ppl, 01:00/05:00, 15m2, musiikkiluokka
    (4008, 10002, 1, '2022-10-28', 12), -- Kontrabassonsoitto Taso A, 1ppl, 01:00/06:00, 10m2, musiikkiluokka
    (4007, 10002, 1, '2022-10-28', 13), -- Kitaran soiton perusteet, 11ppl, 1:30/03:00, 60m2, musiikkiluokka
    (4023, 10002, 1, '2022-10-28', 14), -- Harpun orkesterikirjallisuus, 15ppl, 3:00, 25m2, teorialuokka
    (4020, 10002, 1, '2022-10-28', 15), -- Kansanmusiikkiteoria 1, 20ppl, 1:00/2:00, 30m2, teorialuokka
    (4027, 10002, 1, '2022-10-28', 16), -- Body mapping, 20, 2:30, 30m2, teorialuokka
    (4028, 10002, 1, '2022-10-28', 17), -- Muusikon terveys, 20ppl, 2:30, 30m2, teorialuokka
    (4021, 10002, 1, '2022-10-28', 18), -- Kirkkomusiikin käytännöt, 20ppl, 03:00, 30m2, teorialuokka
    (4022, 10002, 1, '2022-10-28', 19), -- Nuottikirjoitus, 15ppl, 2:00, 25m2, teorialuokka
    (4001, 10002, 1, '2022-10-28', 20), -- saksan kielen perusteet, 10ppl, 06:00, 35m2, teorialuokka
    (4006, 10002, 1, '2022-10-28', 21), -- Ruotsin kielen oppintunti, 40ppl, 1:45/3:30, 40m2, teorialuokka


    (4001, 10003, 0, '2022-09-21', 1),  
    (4002, 10003, 0, '2022-09-21', 2),
    (4003, 10003, 0, '2022-09-21', 3),
    (4004, 10003, 0, '2022-09-21', 4),
    (4005, 10003, 0, '2022-09-21', 5),
    (4006, 10003, 0, '2022-09-21', 6),
    (4007, 10003, 0, '2022-09-21', 7);

INSERT INTO AllocSpace(allocSubjectId, allocRound, spaceId, totalTime) VALUES

    (4011, 10002, 1020, '04:30:00'),
    (4003, 10002, 1009, '05:00:00'),
    (4005, 10002, 1020, '10:00:00'),
    (4024, 10002, 1016, '10:00:00'),
    (4004, 10002, 1016, '04:30:00'),
    (4014, 10002, 1009, '16:20:00'),
    (4019, 10002, 1004, '04:00:00'),
    (4013, 10002, 1009, '05:00:00'),
    (4002, 10002, 1016, '05:00:00'),
    (4016, 10002, 1009, '12:00:00'),
    (4017, 10002, 1009, '05:00:00'),
    (4008, 10002, 1009, '06:00:00'),
    (4007, 10002, 1014, '03:00:00'),
    (4023, 10002, 1010, '03:00:00'),
    (4020, 10002, 1010, '02:00:00'),
    (4027, 10002, 1010, '02:30:00'),
    (4028, 10002, 1010, '02:30:00'),
    (4021, 10002, 1010, '03:00:00'),
    (4022, 10002, 1010, '02:00:00'),
    (4001, 10002, 1010, '06:00:00'),
    (4006, 10002, 1010, '03:30:00');


/* --- Insert: AllocCurrentRoundUser * --- */
INSERT INTO AllocCurrentRoundUser(allocId, userId) VALUES
    (10001, 201),
    (10001, 202),
    (10002, 201);

