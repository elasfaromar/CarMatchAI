DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
    name TEXT PRIMARY KEY,
    year REAL NOT NULL,
    hp REAL NOT NULL,
    isSUV REAL NOT NULL,
    seats REAL NOT NULL,
    gas FLOAT NOT NULL,
    length REAL NOT NULL,
    width REAL NOT NULL,
    height REAL NOT NULL,
    msrp REAL NOT NULL,
    reliability REAL NOT NULL,
    score REAL DEFAULT NULL,
    photo TEXT NOT NULL
);

INSERT INTO cars VALUES("2024 Acura MDX Type S 3.0 V6 SH-AWD",                  2024, 355, 1, 7, 13.8,  5039, 1999, 1704, 75150,    79, NULL, "photos/2024AcuraMDXTypeS.jpg");
INSERT INTO cars VALUES("2024 Tesla Model 3 Performance 79 kWh Dual Motor AWD", 2024, 460, 0, 5, 0,     4720, 1850, 1431, 54990,    74, NULL, "photos/2024TeslaModel3Performance.jpg");
INSERT INTO cars VALUES("2024 BMW X5 M Competition 4.4 V8 Mild Hybrid M xDrive M Steptronic",
                                                                                2024, 625, 1, 5, 15.3,  4948, 2015, 1762, 120400,   81, NULL, "photos/2024BMWX5M.jpg");
INSERT INTO cars VALUES("2024 Ford F-Series F-150 XIV SuperCrew Raptor R 5.2 V8 4x4",
                                                                                2024, 700, 1, 5, 22.8,  5908, 2210, 2047, 109145,   78, NULL, "photos/2024FordF150RaptorR.jpg");
INSERT INTO cars VALUES("2024 Mercedes-Benz S-class Long S 580e PHEV 9G-TRONIC",2024, 510, 0, 5, 0.6,   5289, 1954, 1503, 125000,   81, NULL, "photos/2024MercedesS580.jpg");
INSERT INTO cars VALUES("2024 Honda CR-V VI 2.0i Hybrid AWD-i e-CVT",           2024, 204, 1, 5, 5.9,   4694, 1864, 1689, 36900,    54, NULL, "photos/2024HondaCRVHybrid.jpg");
INSERT INTO cars VALUES("2024 Chevrolet Corvette Convertible (C8) Stingray 6.2 V8 DCT",
                                                                                2024, 482, 0, 2, 12.1,  4634, 1934, 1234, 67000,    88, NULL, "photos/2024ChevyCorvette.jpg");
INSERT INTO cars VALUES("2024 Toyota RAV4 V 2.5 AWD ECT-i",                     2024, 203, 1, 5, 8.7,   4595, 1854, 1702, 29000,    76, NULL, "photos/2024ToyotaRAV4.jpg");
INSERT INTO cars VALUES("2024 Porsche 911 GT3 4.0 PDK",                         2024, 510, 0, 2, 13.8,  4570, 1852, 1279, 216200,   91, NULL, "photos/2024Porsche911TurboS.jpg");
INSERT INTO cars VALUES("2024 Kia Telluride SX Prestige 3.8 V6 AWD",            2024, 291, 1, 8, 13.1,  5001, 1989, 1791, 52000,    83, NULL, "photos/2024KiaTelluride.jpg");
INSERT INTO cars VALUES("2023 Dodge Challenger III SRT Hellcat 6.2 HEMI V8",    2023, 717, 0, 5, 18.1,  5017, 1923, 1449, 67595,    85, NULL, "photos/2023DodgeChallengerHellcat.jpg");
INSERT INTO cars VALUES("2024 Subaru Outback Wilderness 2.4 H4 AWD",            2024, 260, 1, 5, 10.7,  4859, 1895, 1699, 37945,    80, NULL, "photos/2024SubaruOutback.jpg");
INSERT INTO cars VALUES("2024 Audi Q7 55 TFSI V6 Mild Hybrid quattro tiptronic",2024, 340, 1, 7, 10.1,  5072, 1970, 1690, 58900,    68, NULL, "photos/2024AudiQ7.jpg");
INSERT INTO cars VALUES("2024 Mazda CX-5 II 2.5 SKYACTIV-G Turbo AWD",          2024, 227, 1, 5, 10.7,  4575, 1844, 1684, 38000,    82, NULL, "photos/2024MazdaCX5.jpg");
INSERT INTO cars VALUES("2024 Hyundai IONIQ 6 LongRange 77.4 kWh EV AWD",       2024, 320, 0, 5, 0,     4855, 1880, 1495, 49000,    76, NULL, "photos/2024HyundaiIoniq6.jpg");
INSERT INTO cars VALUES("2024 Nissan Ariya 90 kWh EV FWD",                      2024, 242, 1, 5, 0,     4595, 1850, 1660, 45000,    74, NULL, "photos/2024NissanAriya.jpg");
INSERT INTO cars VALUES("2024 Jeep Wrangler IV Unlimited Rubicon 392 6.4 V8 4x4",
                                                                                2024, 481, 1, 5, 18,    4890, 2014, 1918, 84000,    80, NULL, "photos/2024JeepWrangler.jpg");
INSERT INTO cars VALUES("2024 Lexus RX V 500h Hybrid DIRECT4 ECT-i",            2024, 366, 1, 5, 8.7,   4890, 1920, 1710, 48000,    85, NULL, "photos/2024LexusRX350.jpg");
INSERT INTO cars VALUES("2024 Volvo XC90 II 2.0 T8 Plug-in Hybrid AWD",         2024, 455, 1, 7, 1.2,   4953, 1923, 2140, 71000,    73, NULL, "photos/2024VolvoXC90.jpg");
INSERT INTO cars VALUES("2024 Jaguar F-Pace SVR 5.0i V8 AWD",                   2024, 550, 1, 5, 12.2,  4762, 2071, 1670, 89000,    80, NULL, "photos/2024JaguarFPaceSVR.jpg");
INSERT INTO cars VALUES("2024 Land Rover Defender 110 3.0 P400 Mild Hybrid AWD",2024, 400, 1, 7, 15.9,  5100, 2008, 1967, 65000,    78, NULL, "photos/2024LandRoverDefender.jpg");
INSERT INTO cars VALUES("2024 Alfa Romeo Stelvio Quadrifoglio 2.9 V6 Bi-Turbo Q4",
                                                                                2024, 520, 1, 5, 17.5,  4701, 1955, 1689, 86000,    85, NULL, "photos/2024AlfaRomeoStelvio.jpg");
INSERT INTO cars VALUES("2024 Cadillac Escalade V 6.2 Supercharged V8 AWD",     2024, 682, 1, 7, 14.2,  6200, 2045, 1940, 150000,   83, NULL, "photos/2024CadillacEscalade.jpg");
INSERT INTO cars VALUES("2024 Lincoln Navigator Black Label 3.5 V6 AWD",        2024, 440, 1, 8, 13.8,  5334, 2032, 1981, 105000,   80, NULL, "photos/2024LincolnNavigator.jpg");
INSERT INTO cars VALUES("2024 Genesis GV80 3.5 T-GDi V6 AWD",                   2024, 380, 1, 7, 14.7,  4940, 1975, 1715, 65000,    81, NULL, "photos/2024GenesisGV80.jpg");
INSERT INTO cars VALUES("2024 Infiniti QX60 II (L51) 3.5 V6",                   2024, 295, 1, 7, 11.0,  5047, 2184, 1770, 62000,    80, NULL, "photos/2024InfinitiQX60.jpg");
INSERT INTO cars VALUES("2024 Mitsubishi Outlander IV 2.4 MIVEC PHEV 4WD",      2024, 252, 1, 7, 6.3,   4710, 1862, 1740, 45000,    82, NULL, "photos/2024MitsubishiOutlander.jpg");
INSERT INTO cars VALUES("2024 Buick Enclave Avenir 3.6 V6 AWD",                 2024, 310, 1, 7, 13.8,  5201, 2001, 2268, 57000,    83, NULL, "photos/2024BuickEnclave.jpg");
INSERT INTO cars VALUES("2024 GMC Yukon Denali 6.2 V8 AWD",                     2024, 426, 1, 7, 16.8,  5721, 2058, 1943, 80000,    78, NULL, "photos/2024GMCYukon.jpg");
INSERT INTO cars VALUES("2024 Chrysler Pacifica Hybrid 3.6 V6 FWD",             2024, 264, 1, 7, 2.9,   5189, 2022, 1777, 52000,    71, NULL, "photos/2024ChryslerPacifica.jpg");
INSERT INTO cars VALUES("2024 Volkswagen Atlas Cross Sport 3.6 V6 AWD",         2024, 269, 1, 5, 12.4,  4968, 1990, 1729, 50000,    73, NULL, "photos/2024VWAtlasCrossSport.jpg");
INSERT INTO cars VALUES("2024 Mini Countryman JCW 2.0 I4 AWD",                  2024, 300, 1, 5, 7.8,   4447, 1843, 1645, 45000,    82, NULL, "photos/2024MiniCountryman.jpg");
INSERT INTO cars VALUES("2024 Fiat 500X Sport 1.3 I4 AWD",                      2024, 177, 1, 5, 9.8,   4248, 1796, 1617, 32000,    50, NULL, "photos/2024Fiat500X.jpg");
INSERT INTO cars VALUES("2024 Maserati Levante Trofeo 3.8 V8 AWD",              2024, 590, 1, 5, 13.5,  5020, 1981, 1698, 155000,   80, NULL, "photos/2024MaseratiLevante.jpg");
INSERT INTO cars VALUES("2024 Aston Martin DBX707 4.0 V8 AWD",                  2024, 707, 1, 5, 22,    5039, 1998, 1680, 235000,   90, NULL, "photos/2024AstonMartinDBX707.jpg");
INSERT INTO cars VALUES("2024 Bentley Bentayga Speed 6.0 W12 AWD",              2024, 635, 1, 5, 19.7,  5144, 1998, 1742, 250000,   92, NULL, "photos/2024BentleyBentayga.jpg");
INSERT INTO cars VALUES("2024 Rolls-Royce Cullinan 6.75 V12 AWD",               2024, 571, 1, 5, 21.9,  5341, 2000, 1835, 350000,   95, NULL, "photos/2024RollsRoyceCullinan.jpg");
