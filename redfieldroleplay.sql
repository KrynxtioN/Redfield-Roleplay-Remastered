-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2026 at 06:56 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redfieldroleplay`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Passwort` text NOT NULL,
  `Serial` varchar(50) NOT NULL,
  `TaucherPoints` int NOT NULL DEFAULT '0',
  `TaucherLevel` int NOT NULL DEFAULT '0',
  `OxygenFlasche` int NOT NULL DEFAULT '0',
  `Taucheranzug` int NOT NULL DEFAULT '0',
  `Hanfsamen` int NOT NULL DEFAULT '0',
  `Gras` int NOT NULL DEFAULT '0',
  `Angelhaken` int NOT NULL DEFAULT '0',
  `Pokale` int NOT NULL DEFAULT '0',
  `Level` int NOT NULL DEFAULT '0',
  `Erfahrungspunkte` int NOT NULL DEFAULT '0',
  `Angel` int NOT NULL DEFAULT '0',
  `OnlineTime` int NOT NULL DEFAULT '0',
  `OnlineTimeAFK` int NOT NULL DEFAULT '0',
  `Graffitis` int NOT NULL DEFAULT '0',
  `Aussichtspunkte` int NOT NULL DEFAULT '0',
  `Adminlevel` int NOT NULL DEFAULT '0',
  `WaffenscheinTheorie` int NOT NULL DEFAULT '0',
  `WaffenscheinPraxis` int NOT NULL DEFAULT '0',
  `Kreditkarte` int NOT NULL DEFAULT '0',
  `Wanteds` int NOT NULL DEFAULT '0',
  `Jailtime` int NOT NULL DEFAULT '0',
  `Fraktion` int NOT NULL DEFAULT '0',
  `Fraktionrang` int NOT NULL DEFAULT '0',
  `Unternehmen` int NOT NULL DEFAULT '0',
  `Unternehmenrang` int NOT NULL DEFAULT '0',
  `Firma` int NOT NULL DEFAULT '0',
  `Firmarang` int NOT NULL DEFAULT '0',
  `Jobgehaltsbonus` int NOT NULL DEFAULT '0',
  `Geld` int NOT NULL DEFAULT '0',
  `Bankgeld` int NOT NULL DEFAULT '0',
  `Pfandflaschen` int NOT NULL DEFAULT '0',
  `Kills` int NOT NULL DEFAULT '0',
  `Tode` int NOT NULL DEFAULT '0',
  `Spielstunden` int NOT NULL DEFAULT '0',
  `Apfelsamen` int NOT NULL DEFAULT '0',
  `Orangensamen` int NOT NULL DEFAULT '0',
  `Aepfel` int NOT NULL DEFAULT '0',
  `Orangen` int NOT NULL DEFAULT '0',
  `Hunger` int NOT NULL DEFAULT '100',
  `Harndrang` int NOT NULL DEFAULT '0',
  `Energie` int NOT NULL DEFAULT '100',
  `Aids` int NOT NULL DEFAULT '0',
  `Spawnx` varchar(50) NOT NULL DEFAULT '-1605.4000244141',
  `Spawny` varchar(50) NOT NULL DEFAULT '774',
  `Spawnz` varchar(50) NOT NULL DEFAULT '7.1999998092651',
  `Spawnrotz` int NOT NULL DEFAULT '308',
  `SpawnDimension` int NOT NULL DEFAULT '0',
  `SpawnInterior` int NOT NULL DEFAULT '0',
  `Skin` int NOT NULL DEFAULT '0',
  `Ostereier` int NOT NULL DEFAULT '0',
  `Kuerbisse` int NOT NULL DEFAULT '0',
  `Geschenke` int NOT NULL DEFAULT '0',
  `Raketen` int NOT NULL DEFAULT '0',
  `FraktionWarns` int NOT NULL DEFAULT '0',
  `UnternehmenWarns` int NOT NULL DEFAULT '0',
  `Repairkits` int NOT NULL DEFAULT '0',
  `Werber` text,
  `BewertungPositiv` int NOT NULL DEFAULT '0',
  `BewertungMittel` int NOT NULL DEFAULT '0',
  `BewertungSchlecht` int NOT NULL DEFAULT '0',
  `Job` varchar(50) DEFAULT 'Arbeitslos',
  `Jobmoney` int NOT NULL DEFAULT '0',
  `FuehrerscheinPraxis` int NOT NULL DEFAULT '0',
  `LKWScheinPraxis` int NOT NULL DEFAULT '0',
  `Limonade` int NOT NULL DEFAULT '0',
  `Koeder` int NOT NULL DEFAULT '0',
  `Defusekits` int NOT NULL DEFAULT '0',
  `Bomben` int NOT NULL DEFAULT '0',
  `FirmaWarns` int NOT NULL DEFAULT '0',
  `StVo` int NOT NULL DEFAULT '0',
  `Autologin` int NOT NULL DEFAULT '0',
  `ZugfuehrerPunkte` int NOT NULL DEFAULT '0',
  `SozialerStatus` varchar(50) NOT NULL DEFAULT 'Neuling',
  `Gemuted` int NOT NULL DEFAULT '0',
  `Schwarzpulver` int NOT NULL DEFAULT '0',
  `Fisch` int NOT NULL DEFAULT '0',
  `Wuerfel` int NOT NULL DEFAULT '0',
  `Materialien` int NOT NULL DEFAULT '0',
  `Kondome` int NOT NULL DEFAULT '0',
  `Benzinkanister` int NOT NULL DEFAULT '0',
  `Medikits` int NOT NULL DEFAULT '0',
  `Handy` int NOT NULL DEFAULT '0',
  `Casinochips` int NOT NULL DEFAULT '0',
  `Burger` int NOT NULL DEFAULT '0',
  `Huehnchen` int NOT NULL DEFAULT '0',
  `Pizza` int NOT NULL DEFAULT '0',
  `Ghostface` int NOT NULL DEFAULT '0',
  `Holz` int NOT NULL DEFAULT '0',
  `MotorradscheinPraxis` int NOT NULL DEFAULT '0',
  `BootscheinPraxis` int NOT NULL DEFAULT '0',
  `TraktorscheinPraxis` int NOT NULL DEFAULT '0',
  `HelikopterscheinPraxis` int NOT NULL DEFAULT '0',
  `FlugscheinAPraxis` int NOT NULL DEFAULT '0',
  `FlugscheinBPraxis` int NOT NULL DEFAULT '0',
  `Handynummer` int NOT NULL DEFAULT '0',
  `Warns` int NOT NULL DEFAULT '0',
  `BoxerPunkte` int NOT NULL DEFAULT '0',
  `Intro` int NOT NULL DEFAULT '0',
  `Tutorial` int NOT NULL DEFAULT '0',
  `Prison` int NOT NULL DEFAULT '0',
  `FuehrerscheinTheorie` int NOT NULL DEFAULT '0',
  `MotorradscheinTheorie` int NOT NULL DEFAULT '0',
  `BootscheinTheorie` int NOT NULL DEFAULT '0',
  `TraktorscheinTheorie` int NOT NULL DEFAULT '0',
  `HelikopterscheinTheorie` int NOT NULL DEFAULT '0',
  `FlugscheinATheorie` int NOT NULL DEFAULT '0',
  `FlugscheinBTheorie` int NOT NULL DEFAULT '0',
  `PizzalieferantPunkte` int NOT NULL DEFAULT '0',
  `BusfahrerPunkte` int NOT NULL DEFAULT '0',
  `MeeresreinigerPunkte` int NOT NULL DEFAULT '0',
  `PilotPunkte` int NOT NULL DEFAULT '0',
  `MuellmannPunkte` int NOT NULL DEFAULT '0',
  `PostbotePunkte` int NOT NULL DEFAULT '0',
  `HolzfaellerPunkte` int NOT NULL DEFAULT '0',
  `SchrottplatzmitarbeiterPunkte` int NOT NULL DEFAULT '0',
  `FarmerPunkte` int NOT NULL DEFAULT '0',
  `TaxifahrerPunkte` int NOT NULL DEFAULT '0',
  `GabelstaplerfahrerPunkte` int NOT NULL DEFAULT '0',
  `PANote` int NOT NULL DEFAULT '0',
  `Muskeln` int NOT NULL DEFAULT '0',
  `TutorialTask` int NOT NULL DEFAULT '1',
  `TutorialFinished` int NOT NULL DEFAULT '0',
  `Schulden` int NOT NULL DEFAULT '0',
  `Ehepartner` varchar(50) NOT NULL DEFAULT 'Niemand',
  `ClothesTexture` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ClothesModel` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ArchaeologenLexikon` int NOT NULL DEFAULT '0',
  `Knochenfunde` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `Schutzmechanismus` int NOT NULL DEFAULT '0',
  `Raketentreibstoff` int NOT NULL DEFAULT '0',
  `Mondsteine` int NOT NULL DEFAULT '0',
  `Personalausweis` int DEFAULT '0',
  `Arbeitsgenehmigung` int NOT NULL DEFAULT '0',
  `Bankpin` int NOT NULL DEFAULT '0',
  `Automatensprengkit` int NOT NULL DEFAULT '0',
  `Spitzhacke` int NOT NULL DEFAULT '0',
  `Schatztruhe` int NOT NULL DEFAULT '0',
  `Sammelkarten` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `Sammelkartenalbum` int NOT NULL DEFAULT '0',
  `Bonuspunkte` int NOT NULL DEFAULT '0',
  `WaffenskillsPistol` int NOT NULL DEFAULT '0',
  `WaffenskillsShotgun` int NOT NULL DEFAULT '0',
  `WaffenskillsMaschinenpistole` int NOT NULL DEFAULT '0',
  `WaffenskillsSturmgewehr` int NOT NULL DEFAULT '0',
  `Kampfstil` int NOT NULL DEFAULT '4',
  `President` int NOT NULL DEFAULT '0',
  `Golderz` int NOT NULL DEFAULT '0',
  `Goldbarren` int NOT NULL DEFAULT '0',
  `HoehlenforscherPunkte` int NOT NULL DEFAULT '0',
  `Futter` int NOT NULL DEFAULT '0',
  `Wasser` int NOT NULL DEFAULT '0',
  `Spielzeug` int NOT NULL DEFAULT '0',
  `Medizin` int NOT NULL DEFAULT '0',
  `BronzeTicket` int NOT NULL DEFAULT '0',
  `SilverTicket` int NOT NULL DEFAULT '0',
  `GoldTicket` int NOT NULL DEFAULT '0',
  `RubinTicket` int NOT NULL DEFAULT '0',
  `Zigaretten` int NOT NULL DEFAULT '0',
  `Language` varchar(50) NOT NULL DEFAULT 'DE',
  `Craftingpanel` int NOT NULL DEFAULT '0',
  `Hotdogs` int NOT NULL DEFAULT '0',
  `Eis` int NOT NULL DEFAULT '0',
  `Hitsound` int NOT NULL DEFAULT '0',
  `GangwarDamage` int NOT NULL DEFAULT '0',
  `GangwarKills` int NOT NULL DEFAULT '0',
  `HUD` int NOT NULL DEFAULT '0',
  `Scoreboard` int NOT NULL DEFAULT '0',
  `Fett` int NOT NULL DEFAULT '0',
  `PresidentGewaehlt` varchar(50) NOT NULL DEFAULT 'Niemand',
  `LastFraktionInvite` varchar(50) NOT NULL DEFAULT '0',
  `LastUnternehmenInvite` varchar(50) NOT NULL DEFAULT '0',
  `LastFirmaInvite` varchar(50) NOT NULL DEFAULT '0',
  `FraktionZivizeit` varchar(50) NOT NULL DEFAULT '0',
  `UnternehmenZivizeit` varchar(50) NOT NULL DEFAULT '0',
  `FirmaZivizeit` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Achievement1` int NOT NULL DEFAULT '0',
  `Achievement2` int NOT NULL DEFAULT '0',
  `Achievement3` int NOT NULL DEFAULT '0',
  `Achievement4` int NOT NULL DEFAULT '0',
  `Achievement5` int NOT NULL DEFAULT '0',
  `Achievement6` int NOT NULL DEFAULT '0',
  `Achievement7` int NOT NULL DEFAULT '0',
  `Achievement8` int NOT NULL DEFAULT '0',
  `Achievement9` int NOT NULL DEFAULT '0',
  `Achievement10` int NOT NULL DEFAULT '0',
  `Achievement11` int NOT NULL DEFAULT '0',
  `Achievement12` int NOT NULL DEFAULT '0',
  `Achievement13` int NOT NULL DEFAULT '0',
  `Achievement14` int NOT NULL DEFAULT '0',
  `Achievement15` int NOT NULL DEFAULT '0',
  `Achievement16` int NOT NULL DEFAULT '0',
  `Achievement17` int NOT NULL DEFAULT '0',
  `Achievement18` int NOT NULL DEFAULT '0',
  `Achievement19` int NOT NULL DEFAULT '0',
  `Achievement20` int NOT NULL DEFAULT '0',
  `Achievement21` int NOT NULL DEFAULT '0',
  `Achievement22` int NOT NULL DEFAULT '0',
  `Achievement23` int NOT NULL DEFAULT '0',
  `Achievement24` int NOT NULL DEFAULT '0',
  `Achievement25` int NOT NULL DEFAULT '0',
  `Achievement26` int NOT NULL DEFAULT '0',
  `Achievement27` int NOT NULL DEFAULT '0',
  `Achievement28` int NOT NULL DEFAULT '0',
  `Achievement29` int NOT NULL DEFAULT '0',
  `Achievement30` int NOT NULL DEFAULT '0',
  `Achievement31` int NOT NULL DEFAULT '0',
  `Achievement32` int NOT NULL DEFAULT '0',
  `Achievement33` int NOT NULL DEFAULT '0',
  `Achievement34` int NOT NULL DEFAULT '0',
  `Achievement35` int NOT NULL DEFAULT '0',
  `Achievement36` int NOT NULL DEFAULT '0',
  `Achievement37` int NOT NULL DEFAULT '0',
  `Achievement38` int NOT NULL DEFAULT '0',
  `Achievement39` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ammunation`
--

CREATE TABLE `ammunation` (
  `ID` int NOT NULL,
  `Deagle` int NOT NULL,
  `DeaglePreis` int NOT NULL,
  `Mp5` int NOT NULL,
  `Mp5Preis` int NOT NULL,
  `M4` int NOT NULL,
  `M4Preis` int NOT NULL,
  `Rifle` int NOT NULL,
  `RiflePreis` int NOT NULL,
  `Shotgun` int NOT NULL,
  `ShotgunPreis` int NOT NULL,
  `Uzi` int NOT NULL,
  `UziPreis` int NOT NULL,
  `AK47` int NOT NULL,
  `AK47Preis` int NOT NULL,
  `Name` text NOT NULL,
  `Weste` int NOT NULL DEFAULT '50',
  `WestePreis` int NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ammunation`
--

INSERT INTO `ammunation` (`ID`, `Deagle`, `DeaglePreis`, `Mp5`, `Mp5Preis`, `M4`, `M4Preis`, `Rifle`, `RiflePreis`, `Shotgun`, `ShotgunPreis`, `Uzi`, `UziPreis`, `AK47`, `AK47Preis`, `Name`, `Weste`, `WestePreis`) VALUES
(1, 50, 250, 50, 120, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3500, 'Ammunation1', 50, 150),
(2, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation2', 50, 150),
(3, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation3', 50, 150),
(4, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation4', 50, 150),
(5, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation5', 50, 150),
(6, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation6', 50, 150),
(7, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation7', 50, 150),
(8, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation8', 50, 150),
(9, 50, 250, 50, 1200, 50, 2500, 50, 1500, 50, 750, 50, 600, 50, 3000, 'Ammunation9', 50, 150);

-- --------------------------------------------------------

--
-- Table structure for table `angelladen`
--

CREATE TABLE `angelladen` (
  `ID` int NOT NULL,
  `Angel` int NOT NULL,
  `AngelPreis` int NOT NULL,
  `Koeder` int NOT NULL,
  `KoederPreis` int NOT NULL,
  `Angelhaken` int NOT NULL,
  `AngelhakenPreis` int NOT NULL,
  `FischPreis` int NOT NULL,
  `Fisch` int NOT NULL,
  `Taucheranzug` int NOT NULL,
  `TaucheranzugPreis` int NOT NULL,
  `Oxygenflasche` int NOT NULL DEFAULT '0',
  `OxygenflaschePreis` int NOT NULL DEFAULT '0',
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelladen`
--

INSERT INTO `angelladen` (`ID`, `Angel`, `AngelPreis`, `Koeder`, `KoederPreis`, `Angelhaken`, `AngelhakenPreis`, `FischPreis`, `Fisch`, `Taucheranzug`, `TaucheranzugPreis`, `Oxygenflasche`, `OxygenflaschePreis`, `Name`) VALUES
(1, 50, 6000, 50, 50, 50, 25, 7, 0, 50, 200000, 50, 2000, 'Angelladen1'),
(2, 50, 6000, 50, 50, 50, 25, 7, 0, 50, 200000, 50, 2500, 'Angelladen2'),
(3, 50, 6000, 50, 50, 50, 25, 7, 0, 50, 200000, 50, 2500, 'Angelladen3');

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotation` varchar(50) NOT NULL,
  `Inhalt` int NOT NULL DEFAULT '0',
  `Interior` int NOT NULL,
  `Dimension` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atms`
--

INSERT INTO `atms` (`ID`, `Spawnx`, `Spawny`, `Spawnz`, `Rotation`, `Inhalt`, `Interior`, `Dimension`) VALUES
(1, '1367.32421875', '-1307.0759277344', '13.189800262451', '270', 750000, 0, 0),
(2, '1457.9560546875', '-1750.8515625', '13.189800262451', '270', 750000, 0, 0),
(3, '1343.603515625', '-1759.251953125', '13.150699615479', '179.99499511719', 750000, 0, 0),
(4, '1491.7109375', '-1010.2631225586', '26.486600875854', '270', 750000, 0, 0),
(5, '1454.7028808594', '-1140.3201904297', '23.633100509644', '39.75', 750000, 0, 0),
(6, '1491.7109375', '-1011.0850219727', '26.486600875854', '270', 750000, 0, 0),
(7, '1445.1112060547', '-1336.4564208984', '13.174500465393', '90', 750000, 0, 0),
(8, '1810.7875976563', '-1880.849609375', '13.226699829102', '90', 750000, 0, 0),
(9, '1550.365234375', '-1679.4765625', '13.197699546814', '0', 750000, 0, 0),
(10, '1721.646484375', '-1636.9228515625', '19.855100631714', '179.99499511719', 750000, 0, 0),
(11, '1928.55859375', '-1785.7412109375', '13.189800262451', '90', 750000, 0, 0),
(12, '399.22158813477', '-1806.2501220703', '7.4809999465942', '180', 750000, 0, 0),
(13, '-394.56921386719', '-428.53289794922', '15.845999717712', '353.5', 750000, 0, 0),
(14, '1212.9072265625', '-1815.6962890625', '16.236600875854', '90', 750000, 0, 0),
(15, '440.921875', '-1734.7685546875', '9.0621004104614', '90', 750000, 0, 0),
(16, '349.57989501953', '-1491.4227294922', '35.681999206543', '32.744995117188', 750000, 0, 0),
(17, '1013.5043945313', '-928.75988769531', '41.971000671387', '8', 750000, 0, 0),
(18, '327.7763671875', '-1373.56640625', '13.999899864197', '28.498992919922', 750000, 0, 0),
(19, '519.1005859375', '-1293.9853515625', '16.885099411011', '179.99499511719', 750000, 0, 0),
(20, '1133.7590332031', '-922.45599365234', '43.033500671387', '0', 750000, 0, 0),
(21, '1549.9781494141', '-1151.5924072266', '23.721000671387', '0', 750000, 0, 0),
(22, '1192.8671875', '-916.50390625', '42.821601867676', '7.2449951171875', 750000, 0, 0),
(23, '1650.5284423828', '-1862.625', '13.178400039673', '0', 750000, 0, 0),
(24, '1495.2421875', '-1582.322265625', '13.189800262451', '0', 750000, 0, 0),
(25, '907.85931396484', '-1637.1987304688', '13.189800262451', '90', 750000, 0, 0),
(26, '1016.4879150391', '-1553.4520263672', '14.502300262451', '90', 750000, 0, 0),
(27, '1042.9481201172', '-1357.4553222656', '13.369500160217', '90', 750000, 0, 0),
(28, '1182.2198486328', '-1130.5576171875', '23.522800445557', '90', 750000, 0, 0),
(29, '952.93017578125', '-1130.2760009766', '23.502599716187', '90', 750000, 0, 0),
(30, '1467.7457275391', '-1054.6159667969', '23.471000671387', '90', 750000, 0, 0),
(31, '1566.1579589844', '-1898.0657958984', '13.203800201416', '180', 750000, 0, 0),
(32, '2388.8674316406', '-1982.0042724609', '13.189800262451', '179.99499511719', 750000, 0, 0),
(33, '1696.880859375', '-2006.9052734375', '13.763299942017', '179.99499511719', 750000, 0, 0),
(34, '2184.115234375', '-1815.2490234375', '13.189800262451', '179.99499511719', 750000, 0, 0),
(35, '2431.796875', '-1680.6376953125', '13.436800003052', '179.99499511719', 750000, 0, 0),
(36, '2376.9775390625', '-1941.6220703125', '13.189800262451', '179.99499511719', 750000, 0, 0),
(37, '2257.3273925781', '-2341.3129882813', '13.189800262451', '134.99499511719', 750000, 0, 0),
(38, '2444.5107421875', '-2121.2841796875', '13.189800262451', '179.99499511719', 750000, 0, 0),
(39, '1971.5256347656', '-1283.4858398438', '23.627300262451', '180', 750000, 0, 0),
(40, '1950.94921875', '-2176.1884765625', '13.189800262451', '179.99499511719', 750000, 0, 0),
(41, '920.66821289063', '-1244.6105957031', '15.308500289917', '179.99499511719', 750000, 0, 0),
(42, '2210.7314453125', '-1144.7734375', '25.436599731445', '179.99499511719', 750000, 0, 0),
(43, '795.40252685547', '-1604.1917724609', '13.225399971008', '180.24499511719', 750000, 0, 0),
(44, '866.9599609375', '-1337.033203125', '13.185099601746', '179.99499511719', 750000, 0, 0),
(45, '1258.7451171875', '-782.17431640625', '91.674102783203', '270', 750000, 0, 0),
(46, '928.408203125', '-1336.8544921875', '13.189800262451', '179.99499511719', 750000, 0, 0),
(47, '1102.30078125', '-1449.009765625', '15.439800262451', '90', 750000, 0, 0),
(48, '813.6484375', '-1356.55078125', '13.186800003052', '179.99499511719', 750000, 0, 0),
(49, '2800.3181152344', '-1097.5533447266', '30.361600875854', '178.25', 750000, 0, 0),
(50, '1520.1953125', '-697.6826171875', '94.39289855957', '270', 750000, 0, 0),
(51, '1379.4462890625', '-1854.9638671875', '13.189800262451', '90', 750000, 0, 0),
(52, '-82.6201171875', '-1183.7939453125', '1.4185999631882', '336.99499511719', 750000, 0, 0),
(53, '-1982.1474609375', '-435.50759887695', '35.174098968506', '91.5', 750000, 0, 0),
(54, '-1046.19921875', '-587.205078125', '31.650699615479', '179.99499511719', 750000, 0, 0),
(55, '-2035.58203125', '-102.06069946289', '34.806999206543', '180', 750000, 0, 0),
(56, '-2097.9936523438', '21.064399719238', '34.963199615479', '179.99499511719', 750000, 0, 0),
(57, '-1975.6147460938', '309.38519287109', '34.814800262451', '0.25', 750000, 0, 0),
(58, '-2026.0087890625', '70.873046875', '28.064300537109', '90', 750000, 0, 0),
(59, '-1924.71875', '278.54296875', '40.689800262451', '90', 750000, 0, 0),
(60, '-2096.7761230469', '71.668098449707', '34.959499359131', '0.24700927734375', 750000, 0, 0),
(61, '-2161.8896484375', '262.703125', '34.966400146484', '0.24700927734375', 750000, 0, 0),
(62, '-2323.474609375', '-163.9022064209', '35.197601318359', '0.24700927734375', 750000, 0, 0),
(63, '-2271.88671875', '-60.604488372803', '34.963199615479', '0.24700927734375', 750000, 0, 0),
(64, '-2432.0432128906', '-161.16830444336', '35.027400970459', '359.99700927734', 750000, 0, 0),
(65, '-2320.0263671875', '-60.3603515625', '34.963199615479', '0.24700927734375', 750000, 0, 0),
(66, '-2758.6767578125', '49.172199249268', '6.8303999900818', '0', 750000, 0, 0),
(67, '-2662.28515625', '-200.6591796875', '3.9788000583649', '0', 750000, 0, 0),
(68, '-2715.5634765625', '229.17289733887', '3.970999956131', '90', 750000, 0, 0),
(69, '-2765.3759765625', '384.85049438477', '5.9710001945496', '90', 750000, 0, 0),
(70, '-2496.3420410156', '796.16027832031', '34.814800262451', '90', 750000, 0, 0),
(71, '-2616.373046875', '499.5380859375', '14.252300262451', '90', 750000, 0, 0),
(72, '-2421.0522460938', '344.46499633789', '36.643199920654', '58', 750000, 0, 0),
(73, '-2276.310546875', '546.435546875', '34.796001434326', '90', 750000, 0, 0),
(74, '-2242.279296875', '-100.41870117188', '34.95539855957', '270', 750000, 0, 0),
(75, '-2240.3701171875', '155.3427734375', '34.963199615479', '179.99499511719', 750000, 0, 0),
(76, '-2491.5505371094', '-10.716400146484', '25.408500671387', '270', 750000, 0, 0),
(77, '-2581.1081542969', '303.84210205078', '4.8225998878479', '270', 750000, 0, 0),
(78, '-2594.6767578125', '95.021476745605', '3.9788000583649', '270', 750000, 0, 0),
(79, '-2462.0886230469', '507.05288696289', '29.721000671387', '270', 750000, 0, 0),
(80, '-2007.7510986328', '1346.8713378906', '6.8218998908997', '270', 750000, 0, 0),
(81, '-2353.3916015625', '995.384765625', '50.541301727295', '270', 750000, 0, 0),
(82, '-2704.5126953125', '1306.91796875', '6.6444997787476', '270', 750000, 0, 0),
(83, '-1624.19921875', '716.76257324219', '14.252300262451', '180', 750000, 0, 0),
(84, '-1642.009765625', '1207.65234375', '6.8225998878479', '134.24700927734', 750000, 0, 0),
(85, '-1493.06640625', '907.4375', '6.8281998634338', '270', 750000, 0, 0),
(86, '-1980.5963134766', '131.08520507813', '27.330400466919', '270', 750000, 0, 0),
(87, '-2061.8098144531', '470.02578735352', '34.814800262451', '90', 750000, 0, 0),
(88, '-2032.9990234375', '154.5859375', '28.688999176025', '90', 750000, 0, 0),
(89, '-1618.3684082031', '788.31530761719', '6.8303999900818', '180', 750000, 0, 0),
(90, '-1911.34765625', '696.4892578125', '45.088199615479', '90', 750000, 0, 0),
(91, '-2537.3200683594', '577.98492431641', '14.258700370789', '0', 750000, 0, 0),
(92, '-1923.5629882813', '511.56768798828', '34.814800262451', '0', 750000, 0, 0),
(93, '-2452.19921875', '125.32520294189', '34.814800262451', '179.99499511719', 750000, 0, 0),
(94, '-2360.060546875', '-46.569339752197', '34.963199615479', '179.99499511719', 750000, 0, 0),
(95, '-1988.875', '1125.810546875', '54.111598968506', '90', 750000, 0, 0),
(96, '-1779.73046875', '1208.9130859375', '24.767900466919', '0', 750000, 0, 0),
(97, '-1741.568359375', '868.587890625', '24.728799819946', '0', 750000, 0, 0),
(98, '-2178.2036132813', '633.54791259766', '49.08039855957', '180', 750000, 0, 0),
(99, '-2102.6201171875', '395.0654296875', '34.814800262451', '0', 750000, 0, 0),
(100, '-2658.765625', '259.921875', '4.2757000923157', '179.99499511719', 750000, 0, 0),
(101, '-2129.5754394531', '903.01037597656', '79.64289855957', '270', 750000, 0, 0),
(102, '2717.4699707031', '900.07458496094', '10.541299819946', '90', 750000, 0, 0),
(103, '2536.8212890625', '759.66015625', '10.666299819946', '90', 750000, 0, 0),
(104, '2557.8872070313', '1202.90234375', '10.463199615479', '0', 750000, 0, 0),
(105, '2645.9521484375', '1129.6884765625', '10.822600364685', '0', 750000, 0, 0),
(106, '2112.7265625', '945.49432373047', '10.463199615479', '0', 750000, 0, 0),
(107, '2402.04296875', '1042.892578125', '10.463199615479', '0', 750000, 0, 0),
(108, '2023.3674316406', '1017.6702270508', '10.463199615479', '90', 750000, 0, 0),
(109, '2159.56640625', '939.4052734375', '10.463199615479', '270', 750000, 0, 0),
(110, '1987.7250976563', '1253.3232421875', '10.463199615479', '90', 750000, 0, 0),
(111, '2225.1103515625', '1394.8200683594', '10.705400466919', '0', 750000, 0, 0),
(112, '2415.431640625', '1382.8983154297', '10.463199615479', '0', 750000, 0, 0),
(113, '2567.1159667969', '1537.0732421875', '10.463199615479', '0', 750000, 0, 0),
(114, '2461.048828125', '2007.7777099609', '10.705400466919', '0', 750000, 0, 0),
(115, '2539.955078125', '1847.2685546875', '10.666299819946', '0', 750000, 0, 0),
(116, '2383.0515136719', '2043.5678710938', '10.463199615479', '180', 750000, 0, 0),
(117, '2312.3986816406', '2124.1743164063', '10.463199615479', '179.99499511719', 750000, 0, 0),
(118, '2317.94140625', '2461.4123535156', '10.463199615479', '0', 750000, 0, 0),
(119, '2273.8203125', '2292.8896484375', '10.463199615479', '0', 750000, 0, 0),
(120, '2365.7177734375', '2364.427734375', '10.463199615479', '0', 750000, 0, 0),
(121, '2067.12109375', '2122.8889160156', '10.455400466919', '0', 750000, 0, 0),
(122, '2074.7705078125', '2230.3310546875', '10.666299819946', '0', 750000, 0, 0),
(123, '1953.7731933594', '1758.0909423828', '12.357299804688', '180', 750000, 0, 0),
(124, '2084.6416015625', '2046.1953125', '10.700799942017', '0', 750000, 0, 0),
(125, '2169.0849609375', '1902.9052734375', '10.463199615479', '0', 750000, 0, 0),
(126, '2029.9462890625', '1896.3232421875', '11.846899986267', '179.99499511719', 750000, 0, 0),
(127, '1696.8874511719', '1974.4094238281', '10.506500244141', '90', 750000, 0, 0),
(128, '1664.921875', '1462.14453125', '10.418999671936', '90', 750000, 0, 0),
(129, '1697.7236328125', '1726.12890625', '10.463199615479', '90', 750000, 0, 0),
(130, '1377.0924072266', '2309.6047363281', '10.463199615479', '90', 750000, 0, 0),
(131, '1773.541015625', '2083.39453125', '10.463199615479', '90', 750000, 0, 0),
(132, '1706.642578125', '2209.91796875', '10.705400466919', '90', 750000, 0, 0),
(133, '1644.7017822266', '2250.8395996094', '10.705400466919', '180', 750000, 0, 0),
(134, '1441.7734375', '2375.4794921875', '10.463199615479', '90', 750000, 0, 0),
(135, '1159.318359375', '1363.4324951172', '10.463199615479', '179.99499511719', 750000, 0, 0),
(136, '941.49957275391', '1738.9095458984', '8.4945001602173', '90', 750000, 0, 0),
(137, '1674.4113769531', '1847.9276123047', '10.455800056458', '270', 750000, 0, 0),
(138, '997.7255859375', '2070.986328125', '10.463199615479', '90', 750000, 0, 0),
(139, '2196.9943847656', '1672.7696533203', '12.010100364685', '270', 750000, 0, 0),
(140, '1883.673828125', '1653.44921875', '10.186800003052', '270', 750000, 0, 0),
(141, '2493.2529296875', '1640.4744873047', '10.463199615479', '270', 750000, 0, 0),
(142, '2471.1374511719', '1554.4490966797', '10.456000328064', '90', 750000, 0, 0),
(143, '2590.6342773438', '1400.3923339844', '10.709400177002', '90', 750000, 0, 0),
(144, '2491.1689453125', '915.71508789063', '10.666299819946', '270', 750000, 0, 0),
(145, '1877.0693359375', '746.68182373047', '10.463199615479', '270', 750000, 0, 0),
(146, '1357.4731445313', '1024.1232910156', '10.463199615479', '270', 750000, 0, 0),
(147, '1591.375', '736.1953125', '10.463199615479', '270', 750000, 0, 0),
(148, '1455.2239990234', '742.61352539063', '10.666299819946', '268.5', 750000, 0, 0),
(149, '1520.125', '1047.6484375', '10.463199615479', '268.24798583984', 750000, 0, 0),
(150, '1557.3122558594', '955.58172607422', '10.463199615479', '90', 750000, 0, 0),
(151, '1857.8082275391', '1009.9528198242', '10.463199615479', '90', 750000, 0, 0),
(152, '1283.6046142578', '262.28070068359', '19.197599411011', '336', 750000, 0, 0),
(153, '1363.5618896484', '382.95761108398', '19.381000518799', '247', 750000, 0, 0),
(154, '1371.4814453125', '257.1455078125', '19.129899978638', '246.99499511719', 750000, 0, 0),
(155, '2310.4702148438', '-17.336799621582', '26.385099411011', '180', 750000, 0, 0),
(156, '1227.2119140625', '331.75390625', '19.197599411011', '246.99499511719', 750000, 0, 0),
(157, '1264.5849609375', '168.705078125', '19.213800430298', '246.99499511719', 750000, 0, 0),
(158, '664.01361083984', '-494.79330444336', '15.978799819946', '179.99499511719', 750000, 0, 0),
(159, '2250.177734375', '80.03125', '26.346599578857', '179.99499511719', 750000, 0, 0),
(160, '242.49349975586', '-168.02290344238', '1.220999956131', '270', 750000, 0, 0),
(161, '617.009765625', '-593.158203125', '16.875900268555', '179.99499511719', 750000, 0, 0),
(162, '117.88480377197', '-221.45539855957', '1.220999956131', '180', 750000, 0, 0),
(163, '151.54499816895', '-151.49630737305', '1.220999956131', '179.99499511719', 750000, 0, 0),
(164, '195.66549682617', '-31.505300521851', '1.220999956131', '179.99499511719', 750000, 0, 0),
(165, '274.09509277344', '-221.50129699707', '1.220999956131', '179.99499511719', 750000, 0, 0),
(166, '-76.257598876953', '-361.54379272461', '1.0726000070572', '270', 750000, 0, 0),
(167, '-2089.3508300781', '-2289.0886230469', '30.267900466919', '142', 750000, 0, 0),
(168, '1588.939453125', '-2205.8876953125', '13.197600364685', '270', 750000, 0, 0),
(169, '1680.9658203125', '-2335.5830078125', '13.189800262451', '179.99499511719', 750000, 0, 0),
(170, '-2088.9184570313', '-2468.7121582031', '30.267900466919', '140.748046875', 750000, 0, 0),
(171, '-2169.3076171875', '-2462.0498046875', '30.267900466919', '141.99801635742', 750000, 0, 0),
(172, '-1278.9456787109', '2710.4621582031', '49.909198760986', '28.75', 750000, 0, 0),
(173, '-2234.28515625', '2351.40234375', '4.6276998519897', '312.49499511719', 750000, 0, 0),
(174, '-2192.248046875', '2412.912109375', '4.6270999908447', '314.99499511719', 750000, 0, 0),
(175, '-1524.640625', '2610.3388671875', '55.478801727295', '0', 750000, 0, 0),
(176, '-756.41522216797', '2765.4187011719', '45.498500823975', '0', 750000, 0, 0),
(177, '-218.18200683594', '2710.8249511719', '62.563400268555', '0', 750000, 0, 0),
(178, '-286.50390625', '2643.4541015625', '62.756000518799', '0', 750000, 0, 0),
(179, '-180.9089050293', '1182.1206054688', '19.385099411011', '270', 750000, 0, 0),
(180, '-219.21510314941', '986.06030273438', '19.217100143433', '90', 750000, 0, 0),
(181, '-23.592769622803', '1173.3544921875', '19.206300735474', '270', 750000, 0, 0),
(182, '-327.93539428711', '1060.6126708984', '19.385099411011', '180', 750000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aussichtspunkte`
--

CREATE TABLE `aussichtspunkte` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Object1` int NOT NULL DEFAULT '0',
  `Object2` int NOT NULL DEFAULT '0',
  `Object3` int NOT NULL DEFAULT '0',
  `Object4` int NOT NULL DEFAULT '0',
  `Object5` int NOT NULL DEFAULT '0',
  `Object6` int NOT NULL DEFAULT '0',
  `Object7` int NOT NULL DEFAULT '0',
  `Object8` int NOT NULL DEFAULT '0',
  `Object9` int NOT NULL DEFAULT '0',
  `Object10` int NOT NULL DEFAULT '0',
  `Object11` int NOT NULL DEFAULT '0',
  `Object12` int NOT NULL DEFAULT '0',
  `Object13` int NOT NULL DEFAULT '0',
  `Object14` int NOT NULL DEFAULT '0',
  `Object15` int NOT NULL DEFAULT '0',
  `Object16` int NOT NULL DEFAULT '0',
  `Object17` int NOT NULL DEFAULT '0',
  `Object18` int NOT NULL DEFAULT '0',
  `Object19` int NOT NULL DEFAULT '0',
  `Object20` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `autohaus`
--

CREATE TABLE `autohaus` (
  `ID` int NOT NULL,
  `Buccaneer` int NOT NULL DEFAULT '0',
  `BuccaneerPreis` int NOT NULL DEFAULT '0',
  `Cadrona` int NOT NULL DEFAULT '0',
  `CadronaPreis` int NOT NULL DEFAULT '0',
  `Alpha` int NOT NULL DEFAULT '0',
  `AlphaPreis` int NOT NULL DEFAULT '0',
  `BlistaCompact` int NOT NULL DEFAULT '0',
  `BlistaCompactPreis` int NOT NULL DEFAULT '0',
  `Bravura` int NOT NULL DEFAULT '0',
  `BravuraPreis` int NOT NULL DEFAULT '0',
  `Club` int NOT NULL DEFAULT '0',
  `ClubPreis` int NOT NULL DEFAULT '0',
  `Esperanto` int NOT NULL DEFAULT '0',
  `EsperantoPreis` int NOT NULL DEFAULT '0',
  `Feltzer` int NOT NULL DEFAULT '0',
  `FeltzerPreis` int NOT NULL DEFAULT '0',
  `Fortune` int NOT NULL DEFAULT '0',
  `FortunePreis` int NOT NULL DEFAULT '0',
  `Elegant` int NOT NULL DEFAULT '0',
  `ElegantPreis` int NOT NULL DEFAULT '0',
  `Majestic` int NOT NULL DEFAULT '0',
  `MajesticPreis` int NOT NULL DEFAULT '0',
  `Hermes` int NOT NULL DEFAULT '0',
  `HermesPreis` int NOT NULL DEFAULT '0',
  `Name` text NOT NULL,
  `Bullet` int NOT NULL DEFAULT '0',
  `BulletPreis` int NOT NULL DEFAULT '0',
  `Euros` int NOT NULL DEFAULT '0',
  `EurosPreis` int NOT NULL DEFAULT '0',
  `Banshee` int NOT NULL DEFAULT '0',
  `BansheePreis` int NOT NULL DEFAULT '0',
  `Cheetah` int NOT NULL DEFAULT '0',
  `CheetahPreis` int NOT NULL DEFAULT '0',
  `Sultan` int NOT NULL DEFAULT '0',
  `SultanPreis` int NOT NULL DEFAULT '0',
  `Jester` int NOT NULL DEFAULT '0',
  `JesterPreis` int NOT NULL DEFAULT '0',
  `Infernus` int NOT NULL DEFAULT '0',
  `InfernusPreis` int NOT NULL DEFAULT '0',
  `SuperGT` int NOT NULL DEFAULT '0',
  `SuperGTPreis` int NOT NULL DEFAULT '0',
  `ZR350` int NOT NULL DEFAULT '0',
  `ZR350Preis` int NOT NULL DEFAULT '0',
  `Oceanic` int NOT NULL DEFAULT '0',
  `OceanicPreis` int NOT NULL DEFAULT '0',
  `Premier` int NOT NULL DEFAULT '0',
  `PremierPreis` int NOT NULL DEFAULT '0',
  `Primo` int NOT NULL DEFAULT '0',
  `PrimoPreis` int NOT NULL DEFAULT '0',
  `Sentinel` int NOT NULL DEFAULT '0',
  `SentinelPreis` int NOT NULL DEFAULT '0',
  `Sunrise` int NOT NULL DEFAULT '0',
  `SunrisePreis` int NOT NULL DEFAULT '0',
  `Washington` int NOT NULL DEFAULT '0',
  `WashingtonPreis` int NOT NULL DEFAULT '0',
  `Williard` int NOT NULL DEFAULT '0',
  `WilliardPreis` int NOT NULL DEFAULT '0',
  `Manana` int NOT NULL DEFAULT '0',
  `MananaPreis` int NOT NULL DEFAULT '0',
  `Picador` int NOT NULL DEFAULT '0',
  `PicadorPreis` int NOT NULL DEFAULT '0',
  `Previon` int NOT NULL DEFAULT '0',
  `PrevionPreis` int NOT NULL DEFAULT '0',
  `Stallion` int NOT NULL DEFAULT '0',
  `StallionPreis` int NOT NULL DEFAULT '0',
  `Tampa` int NOT NULL DEFAULT '0',
  `TampaPreis` int NOT NULL DEFAULT '0',
  `Virgo` int NOT NULL DEFAULT '0',
  `VirgoPreis` int NOT NULL DEFAULT '0',
  `Emperor` int NOT NULL DEFAULT '0',
  `EmperorPreis` int NOT NULL DEFAULT '0',
  `Glendale` int NOT NULL DEFAULT '0',
  `GlendalePreis` int NOT NULL DEFAULT '0',
  `FCR900` int NOT NULL DEFAULT '0',
  `FCR900Preis` int NOT NULL DEFAULT '0',
  `NRG500` int NOT NULL DEFAULT '0',
  `NRG500Preis` int NOT NULL DEFAULT '0',
  `PCJ600` int NOT NULL DEFAULT '0',
  `PCJ600Preis` int NOT NULL DEFAULT '0',
  `Sanchez` int NOT NULL DEFAULT '0',
  `SanchezPreis` int NOT NULL DEFAULT '0',
  `Freeway` int NOT NULL DEFAULT '0',
  `FreewayPreis` int NOT NULL DEFAULT '0',
  `Faggio` int NOT NULL DEFAULT '0',
  `FaggioPreis` int NOT NULL DEFAULT '0',
  `Shamal` int NOT NULL DEFAULT '0',
  `ShamalPreis` int NOT NULL DEFAULT '0',
  `Beagle` int NOT NULL DEFAULT '0',
  `BeaglePreis` int NOT NULL DEFAULT '0',
  `Stuntplane` int NOT NULL DEFAULT '0',
  `StuntplanePreis` int NOT NULL DEFAULT '0',
  `Skimmer` int NOT NULL DEFAULT '0',
  `SkimmerPreis` int NOT NULL DEFAULT '0',
  `Maverick` int NOT NULL DEFAULT '0',
  `MaverickPreis` int NOT NULL DEFAULT '0',
  `Coastguard` int NOT NULL DEFAULT '0',
  `CoastguardPreis` int NOT NULL DEFAULT '0',
  `Jetmax` int NOT NULL DEFAULT '0',
  `JetmaxPreis` int NOT NULL DEFAULT '0',
  `Launch` int NOT NULL DEFAULT '0',
  `LaunchPreis` int NOT NULL DEFAULT '0',
  `Marquis` int NOT NULL DEFAULT '0',
  `MarquisPreis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autohaus`
--

INSERT INTO `autohaus` (`ID`, `Buccaneer`, `BuccaneerPreis`, `Cadrona`, `CadronaPreis`, `Alpha`, `AlphaPreis`, `BlistaCompact`, `BlistaCompactPreis`, `Bravura`, `BravuraPreis`, `Club`, `ClubPreis`, `Esperanto`, `EsperantoPreis`, `Feltzer`, `FeltzerPreis`, `Fortune`, `FortunePreis`, `Elegant`, `ElegantPreis`, `Majestic`, `MajesticPreis`, `Hermes`, `HermesPreis`, `Name`, `Bullet`, `BulletPreis`, `Euros`, `EurosPreis`, `Banshee`, `BansheePreis`, `Cheetah`, `CheetahPreis`, `Sultan`, `SultanPreis`, `Jester`, `JesterPreis`, `Infernus`, `InfernusPreis`, `SuperGT`, `SuperGTPreis`, `ZR350`, `ZR350Preis`, `Oceanic`, `OceanicPreis`, `Premier`, `PremierPreis`, `Primo`, `PrimoPreis`, `Sentinel`, `SentinelPreis`, `Sunrise`, `SunrisePreis`, `Washington`, `WashingtonPreis`, `Williard`, `WilliardPreis`, `Manana`, `MananaPreis`, `Picador`, `PicadorPreis`, `Previon`, `PrevionPreis`, `Stallion`, `StallionPreis`, `Tampa`, `TampaPreis`, `Virgo`, `VirgoPreis`, `Emperor`, `EmperorPreis`, `Glendale`, `GlendalePreis`, `FCR900`, `FCR900Preis`, `NRG500`, `NRG500Preis`, `PCJ600`, `PCJ600Preis`, `Sanchez`, `SanchezPreis`, `Freeway`, `FreewayPreis`, `Faggio`, `FaggioPreis`, `Shamal`, `ShamalPreis`, `Beagle`, `BeaglePreis`, `Stuntplane`, `StuntplanePreis`, `Skimmer`, `SkimmerPreis`, `Maverick`, `MaverickPreis`, `Coastguard`, `CoastguardPreis`, `Jetmax`, `JetmaxPreis`, `Launch`, `LaunchPreis`, `Marquis`, `MarquisPreis`) VALUES
(1, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 10000, 47, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus1', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(2, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus2', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(3, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus3', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2500, 50, 2800, 50, 7000, 50, 6500, 50, 15000, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(4, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus4', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3860, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(5, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus5', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(6, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus6', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 200000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000),
(7, 50, 4000, 50, 1300, 50, 8000, 50, 4600, 50, 3000, 50, 8500, 9000, 12000, 50, 4500, 50, 7800, 50, 7600, 50, 13500, 50, 3450, 'Autohaus7', 50, 55000, 50, 37000, 50, 29000, 50, 49000, 50, 60000, 50, 90000, 50, 78000, 50, 65000, 50, 200000, 50, 4000, 50, 2650, 50, 2800, 50, 7000, 50, 6500, 50, 12500, 50, 8000, 50, 3850, 50, 3000, 50, 2300, 50, 1200, 50, 900, 50, 5500, 50, 3000, 50, 2400, 50, 24000, 50, 48000, 50, 26000, 50, 55000, 50, 12000, 50, 15000, 50, 400000, 50, 280000, 50, 150000, 50, 180000, 50, 90000, 50, 90000, 50, 225000, 50, 120000, 50, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Grund` text NOT NULL,
  `STime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bars`
--

CREATE TABLE `bars` (
  `ID` int NOT NULL,
  `Whiskey` int NOT NULL,
  `WhiskeyPreis` int NOT NULL,
  `Bier` int NOT NULL,
  `BierPreis` int NOT NULL,
  `Wein` int NOT NULL,
  `WeinPreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bars`
--

INSERT INTO `bars` (`ID`, `Whiskey`, `WhiskeyPreis`, `Bier`, `BierPreis`, `Wein`, `WeinPreis`, `Name`) VALUES
(1, 50, 10, 50, 50, 50, 7, 'Bars1'),
(2, 50, 10, 50, 50, 50, 7, 'Bars2'),
(3, 50, 10, 50, 50, 50, 7, 'Bars3');

-- --------------------------------------------------------

--
-- Table structure for table `bewertungen`
--

CREATE TABLE `bewertungen` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Bewerter` text NOT NULL,
  `BewertungenGesamt` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `birthday`
--

CREATE TABLE `birthday` (
  `ID` int NOT NULL,
  `Geburtstagskind` text NOT NULL,
  `Praemie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bonuscodes`
--

CREATE TABLE `bonuscodes` (
  `ID` int NOT NULL,
  `Code` text NOT NULL,
  `AllUser` text NOT NULL,
  `Used` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ID` int NOT NULL,
  `Autor` text NOT NULL,
  `Titel` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Text` text NOT NULL,
  `Freigeschaltet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booksausgeliehen`
--

CREATE TABLE `booksausgeliehen` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `BookID` int NOT NULL,
  `STime` int NOT NULL,
  `Leihzeit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `burgershot`
--

CREATE TABLE `burgershot` (
  `ID` int NOT NULL,
  `Gericht2212` int NOT NULL,
  `Gericht2212Preis` int NOT NULL,
  `Gericht2213` int NOT NULL,
  `Gericht2213Preis` int NOT NULL,
  `Gericht2214` int NOT NULL,
  `Gericht2214Preis` int NOT NULL,
  `Gericht2354` int NOT NULL,
  `Gericht2354Preis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `burgershot`
--

INSERT INTO `burgershot` (`ID`, `Gericht2212`, `Gericht2212Preis`, `Gericht2213`, `Gericht2213Preis`, `Gericht2214`, `Gericht2214Preis`, `Gericht2354`, `Gericht2354Preis`, `Name`) VALUES
(1, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot1'),
(2, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot2'),
(3, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot3'),
(4, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot4'),
(5, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot5'),
(6, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot6'),
(7, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot7'),
(8, 50, 15, 50, 25, 50, 45, 50, 15, 'Burgershot8');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Besitzer` text NOT NULL,
  `Preis` int NOT NULL,
  `Kasse` int NOT NULL,
  `Name` text NOT NULL,
  `Databasename` text NOT NULL,
  `Tabelle` text NOT NULL,
  `Steuern` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`ID`, `Spawnx`, `Spawny`, `Spawnz`, `Besitzer`, `Preis`, `Kasse`, `Name`, `Databasename`, `Tabelle`, `Steuern`) VALUES
(1, '-2636.0092773438', '209.01768493652', '4.3533024787903', 'Niemand', 750000, 0, 'Ocean Flats Ammunation', 'Ammunation1', 'ammunation', '0'),
(2, '2397.53515625', '-1981.4663085938', '13.546875', 'Niemand', 450000, 0, 'Willowfield Ammunation', 'Ammunation2', 'ammunation', '0'),
(3, '1367.1055908203', '-1283.3984375', '13.546875', 'Niemand', 1000000, 0, 'Market Ammunation', 'Ammunation3', 'ammunation', '0'),
(4, '2159.3332519531', '939.47235107422', '10.8203125', 'Niemand', 350000, 0, 'Las Venturas Ammunation', 'Ammunation4', 'ammunation', '0'),
(5, '2539.0895996094', '2079.5646972656', '10.8203125', 'Niemand', 400000, 0, 'Old Venturas Strip Ammunation', 'Ammunation5', 'ammunation', '0'),
(6, '776.76684570313', '1867.7811279297', '4.8835978507996', 'Niemand', 300000, 0, 'Bone Country Ammunation', 'Ammunation6', 'ammunation', '0'),
(7, '-315.8258972168', '826.43597412109', '14.2421875', 'Niemand', 350000, 0, 'Fort Carson Ammunation', 'Ammunation7', 'ammunation', '0'),
(8, '-1511.3487548828', '2609.9108886719', '55.8359375', 'Niemand', 450000, 0, 'El Quebrados Ammunation', 'Ammunation8', 'ammunation', '0'),
(9, '242.39540100098', '-174.73440551758', '1.578125', 'Niemand', 550000, 0, 'Blueberry Ammunation', 'Ammunation9', 'ammunation', '0'),
(10, '388.72225952148', '-1925.4937744141', '8.3437519073486', 'Niemand', 180000, 0, 'Santa Maria Beach Angelladen', 'Angelladen1', 'angelladen', '0'),
(11, '-1750.7380371094', '212.32157897949', '4.0625023841858', 'Niemand', 500000, 0, 'Easter Basin Angelladen', 'Angelladen2', 'angelladen', '0'),
(12, '-1354.0960693359', '2054.4936523438', '53.1171875', 'Niemand', 250000, 0, 'Tierra Robada Angelladen', 'Angelladen3', 'angelladen', '0'),
(13, '2312.4375', '-1645.0194091797', '14.827047348022', 'Niemand', 200000, 0, 'Ganton Bar', 'Bars1', 'bars', '0'),
(14, '-2242.2800292969', '-85.109329223633', '35.3203125', 'streyge', 450000, 0, 'Garcia Bar', 'Bars2', 'bars', '0'),
(15, '2511.4799804688', '1243.5822753906', '10.8203125', 'Niemand', 250000, 0, 'The Camel\'s Toe Bar', 'Bars3', 'bars', '0'),
(16, '-2331.7141113281', '-164.73902893066', '35.5546875', 'Niemand', 600000, 0, 'Garcia Burgershot', 'Burgershot1', 'burgershot', '0'),
(17, '-2354.1520996094', '1003.7664794922', '50.8984375', 'Niemand', 600000, 0, 'Juniper Hollow Burgershot', 'Burgershot2', 'burgershot', '0'),
(18, '-1915.0705566406', '828.81335449219', '35.489540100098', 'Niemand', 600000, 0, 'Downtown Burgershot', 'Burgershot3', 'burgershot', '0'),
(19, '1152.5034179688', '2072.1315917969', '11.0625', 'Niemand', 350000, 0, 'Whitewood Estates Burgershot', 'Burgershot4', 'burgershot', '0'),
(20, '2163.515625', '2795.5944824219', '10.8203125', 'Niemand', 350000, 0, 'Spinybed Burgershot', 'Burgershot5', 'burgershot', '0'),
(21, '2467.3742675781', '2032.1002197266', '11.0625', 'Niemand', 350000, 0, 'Old Venturas Strip Burgershot', 'Burgershot6', 'burgershot', '0'),
(22, '1201.8071289063', '-919.68804931641', '43.094444274902', 'Niemand', 400000, 0, 'Temple Burgershot', 'Burgershot7', 'burgershot', '0'),
(23, '812.23443603516', '-1618.4764404297', '13.554670333862', 'Niemand', 400000, 0, 'Marina Burgershot', 'Burgershot8', 'burgershot', '0'),
(24, '2394.724609375', '-1899.1711425781', '13.546875', 'Niemand', 400000, 0, 'Willowvield Cluckin\' Bell', 'CluckinBell1', 'cluckinbell', '0'),
(25, '2419.7961425781', '-1506.0323486328', '24', 'Niemand', 400000, 0, 'East Los Santos Cluckin\' Bell', 'CluckinBell2', 'cluckinbell', '0'),
(26, '926.87646484375', '-1349.3627929688', '13.384064674377', 'Niemand', 450000, 0, 'Market Cluckin\' Bell', 'CluckinBell3', 'cluckinbell', '0'),
(27, '-1813.3352050781', '618.44909667969', '35.171875', 'Niemand', 450000, 0, 'Downtown Cluckin\' Bell', 'CluckinBell4', 'cluckinbell', '0'),
(28, '-2675.2194824219', '259.93896484375', '4.6328125', 'Niemand', 450000, 0, 'Ocean Flats Cluckin\' Bell', 'CluckinBell5', 'cluckinbell', '0'),
(29, '2848.3176269531', '2417.8256835938', '11.068956375122', 'Niemand', 250000, 0, 'Creek Cluckin\' Bell', 'CluckinBell6', 'cluckinbell', '0'),
(30, '2102.3041992188', '2231.5236816406', '11.0234375', 'Niemand', 250000, 0, 'The Emerald Isle Cluckin\' Bell', 'CluckinBell7', 'cluckinbell', '0'),
(31, '2638.5866699219', '1669.0401611328', '11.0234375', 'Niemand', 300000, 0, 'Pilgrim Cluckin\' Bell', 'CluckinBell8', 'cluckinbell', '0'),
(32, '-2150.2109375', '-2462.6821289063', '30.84375', 'Niemand', 350000, 0, 'Angel Pine Cluckin\' Bell', 'CluckinBell9', 'cluckinbell', '0'),
(33, '175.66780090332', '1175.2464599609', '14.7578125', 'Niemand', 350000, 0, 'Bone County Cluckin\' Bell', 'CluckinBell10', 'cluckinbell', '0'),
(34, '-1210.8460693359', '1835.0550537109', '41.9296875', 'Niemand', 300000, 0, 'Tierra Robada Cluckin\' Bell', 'CluckinBell11', 'cluckinbell', '0'),
(35, '2389.46875', '2043.583984375', '10.8203125', 'Niemand', 350000, 0, 'Old Venturas Strip Cluckin\' Bell', 'CluckinBell12', 'cluckinbell', '0'),
(36, '-2767.8715820313', '785.66650390625', '52.78125', 'Niemand', 350000, 0, 'Palisades Donutladen', 'Donutladen1', 'donutladen', '0'),
(37, '1034.7366943359', '-1339.4866943359', '13.7265625', 'Niemand', 300000, 0, 'Market Donutladen', 'Donutladen2', 'donutladen', '0'),
(38, '-141.87104797363', '1223.4584960938', '19.899219512939', 'Niemand', 250000, 0, 'Bone County Donutladen', 'Donutladen3', 'donutladen', '0'),
(39, '-2581.1328125', '316.41525268555', '5.1796875', 'Niemand', 550000, 0, 'Queens Gartenclub', 'Gartenclub4', 'gartenclub', '0'),
(40, '2351.1320800781', '-1372.6788330078', '24.3984375', 'Niemand', 350000, 0, 'East Los Santos Gartenclub', 'Gartenclub5', 'gartenclub', '0'),
(41, '1557.5871582031', '992.98937988281', '10.8203125', 'Niemand', 350000, 0, 'LVA Freight Depot Gartenclub', 'Gartenclub6', 'gartenclub', '0'),
(42, '1419.9265136719', '-1637.8143310547', '13.546875', 'Niemand', 4000000, 0, 'Commerce Moebelhaus', 'Moebelhaus1', 'moebelhaus', '0'),
(43, '2072.0112304688', '-1828.2163085938', '13.554534912109', 'Niemand', 350000, 0, 'Idlewood Pay \'n\' Spray', 'PaynSpray1', 'paynspray', '0'),
(44, '485.25228881836', '-1733.8073730469', '11.093015670776', 'Niemand', 350000, 0, 'Santa Maria Beach Pay \'n\' Spray', 'PaynSpray2', 'paynspray', '0'),
(45, '1028.0706787109', '-1029.8839111328', '32.089340209961', 'Niemand', 350000, 0, 'Temple Pay \'n\' Spray', 'PaynSpray3', 'paynspray', '0'),
(46, '-1425.1971435547', '2591.6201171875', '55.823066711426', 'Niemand', 250000, 0, 'El Quebrados Pay \'n\' Spray', 'PaynSpray4', 'paynspray', '0'),
(47, '-95.745147705078', '1110.9494628906', '19.7421875', 'Niemand', 250000, 0, 'Fort Carson Pay \'n\' Spray', 'PaynSpray5', 'paynspray', '0'),
(48, '-1908.9033203125', '277.2292175293', '41.046875', 'Niemand', 450000, 0, 'Downtown Pay \'n\' Spray', 'PaynSpray6', 'paynspray', '0'),
(49, '-2431.2019042969', '1028.6866455078', '50.390625', 'Niemand', 450000, 0, 'Juniper Hollow Pay \'n\' Spray', 'PaynSpray7', 'paynspray', '0'),
(50, '-1719.9244384766', '1356.7542724609', '7.1875', 'Niemand', 600000, 0, 'Esplanade North Pizzeria', 'Pizzeria1', 'pizzeria', '0'),
(51, '-1810.9561767578', '943.95013427734', '24.890625', 'Niemand', 550000, 0, 'Financial Pizzeria', 'Pizzeria2', 'pizzeria', '0'),
(52, '2079.8430175781', '2224.30078125', '11.030031204224', 'Niemand', 250000, 0, 'The Emerald Isle Pizzeria', 'Pizzeria3', 'pizzeria', '0'),
(53, '2759.0302734375', '2474.6145019531', '11.0625', 'Niemand', 300000, 0, 'Creek Pizzeria', 'Pizzeria4', 'pizzeria', '0'),
(54, '2105.4543457031', '-1809.169921875', '13.5546875', 'Niemand', 450000, 0, 'Idlewood Pizzeria', 'Pizzeria5', 'pizzeria', '0'),
(55, '206.2839050293', '-202.18885803223', '1.578125', 'Niemand', 350000, 0, 'Blueberry Pizzeria', 'Pizzeria6', 'pizzeria', '0'),
(56, '1366.1229248047', '246.00309753418', '19.566932678223', 'Niemand', 350000, 0, 'Montgomery Pizzeria', 'Pizzeria7', 'pizzeria', '0'),
(57, '-2446.7770996094', '752.58428955078', '35.171875', 'Niemand', 400000, 0, 'Juniper Hill Supermarkt', 'Supermarkt1', 'supermarkt', '0'),
(58, '-2220.6525878906', '330.77484130859', '35.3203125', 'Niemand', 400000, 0, 'King\'s Supermarkt', 'Supermarkt2', 'supermarkt', '0'),
(59, '2194.9399414063', '1987.8415527344', '12.296875', 'Niemand', 250000, 0, 'Starfish Casino Supermarkt', 'Supermarkt3', 'supermarkt', '0'),
(60, '2886.8530273438', '2456.3359375', '11.068956375122', 'Niemand', 250000, 0, 'Creek Supermarkt', 'Supermarkt4', 'supermarkt', '0'),
(61, '1937.8348388672', '2304.3232421875', '10.8203125', 'Niemand', 250000, 0, 'Redsands East Supermarkt', 'Supermarkt5', 'supermarkt', '0'),
(62, '2101.3000488281', '2224.2980957031', '11.030031204224', 'Niemand', 250000, 0, 'The Emeralds Isle Supermarkt', 'Supermarkt6', 'supermarkt', '0'),
(63, '2244.43359375', '2397.5141601563', '10.8203125', 'Niemand', 250000, 0, 'Roca Escalante Supermarkt', 'Supermarkt7', 'supermarkt', '0'),
(64, '2455.1486816406', '2065.1840820313', '10.8203125', 'Niemand', 250000, 0, 'Old Venturas Strip Supermarkt', 'Supermarkt8', 'supermarkt', '0'),
(65, '2550.2966308594', '1971.9776611328', '10.8203125', 'Niemand', 250000, 0, 'Startfish Casino Supermarkt', 'Supermarkt9', 'supermarkt', '0'),
(66, '1318.0833740234', '-897.80187988281', '39.578125', 'Niemand', 300000, 0, 'Mulholland Supermarkt', 'Supermarkt10', 'supermarkt', '0'),
(67, '2423.0288085938', '-1745.7768554688', '13.546875', 'Niemand', 350000, 0, 'Ganton Supermarkt', 'Supermarkt11', 'supermarkt', '0'),
(68, '1349.5200195313', '-1759.2384033203', '13.515581130981', 'Niemand', 350000, 0, 'Commerce Supermarkt', 'Supermarkt12', 'supermarkt', '0'),
(69, '-180.69505310059', '1037.4110107422', '19.7421875', 'Niemand', 200000, 0, 'Fort Carson Supermarkt', 'Supermarkt13', 'supermarkt', '0'),
(70, '-1559.0119628906', '-2734.2041015625', '48.743457794189', 'Niemand', 150000, 0, 'Whetstone Supermarkt', 'Supermarkt14', 'supermarkt', '0'),
(71, '1928.5809326172', '-1780.3381347656', '13.546875', 'Niemand', 500000, 0, 'Idlewood Tankstelle', 'Tankstelle1', 'tankstellenshop', '0'),
(72, '-1316.9810791016', '2700.6293945313', '50.26628112793', 'Niemand', 250000, 0, 'Tierra Robada Tankstelle', 'Tankstelle2', 'tankstellenshop', '0'),
(73, '-731.48803710938', '2747.8422851563', '47.2265625', 'Niemand', 200000, 0, 'Valle Ocultado Tankstelle', 'Tankstelle3', 'tankstellenshop', '0'),
(74, '1601.5695800781', '2225.9638671875', '11.0625', 'Niemand', 350000, 0, 'Redsands West Tankstelle', 'Tankstelle4', 'tankstellenshop', '0'),
(75, '2142.1318359375', '2733.8662109375', '11.176349639893', 'Niemand', 350000, 0, 'Spinybed Tankstelle', 'Tankstelle5', 'tankstellenshop', '0'),
(76, '2187.7111816406', '2473.7692871094', '11.2421875', 'Niemand', 350000, 0, 'The Emerald Isle Tankstelle', 'Tankstelle6', 'tankstellenshop', '0'),
(77, '2631.7687988281', '1129.677734375', '11.1796875', 'Niemand', 350000, 0, 'Las Venturas Tankstelle', 'Tankstelle7', 'tankstellenshop', '0'),
(78, '2123.0024414063', '896.77722167969', '11.1796875', 'Niemand', 350000, 0, 'Las Venturas Tankstelle', 'Tankstelle8', 'tankstellenshop', '0'),
(79, '661.35968017578', '-576.87622070313', '16.3359375', 'Niemand', 250000, 0, 'Dillimore Tankstelle', 'Tankstelle9', 'tankstellenshop', '0'),
(80, '-79.640647888184', '-1172.8787841797', '2.1313104629517', 'Niemand', 300000, 0, 'Flint County Tankstelle', 'Tankstelle10', 'tankstellenshop', '0'),
(81, '-2233.7775878906', '-2562.2897949219', '31.921875', 'Niemand', 250000, 0, 'Angel Pine Tankstelle', 'Tankstelle11', 'tankstellenshop', '0'),
(82, '-1679.0123291016', '429.30261230469', '7.1796875', 'Niemand', 700000, 0, 'Easter Basin Tankstelle', 'Tankstelle12', 'tankstellenshop', '0'),
(83, '57.712856292725', '1211.6990966797', '18.856601715088', 'Niemand', 300000, 0, 'Fort Carson Tankstelle', 'Tankstelle13', 'tankstellenshop', '0'),
(84, '999.95568847656', '-916.34545898438', '42.328125', 'Niemand', 400000, 0, 'Mulholland Tankstelle', 'Tankstelle14', 'tankstellenshop', '0'),
(85, '2241.5432128906', '-1664.7110595703', '15.4765625', 'Niemand', 250000, 0, 'Ganton Skinshop', 'Skinshop1', 'skinshop', '0'),
(86, '-2491.5729980469', '-31.011861801147', '25.765625', 'Niemand', 350000, 0, 'Hashbury Skinshop', 'Skinshop2', 'skinshop', '0'),
(87, '-1691.9364013672', '949.01708984375', '24.890625', 'Niemand', 600000, 0, 'Downtown Skinshop', 'Skinshop3', 'skinshop', '0'),
(88, '477.66787719727', '-1535.5218505859', '19.617593765259', 'Niemand', 300000, 0, 'Rodeo Skinshop', 'Skinshop4', 'skinshop', '0'),
(89, '2115.7145996094', '-1211.4387207031', '23.962839126587', 'Niemand', 250000, 0, 'Jefferson Skinshop', 'Skinshop5', 'skinshop', '0'),
(90, '461.88293457031', '-1505.8715820313', '31.009548187256', 'Niemand', 250000, 0, 'Rodeo Skinshop', 'Skinshop6', 'skinshop', '0'),
(91, '2805.1928710938', '2428.4482421875', '11.0625', 'Niemand', 250000, 0, 'Creek Skinshop', 'Skinshop7', 'skinshop', '0'),
(92, '2781.5283203125', '2452.1247558594', '11.0625', 'Niemand', 250000, 0, 'Creek Skinshop', 'Skinshop8', 'skinshop', '0'),
(93, '2092.8959960938', '2224.3017578125', '11.0234375', 'Niemand', 250000, 0, 'The Emerald Isle SKinshop', 'Skinshop9', 'skinshop', '0'),
(94, '2102.3032226563', '2260.025390625', '11.0234375', 'Niemand', 250000, 0, 'The Emerald Isle Skinshop', 'Skinshop10', 'skinshop', '0'),
(95, '-1880.3696289063', '863.50903320313', '35.171875', 'Niemand', 600000, 0, 'Downtown Skinshop', 'Skinshop11', 'skinshop', '0'),
(96, '-2374.1704101563', '907.130859375', '45.440727233887', 'Niemand', 500000, 0, 'Juniper Hill Skinshop', 'Skinshop12', 'skinshop', '0'),
(97, '2072.0073242188', '-1791.2351074219', '13.546875', 'Niemand', 250000, 0, 'Idlewood Friseur', 'Friseur1', 'friseur', '0'),
(98, '2723.8608398438', '-2028.8510742188', '13.547199249268', 'Niemand', 250000, 0, 'Playa del Seville Skinshop', 'Friseur2', 'friseur', '0'),
(99, '825.86340332031', '-1590.4119873047', '13.55445098877', 'Niemand', 250000, 0, 'Marina Skinshop', 'Friseur3', 'friseur', '0'),
(100, '-2568.8100585938', '247.8244934082', '10.63893699646', 'Niemand', 350000, 0, 'Queens Skinshop', 'Friseur4', 'friseur', '0'),
(101, '2077.72265625', '2122.8723144531', '10.812517166138', 'Niemand', 200000, 0, 'Redsands East Skinshop', 'Friseur5', 'friseur', '0'),
(102, '672.06372070313', '-499.55053710938', '16.3359375', 'Niemand', 250000, 0, 'Dillimore Skinshop', 'Friseur6', 'friseur', '0'),
(103, '-1453.2351074219', '2592.3461914063', '55.8359375', 'Niemand', 200000, 0, 'El Quebrados Skinshop', 'Friseur7', 'friseur', '0'),
(104, '2068.6655273438', '-1777.3806152344', '13.558668136597', 'Niemand', 300000, 0, 'Idlewood Tattoostudio', 'Tattoostudio1', 'tattoostudio', '0'),
(105, '1976.6416015625', '-2039.7709960938', '13.546875', 'Niemand', 250000, 0, 'Willowfield Tattoostudio', 'Tattoostudio2', 'tattoostudio', '0'),
(106, '-2491.5771484375', '-41.551628112793', '25.754629135132', 'Niemand', 350000, 0, 'Hashbury Tattoostudio', 'Tattoostudio3', 'tattoostudio', '0'),
(107, '2091.6708984375', '2122.8706054688', '10.8203125', 'Niemand', 250000, 0, 'Redsands East Tattoostudio', 'Tattoostudio4', 'tattoostudio', '0'),
(108, '1339.0153808594', '278.24816894531', '19.561452865601', 'Niemand', 700000, 0, 'Montgomery Sprunk', 'Sprunk', 'sprunkautomaten', '0'),
(109, '1090.9608154297', '-922.48193359375', '43.390625', 'Niemand', 250000, 0, 'MulHolland Sexshop', 'Sexshop1', 'sexshops', '0'),
(110, '2515.3156738281', '2300.3203125', '10.8203125', 'Niemand', 150000, 0, 'Roca Escalante Sexshop', 'Sexshop2', 'sexshops', '0'),
(111, '2423.3806152344', '2065.1865234375', '10.8203125', 'Niemand', 175000, 0, 'Old Venturas Strip Sexshop', 'Sexshop3', 'sexshops', '0'),
(112, '2085.666015625', '2077.7971191406', '11.057899475098', 'Niemand', 250000, 0, 'Redsands East Sexshop', 'Sexshop4', 'sexshops', '0'),
(113, '-1967.1873779297', '291.57431030273', '35.263717651367', 'Niemand', 650000, 0, 'Wang Cars', 'Autohaus1', 'autohaus', '0'),
(114, '-1643.3814697266', '1201.1492919922', '7.2489910125732', 'Niemand', 1250000, 0, 'Otto\'s Cars', 'Autohaus2', 'autohaus', '0'),
(115, '555.03753662109', '-1293.9266357422', '17.248237609863', 'Niemand', 700000, 0, 'Grotti\'s Cars', 'Autohaus3', 'autohaus', '0'),
(116, '201.26934814453', '-236.68061828613', '1.578125', 'Niemand', 450000, 0, 'Blueberry Autohaus', 'Autohaus4', 'autohaus', '0'),
(117, '-2239.2595214844', '107.25885772705', '35.3203125', 'Niemand', 300000, 0, 'Bikeshop', 'Autohaus5', 'autohaus', '0'),
(118, '-1364.0035400391', '-248.51545715332', '14.14396572113', 'Niemand', 800000, 0, 'Flugzeugshop', 'Autohaus6', 'autohaus', '0'),
(119, '-2184.3872070313', '2413.4365234375', '5.15625', 'Niemand', 600000, 0, 'Bootshaus', 'Autohaus7', 'autohaus', '0'),
(120, '2224.7563476563', '1846.4715576172', '10.8203125', 'Niemand', 250000, 0, 'The Clown\'s Pocket Hotel', 'Hotel1', 'hotels', '0'),
(121, '2016.9681396484', '1906.1462402344', '12.333932876587', 'Niemand', 350000, 0, 'The Visage Hotel', 'Hotel2', 'hotels', '0'),
(122, '2123.5739746094', '2380.3686523438', '10.8203125', 'Niemand', 300000, 0, 'The Emerald Isle Hotel', 'Hotel3', 'hotels', '0'),
(123, '2632.4719238281', '2351.5512695313', '10.812772750854', 'Niemand', 325000, 0, 'Julius Thruway East Hotel', 'Hotel4', 'hotels', '0'),
(124, '2196.9697265625', '1681.7357177734', '12.3671875', 'Niemand', 200000, 0, 'Caligula\'s Palace Hotel', 'Hotel5', 'hotels', '0'),
(125, '1305.7553710938', '-1367.9237060547', '13.539849281311', 'Niemand', 450000, 0, 'Market Hotel', 'Hotel6', 'hotels', '0'),
(126, '2177.9216308594', '-1773.8330078125', '13.541919708252', 'Niemand', 350000, 0, 'Idlewood Hotel', 'Hotel7', 'hotels', '0'),
(127, '328.60879516602', '-1510.9382324219', '36.032508850098', 'Niemand', 900000, 0, 'Rodeo Hotel', 'Hotel8', 'hotels', '0'),
(128, '-2426.7282714844', '334.88424682617', '36.9921875', 'Niemand', 1000000, 0, 'Queens Hotel', 'Hotel9', 'hotels', '0'),
(129, '-1668.6645507813', '542.86450195313', '38.633964538574', 'Niemand', 700000, 0, 'Mautstellen', 'Mautstellen', 'mautstellen', '0'),
(130, '1154.7275390625', '-1443.2913818359', '15.796875', 'Niemand', 550000, 0, 'Market Zoohandlung', 'Zoohandlung1', 'zoohandlung', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cluckinbell`
--

CREATE TABLE `cluckinbell` (
  `ID` int NOT NULL,
  `Gericht2215` int NOT NULL,
  `Gericht2215Preis` int NOT NULL,
  `Gericht2216` int NOT NULL,
  `Gericht2216Preis` int NOT NULL,
  `Gericht2217` int NOT NULL,
  `Gericht2217Preis` int NOT NULL,
  `Gericht2353` int NOT NULL,
  `Gericht2353Preis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cluckinbell`
--

INSERT INTO `cluckinbell` (`ID`, `Gericht2215`, `Gericht2215Preis`, `Gericht2216`, `Gericht2216Preis`, `Gericht2217`, `Gericht2217Preis`, `Gericht2353`, `Gericht2353Preis`, `Name`) VALUES
(1, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell1'),
(2, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell2'),
(3, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell3'),
(4, 50, 15, 50, 25, 50, 45, 49, 15, 'Cluckinbell4'),
(5, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell5'),
(6, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell6'),
(7, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell7'),
(8, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell8'),
(9, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell9'),
(10, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell10'),
(11, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell11'),
(12, 50, 15, 50, 25, 50, 45, 50, 15, 'Cluckinbell12');

-- --------------------------------------------------------

--
-- Table structure for table `donutladen`
--

CREATE TABLE `donutladen` (
  `ID` int NOT NULL,
  `Gericht2221` int NOT NULL,
  `Gericht2221Preis` int NOT NULL,
  `Gericht2222` int NOT NULL,
  `Gericht2222Preis` int NOT NULL,
  `Gericht2223` int NOT NULL,
  `Gericht2223Preis` int NOT NULL,
  `Gericht2769` int NOT NULL,
  `Gericht2769Preis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donutladen`
--

INSERT INTO `donutladen` (`ID`, `Gericht2221`, `Gericht2221Preis`, `Gericht2222`, `Gericht2222Preis`, `Gericht2223`, `Gericht2223Preis`, `Gericht2769`, `Gericht2769Preis`, `Name`) VALUES
(1, 50, 15, 50, 25, 50, 45, 50, 15, 'Donutladen1'),
(2, 50, 15, 50, 25, 50, 45, 50, 15, 'Donutladen2'),
(3, 50, 15, 50, 25, 50, 45, 50, 15, 'Donutladen3');

-- --------------------------------------------------------

--
-- Table structure for table `fabrikwars`
--

CREATE TABLE `fabrikwars` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Besitzer` int NOT NULL,
  `Blipx` varchar(50) NOT NULL,
  `Blipy` varchar(50) NOT NULL,
  `Interior` int NOT NULL,
  `Dimension` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fabrikwars`
--

INSERT INTO `fabrikwars` (`ID`, `Spawnx`, `Spawny`, `Spawnz`, `Besitzer`, `Blipx`, `Blipy`, `Interior`, `Dimension`) VALUES
(1, '2543.2336425781', '-1318.9847412109', '1031.421875', 9, '-2095.7846679688', '-2299.0588378906', 2, 1),
(2, '2580.0126953125', '-1285.4128417969', '1044.125', 6, '-61.589290618896', '-1121.8610839844', 2, 1),
(3, '2520.1525878906', '-1281.2653808594', '1054.640625', 9, '2372.0036621094', '2760.150390625', 2, 1),
(4, '958.70465087891', '2098.9301757813', '1011.0242919922', 7, '207.87173461914', '-61.688751220703', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fahrschule`
--

CREATE TABLE `fahrschule` (
  `ID` int NOT NULL,
  `Schein` text NOT NULL,
  `TheorieKosten` int NOT NULL,
  `PraxisKosten` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fahrschule`
--

INSERT INTO `fahrschule` (`ID`, `Schein`, `TheorieKosten`, `PraxisKosten`) VALUES
(1, 'Fuehrerschein', 1500, 2500),
(2, 'Motorradschein', 1750, 2000),
(3, 'Bootschein', 2000, 4250),
(4, 'Traktorschein', 1000, 1250),
(5, 'Helikopterschein', 6500, 9999),
(6, 'FlugscheinA', 8000, 17500),
(7, 'FlugscheinB', 9999, 28500),
(8, 'LKWSchein', 3250, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `firma`
--

CREATE TABLE `firma` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Type` int NOT NULL DEFAULT '0',
  `Geld` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fraktionslager`
--

CREATE TABLE `fraktionslager` (
  `ID` int NOT NULL,
  `Geld` int NOT NULL,
  `Materialien` int NOT NULL,
  `Gras` int NOT NULL,
  `Pakete` int NOT NULL DEFAULT '0',
  `Rang` int NOT NULL DEFAULT '5',
  `Blacklist` text NOT NULL,
  `OnBlacklist` int NOT NULL DEFAULT '0',
  `Schwarzpulver` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fraktionslager`
--

INSERT INTO `fraktionslager` (`ID`, `Geld`, `Materialien`, `Gras`, `Pakete`, `Rang`, `Blacklist`, `OnBlacklist`, `Schwarzpulver`) VALUES
(1, 100000, 2500, 750, 100, 5, '', 0, 0),
(2, 100000, 2500, 750, 100, 5, '', 0, 0),
(3, 100000, 2500, 750, 100, 5, '', 0, 0),
(4, 100000, 2500, 750, 100, 5, '', 0, 0),
(5, 100000, 2500, 750, 100, 5, '', 0, 0),
(6, 100000, 2500, 750, 100, 5, '', 0, 0),
(7, 95000, 2500, 750, 100, 5, '', 0, 0),
(8, 100000, 2500, 750, 100, 5, '', 0, 0),
(9, 100000, 2500, 750, 100, 5, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `friseur`
--

CREATE TABLE `friseur` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `player_face` int NOT NULL DEFAULT '0',
  `player_facePreis` int NOT NULL DEFAULT '0',
  `hairblond` int NOT NULL DEFAULT '0',
  `hairblondPreis` int NOT NULL DEFAULT '0',
  `hairred` int NOT NULL DEFAULT '0',
  `hairredPreis` int NOT NULL DEFAULT '0',
  `hairblue` int NOT NULL DEFAULT '0',
  `hairbluePreis` int NOT NULL DEFAULT '0',
  `hairgreen` int NOT NULL DEFAULT '0',
  `hairgreenPreis` int NOT NULL DEFAULT '0',
  `hairpink` int NOT NULL DEFAULT '0',
  `hairpinkPreis` int NOT NULL DEFAULT '0',
  `bald` int NOT NULL DEFAULT '0',
  `baldPreis` int NOT NULL DEFAULT '0',
  `baldbeard` int NOT NULL DEFAULT '0',
  `baldbeardPreis` int NOT NULL DEFAULT '0',
  `baldtash` int NOT NULL DEFAULT '0',
  `baldtashPreis` int NOT NULL DEFAULT '0',
  `baldgoatee` int NOT NULL DEFAULT '0',
  `baldgoateePreis` int NOT NULL DEFAULT '0',
  `highfade` int NOT NULL DEFAULT '0',
  `highfadePreis` int NOT NULL DEFAULT '0',
  `highafro` int NOT NULL DEFAULT '0',
  `highafroPreis` int NOT NULL DEFAULT '0',
  `wedge` int NOT NULL DEFAULT '0',
  `wedgePreis` int NOT NULL DEFAULT '0',
  `slope` int NOT NULL DEFAULT '0',
  `slopePreis` int NOT NULL DEFAULT '0',
  `jhericurl` int NOT NULL DEFAULT '0',
  `jhericurlPreis` int NOT NULL DEFAULT '0',
  `cornrows` int NOT NULL DEFAULT '0',
  `cornrowsPreis` int NOT NULL DEFAULT '0',
  `cornrowsb` int NOT NULL DEFAULT '0',
  `cornrowsbPreis` int NOT NULL DEFAULT '0',
  `tramline` int NOT NULL DEFAULT '0',
  `tramlinePreis` int NOT NULL DEFAULT '0',
  `groovecut` int NOT NULL DEFAULT '0',
  `groovecutPreis` int NOT NULL DEFAULT '0',
  `mohawk` int NOT NULL DEFAULT '0',
  `mohawkPreis` int NOT NULL DEFAULT '0',
  `mohawkblond` int NOT NULL DEFAULT '0',
  `mohawkblondPreis` int NOT NULL DEFAULT '0',
  `mohawkpink` int NOT NULL DEFAULT '0',
  `mohawkpinkPreis` int NOT NULL DEFAULT '0',
  `mohawkbeard` int NOT NULL DEFAULT '0',
  `mohawkbeardPreis` int NOT NULL DEFAULT '0',
  `afro` int NOT NULL DEFAULT '0',
  `afroPreis` int NOT NULL DEFAULT '0',
  `afrotash` int NOT NULL DEFAULT '0',
  `afrotashPreis` int NOT NULL DEFAULT '0',
  `afrobeard` int NOT NULL DEFAULT '0',
  `afrobeardPreis` int NOT NULL DEFAULT '0',
  `afroblond` int NOT NULL DEFAULT '0',
  `afroblondPreis` int NOT NULL DEFAULT '0',
  `flattop` int NOT NULL DEFAULT '0',
  `flattopPreis` int NOT NULL DEFAULT '0',
  `elvishair` int NOT NULL DEFAULT '0',
  `elvishairPreis` int NOT NULL DEFAULT '0',
  `beard` int NOT NULL DEFAULT '0',
  `beardPreis` int NOT NULL DEFAULT '0',
  `tash` int NOT NULL DEFAULT '0',
  `tashPreis` int NOT NULL DEFAULT '0',
  `goatee` int NOT NULL DEFAULT '0',
  `goateePreis` int NOT NULL DEFAULT '0',
  `afrogoatee` int NOT NULL DEFAULT '0',
  `afrogoateePreis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friseur`
--

INSERT INTO `friseur` (`ID`, `Name`, `player_face`, `player_facePreis`, `hairblond`, `hairblondPreis`, `hairred`, `hairredPreis`, `hairblue`, `hairbluePreis`, `hairgreen`, `hairgreenPreis`, `hairpink`, `hairpinkPreis`, `bald`, `baldPreis`, `baldbeard`, `baldbeardPreis`, `baldtash`, `baldtashPreis`, `baldgoatee`, `baldgoateePreis`, `highfade`, `highfadePreis`, `highafro`, `highafroPreis`, `wedge`, `wedgePreis`, `slope`, `slopePreis`, `jhericurl`, `jhericurlPreis`, `cornrows`, `cornrowsPreis`, `cornrowsb`, `cornrowsbPreis`, `tramline`, `tramlinePreis`, `groovecut`, `groovecutPreis`, `mohawk`, `mohawkPreis`, `mohawkblond`, `mohawkblondPreis`, `mohawkpink`, `mohawkpinkPreis`, `mohawkbeard`, `mohawkbeardPreis`, `afro`, `afroPreis`, `afrotash`, `afrotashPreis`, `afrobeard`, `afrobeardPreis`, `afroblond`, `afroblondPreis`, `flattop`, `flattopPreis`, `elvishair`, `elvishairPreis`, `beard`, `beardPreis`, `tash`, `tashPreis`, `goatee`, `goateePreis`, `afrogoatee`, `afrogoateePreis`) VALUES
(1, 'Friseur1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Friseur2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Friseur3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Friseur4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Friseur5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Friseur6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Friseur7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gangareas`
--

CREATE TABLE `gangareas` (
  `ID` int NOT NULL,
  `x1` varchar(50) NOT NULL,
  `x2` varchar(50) NOT NULL,
  `y1` varchar(50) NOT NULL,
  `y2` varchar(50) NOT NULL,
  `px` varchar(50) NOT NULL,
  `py` varchar(50) NOT NULL,
  `pz` varchar(50) NOT NULL,
  `owner` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gangareas`
--

INSERT INTO `gangareas` (`ID`, `x1`, `x2`, `y1`, `y2`, `px`, `py`, `pz`, `owner`, `name`) VALUES
(1, '-2758.99', '-2573.75', '1310.52', '1528.54', '-2631.68', '1357.41', '6.75', 8, 'Jizzys'),
(2, '-2361.49', '-2269.87', '-183.31', '-80.65', '-2308.15', '-123.21', '34.96', 8, 'Burgershot'),
(3, '-2201.72', '-2096.76', '-280.57', '-80.93', '-2136.24', '-181.63', '34.96', 8, 'Fabrik'),
(4, '-2215.40', '-2025', '-950.06', '-700', '-2115.4033203125', '-893.06', '31.67', 6, 'Universität'),
(5, '-2811.12', '-2634.36', '-413.97', '-261.18', '-2719.86', '-317.43', '7.5', 8, 'Tennisplatz'),
(6, '-2293.56', '-2237.42', '2226.63', '2473.87', '-2261.91', '2317.41', '4.46', 8, 'Bayside'),
(7, '-87.404563903809', '458.44122314453', '2420.3674316406', '2575.6437988281', '414.26818847656', '2528.28906253', '16.25', 8, 'Verdannt Medows'),
(8, '-1494.2794189453', '-1336.6267089844', '1434.4106445313', '1531.5936279297', '-1376.3942871094', '1491.3725585938', '10.8523', 6, 'Schiff SF'),
(9, '2502.08', '2576.66', '2714.93', '2790.27', '2546.65', '2753.65', '11.20', 6, 'Pissgebiet'),
(10, '1858.28', '2010.69', '1473.03', '1691.0', '1908.77', '1518.43', '13.62', 8, 'Piratenschiff'),
(11, '1257.7652587891', '1427.798828125', '2062.8061523438', '2229.0517578125', '1344.46', '2148.45', '10.66', 6, 'Baseballstadion'),
(12, '1861.7659912109', '1977.2683105469', '-1451.246337890', '-1350.5856933594', '1918.3919677734', '-1412.3131103516', '13.5703125', 8, 'Skaterpark'),
(13, '1861.5672607422', '2057.4953613281', '-1255.7144775391', '-1145.5041503906', '1969.9210205078', '-1194.5535888672', '25.707954406738', 8, 'Glen Park'),
(14, '-1127.6281738281', '-971.37567138672', '-759.89605712891', '-581.40881347656', '-1021.0115356445', '-652.28143310547', '32.0078125', 8, 'Fabrik SF'),
(15, '-599.62042236328', '-420.81167602539', '-205.26016235352', '-25.13143157959', '-511.84072875977', '-94.51496887207', '62.45975112915', 8, 'Holzfaeller'),
(16, '110.40467834473', '288.38146972656', '1333.9932861328', '1485.6767578125', '194.4662322998', '1422.1252441406', '10.5859375', 8, 'Raffinerie'),
(17, '1043.0855712891', '1140.2626953125', '-1706.826171875', '-1581.5400390625', '1071.6655273438', '-1619.4034423828', '20.458856582642', 8, 'Verona Center'),
(18, '806.81585693359', '934.36853027344', '-1311.7153320313', '-1156.7526855469', '888.25823974609', '-1218.7213134766', '16.9765625', 8, 'Abstellplatz LS'),
(19, '2776.8513183594', '2895.5866699219', '832.48370361328', '1023.9956054688', '2865.3312988281', '925.23028564453', '10.75', 6, 'Abstellplatz LV'),
(20, '974.55304', '1177.29517', '948.50726', '1166.17798', '1087.21240', '1074.30579', '10.83816', 8, 'College'),
(21, '-1340.56787', '-1261.05640', '2464.59717', '2564.95508', '-1302.33545', '2512.67139', '87.04205', 6, 'Ruine'),
(22, '-462.16015625', '-339.23330688477', ' 2169.0122070313', '2290.5751953125', '-404.68014526367', '2233.251953125', '42.4296875', 8, 'Geisterstadt'),
(23, '-2388.6003417969', '-2254.1889648438', '-1683.5625', '-1549.3215332031', '-2314.7248535156', '-1629.6253662109', '483.70239257813', 6, 'Mount Chilliard'),
(24, '1123.3682861328', '1418.2923583984', '2710.0703125', '2862.6896972656', '1382.8170166016', '2774.8884277344', '10.924999237061', 6, 'Golfplatz'),
(25, '-323.09356689453', '-156.24842834473', '2633.0791015625', '2776.1313476563', '-221.73025512695', '2663.6218261719', '62.6015625', 8, 'Chickendorf'),
(26, '1014.5052490234', '1111.3218994141', '2062.4458007813', '2166.0483398438', '1024.3276367188', '2110.5747070313', '10.8203125', 6, 'Lagerhalle'),
(27, '2339.7387695313', '2498.7626953125', '1777.8739013672', '1965.16015625', '2420.3168945313', '1924.2225341797', '6.015625', 6, 'Baustelle');

-- --------------------------------------------------------

--
-- Table structure for table `gangtags`
--

CREATE TABLE `gangtags` (
  `ID` int NOT NULL,
  `Mx` varchar(50) NOT NULL,
  `My` varchar(50) NOT NULL,
  `Mz` varchar(50) NOT NULL,
  `Ox` varchar(50) NOT NULL,
  `Oy` varchar(50) NOT NULL,
  `Oz` varchar(50) NOT NULL,
  `ORotation` varchar(50) NOT NULL,
  `Besitzer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gangtags`
--

INSERT INTO `gangtags` (`ID`, `Mx`, `My`, `Mz`, `Ox`, `Oy`, `Oz`, `ORotation`, `Besitzer`) VALUES
(1, '-1975.3016357422', '162.80697631836', '26.700899124146', '-1975.333984375', '163.13479614258', '28.092100143433', '0', 'Yakuza'),
(2, '-1948.2534179688', '746.36444091797', '45.663818359375', '-1948.3127441406', '746.68939208984', '46.054798126221', '0', 'Mechaniker'),
(3, '-2158.0993652344', '217.97514343262', '35.3203125', '-2158.1411132813', '218.30039978027', '35.756900787354', '0', 'Yakuza'),
(4, '-2220.7839355469', '578.5830078125', '35.171875', '-2220.8059082031', '578.90167236328', '35.673301696777', '0', 'Mechaniker'),
(5, '-1696.3670654297', '865.42266845703', '24.890625', '-1696.4167480469', '865.74731445313', '25.389999389648', '0', 'Yakuza'),
(6, '-1974.3472900391', '943.38433837891', '45.4453125', '-1974.3602294922', '943.734375', '46.042098999023', '0', 'Mechaniker'),
(7, '-2497.6623535156', '777.96490478516', '35.171875', '-2497.6848144531', '778.28729248047', '35.785301208496', '0', 'Mechaniker'),
(8, '-2574.9079589844', '477.96859741211', '14.609375', '-2574.9401855469', '478.29400634766', '15.121899604797', '0', 'Mechaniker'),
(9, '-2103.7004394531', '-46.635559082031', '35.3203125', '-2103.7434082031', '-46.985599517822', '35.947799682617', '0', 'Yakuza'),
(10, '-2678.7326660156', '-219.97784423828', '4.3359375', '-2678.7885742188', '-220.32809448242', '4.9770998954773', '0', 'NordicAngels');

-- --------------------------------------------------------

--
-- Table structure for table `garagen`
--

CREATE TABLE `garagen` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotz` int NOT NULL,
  `Besitzer` text NOT NULL,
  `Preis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `garagen`
--

INSERT INTO `garagen` (`ID`, `Spawnx`, `Spawny`, `Spawnz`, `Rotz`, `Besitzer`, `Preis`) VALUES
(1, '-2124.1999511719', '449.39999389648', '36.09999847412', 0, 'Niemand', 150000),
(2, '-2124.1999511719', '442', '36.09999847412', 0, 'Niemand', 150000),
(3, '-2124.1999511719', '434.60000610352', '36.09999847412', 0, 'Niemand', 150000),
(4, '-2124.1999511719', '427.20001220703', '36.09999847412', 0, 'Niemand', 150000),
(5, '-1539.9000244141', '657.09997558594', '8.1000003814697', 0, 'Niemand', 150000),
(6, '-1539.9000244141', '649.70001220703', '8.1000003814697', 0, 'Niemand', 150000),
(7, '-1539.9000244141', '642.29998779297', '8.1000003814697', 0, 'Niemand', 150000),
(8, '-1539.9000244141', '634.90002441406', '8.1000003814697', 0, 'Niemand', 150000),
(9, '-2050.6000976563', '16.200000762939', '36.099998474121', 180, 'Niemand', 150000),
(10, '-2382', '-95.5', '36.099998474121', 180, 'Niemand', 150000),
(11, '-2382', '-102.80000305176', '36.099998474121', 180, 'Niemand', 150000),
(12, '-2382', '-110.09999847412', '36.099998474121', 180, 'Niemand', 150000),
(13, '-2382', '-117.40000152588', '36.099998474121', 180, 'Niemand', 150000),
(14, '-2382', '-124.69999694824', '36.099998474121', 180, 'Niemand', 150000),
(15, '-2267.3999023438', '429.20001220703', '36', 180, 'Niemand', 150000),
(16, '-2267.3999023438', '436.5', '36', 180, 'Niemand', 150000),
(17, '-2267.5', '443.79998779297', '36', 180, 'Niemand', 150000),
(18, '-2267.3999023438', '451.10000610352', '36', 180, 'Niemand', 150000),
(19, '-1763.4000244141', '-129.89999389648', '4.4000000953674', 180, 'Niemand', 150000),
(20, '-1763.4000244141', '-137.19999694824', '4.4000000953674', 180, 'Niemand', 150000),
(21, '-1763.4000244141', '-144.5', '4.4000000953674', 180, 'Niemand', 150000),
(22, '-1763.4000244141', '-151.80000305176', '4.4000000953674', 180, 'Niemand', 150000),
(23, '-1763.4000244141', '-159.10000610352', '4.4000000953674', 180, 'Niemand', 150000),
(24, '-2105', '-303.5', '36.299999237061', 270, 'Niemand', 150000),
(25, '-2112.3000488281', '-303.5', '36.299999237061', 270, 'Niemand', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `gartenclub`
--

CREATE TABLE `gartenclub` (
  `ID` int NOT NULL,
  `Apfelsamen` int NOT NULL,
  `ApfelsamenPreis` int NOT NULL,
  `Orangensamen` int NOT NULL,
  `OrangensamenPreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gartenclub`
--

INSERT INTO `gartenclub` (`ID`, `Apfelsamen`, `ApfelsamenPreis`, `Orangensamen`, `OrangensamenPreis`, `Name`) VALUES
(4, 50, 8, 50, 15, 'Gartenclub4'),
(5, 50, 8, 50, 15, 'Gartenclub5'),
(6, 50, 8, 50, 15, 'Gartenclub6');

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Model` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Spawnrotx` varchar(50) NOT NULL,
  `Spawnroty` varchar(50) NOT NULL,
  `Spawnrotz` varchar(50) NOT NULL,
  `Movex` varchar(50) NOT NULL,
  `Movey` varchar(50) NOT NULL,
  `Movez` varchar(50) NOT NULL,
  `Moverotx` varchar(50) NOT NULL,
  `Moveroty` varchar(50) NOT NULL,
  `Moverotz` varchar(50) NOT NULL,
  `Fraktion` int NOT NULL,
  `Unternehmen` int NOT NULL,
  `BarriereMove` varchar(50) NOT NULL,
  `Interior` int NOT NULL DEFAULT '0',
  `Dimension` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`ID`, `Name`, `Model`, `Spawnx`, `Spawny`, `Spawnz`, `Spawnrotx`, `Spawnroty`, `Spawnrotz`, `Movex`, `Movey`, `Movez`, `Moverotx`, `Moveroty`, `Moverotz`, `Fraktion`, `Unternehmen`, `BarriereMove`, `Interior`, `Dimension`) VALUES
(1, 'AztecasGate', 971, '1695', '1945.099609375', '12.39999961853', '0', '0', '90', '1695', '1945.099609375', '4.39999961853', '0', '0', '0', 7, 0, '0', 0, 0),
(2, 'BrigadaGate', 2933, '-1466.6999511719', '2660.8999023438', '56.5', '0', '0', '0', '-1466.6999511719', '2660.8999023438', '52.4', '0', '0', '0', 9, 0, '0', 0, 0),
(3, 'TriadenGate', 2933, '2031.6999511719', '2123.5', '11.5', '0', '0', '0', '2031.6999511719', '2123.5', '7.5', '0', '0', '0', 6, 0, '0', 0, 0),
(4, 'MechanikerGate', 11416, '-2038.9000244141', '178.80000305176', '29.89999961853', '0', '0', '0', '-2040.1999511719', '178.80000305176', '31.89999961853', '0', '90', '0', 0, 1, '-90', 0, 0),
(5, 'SFPDBarriereOben', 968, '-1701.4379882813', '687.69952392578', '24.700000762939', '0', '90', '270', '-1701.4000244141', '687.70001220703', '24.700000762939', '0', '-90', '0', 1, 0, '90', 0, 0),
(6, 'SFPDBarriereUnten', 968, '-1572.2015380859', '658.71899414063', '6.8370003700256', '0', '90', '90', '-1572.1999511719', '658.79998779297', '6.8000001907349', '0', '-90', '0', 1, 0, '90', 0, 0),
(7, 'SFPDGarage', 10184, '-1631.5999755859', '688.20001220703', '8.6999998092651', '0', '0', '90', '-1631.5999755859', '691.20001220703', '10.89999961853', '0', '90', '0', 1, 0, '-90', 0, 0),
(8, 'RescureBarriereLinks', 968, '-2662', '578.7998046875', '14.199999809265', '0', '90', '180', '-2662', '578.7998046875', '14.199999809265', '0', '-90', '0', 0, 3, '90', 0, 0),
(9, 'RescueBarriereRechts', 968, '-2570', '578.599609375', '14.199999809265', '0', '90', '360', '-2570', '578.599609375', '14.199999809265', '0', '-90', '0', 0, 3, '90', 0, 0),
(10, 'TruckerGateRechts', 985, '-485.3203125', '-558.900390625', '26.200000762939', '0', '0', '180', '-477', '-558.900390625', '26.200000762939', '0', '0', '0', 0, 4, '0', 0, 0),
(11, 'TruckerGateLinks', 985, '-493.28125', '-558.900390625', '26.200000762939', '0', '0', '180', '-501.400390625', '-558.900390625', '26.200000762939', '0', '0', '0', 0, 4, '0', 0, 0),
(12, 'SFPDInteriorLinks', 2957, '239.69999694824', '117.19999694824', '1003.5999755859', '0', '0', '90', '239.69999694824', '117.19999694824', '1006.4000244141', '0', '0', '0', 1, 0, '0', 10, 0),
(13, 'SFPDInteriorRechts', 2957, '253.10000610352', '109.59999847412', '1003.5999755859', '0', '0', '90', '253.10000610352', '109.59999847412', '1006.4000244141', '0', '0', '0', 1, 0, '0', 10, 0),
(14, 'YakuzaSF', 988, '-2243.0390625', '643.140625', '49.177501678467', '0', '0', '270', '-2243.0390625', '643.140625', '43.852500915527', '0', '0', '0', 6, 0, '0', 0, 0),
(15, 'LosAztecasSF', 976, '-2491.1494140625', '-132.1640625', '24.631200790405', '0', '0', '90', '-2491.1494140625', '-132.16409301758', '21.256200790405', '0', '0', '0', 7, 0, '0', 0, 0),
(16, 'DillimoreDevilsSF', 976, '-2177.63671875', '43.8720703125', '34.320301055908', '0', '0', '90', '-2177.63671875', '43.8720703125', '31.0142993927', '0', '0', '0', 8, 0, '0', 0, 0),
(17, 'MafiaSF', 969, '-2218.697265625', '-80.439453125', '34.320301055908', '0', '0', '0', '-2218.697265625', '-80.439453125', '30.946300506592', '0', '0', '0', 9, 0, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `graffitis`
--

CREATE TABLE `graffitis` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Object1` int NOT NULL DEFAULT '0',
  `Object2` int NOT NULL DEFAULT '0',
  `Object3` int NOT NULL DEFAULT '0',
  `Object4` int NOT NULL DEFAULT '0',
  `Object5` int NOT NULL DEFAULT '0',
  `Object6` int NOT NULL DEFAULT '0',
  `Object7` int NOT NULL DEFAULT '0',
  `Object8` int NOT NULL DEFAULT '0',
  `Object9` int NOT NULL DEFAULT '0',
  `Object10` int NOT NULL DEFAULT '0',
  `Object11` int NOT NULL DEFAULT '0',
  `Object12` int NOT NULL DEFAULT '0',
  `Object13` int NOT NULL DEFAULT '0',
  `Object14` int NOT NULL DEFAULT '0',
  `Object15` int NOT NULL DEFAULT '0',
  `Object16` int NOT NULL DEFAULT '0',
  `Object17` int NOT NULL DEFAULT '0',
  `Object18` int NOT NULL DEFAULT '0',
  `Object19` int NOT NULL DEFAULT '0',
  `Object20` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `haustiere`
--

CREATE TABLE `haustiere` (
  `ID` int NOT NULL,
  `Besitzer` text NOT NULL,
  `Name` text NOT NULL,
  `Laune` int NOT NULL DEFAULT '100',
  `Gesundheit` int NOT NULL DEFAULT '100',
  `Hunger` int NOT NULL DEFAULT '100',
  `Durst` int NOT NULL DEFAULT '100',
  `Model` int NOT NULL,
  `Platziert` int NOT NULL DEFAULT '0',
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Spawnrotz` varchar(50) NOT NULL,
  `Level` int NOT NULL DEFAULT '0',
  `Erfahrungspunkte` int NOT NULL DEFAULT '0',
  `LauneTime` varchar(50) NOT NULL DEFAULT '0',
  `HungerTime` varchar(50) NOT NULL DEFAULT '0',
  `DurstTime` varchar(50) NOT NULL DEFAULT '0',
  `Wettbewerb` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `ID` int NOT NULL,
  `Mieter` text NOT NULL,
  `MietePreis` int NOT NULL,
  `MieterAnzahl` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`ID`, `Mieter`, `MietePreis`, `MieterAnzahl`, `Name`) VALUES
(1, '', 150, 0, 'Hotel1'),
(2, '', 150, 0, 'Hotel2'),
(3, '', 150, 0, 'Hotel3'),
(4, '', 150, 0, 'Hotel4'),
(5, '', 150, 0, 'Hotel5'),
(6, '', 150, 0, 'Hotel6'),
(7, '', 150, 0, 'Hotel7'),
(8, '', 150, 0, 'Hotel8'),
(9, '', 150, 0, 'Hotel9');

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int NOT NULL,
  `Besitzer` text NOT NULL,
  `Preis` int NOT NULL,
  `Level` int NOT NULL DEFAULT '1',
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Interior` int NOT NULL,
  `Mieter` text NOT NULL,
  `Abgeschlossen` text NOT NULL,
  `MieterAnzahl` int NOT NULL DEFAULT '0',
  `Mietpreis` int NOT NULL DEFAULT '0',
  `Text` text NOT NULL,
  `Hauskasse` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`ID`, `Besitzer`, `Preis`, `Level`, `Spawnx`, `Spawny`, `Spawnz`, `Interior`, `Mieter`, `Abgeschlossen`, `MieterAnzahl`, `Mietpreis`, `Text`, `Hauskasse`) VALUES
(1, 'Niemand', 75000, 1, '-258.24609375', '1168.8525390625', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(2, 'Niemand', 75000, 1, '-258.24609375', '1151.0712890625', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(3, 'Niemand', 75000, 1, '-260.240234375', '1120.0146484375', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(4, 'Niemand', 75000, 1, '-290.8466796875', '1176.732421875', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(5, 'Niemand', 75000, 1, '-324.373046875', '1165.6669921875', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(6, 'Niemand', 125000, 1, '-369.8203125', '1169.498046875', '20.27187538147', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(7, 'Niemand', 75000, 1, '-360.8447265625', '1141.7470703125', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(8, 'Niemand', 75000, 1, '-362.8388671875', '1110.7275390625', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(9, 'Niemand', 75000, 1, '-328.2470703125', '1118.9033203125', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(10, 'Niemand', 75000, 1, '-298.236328125', '1115.6669921875', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(11, 'Niemand', 75000, 1, '-258.8603515625', '1083.068359375', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(12, 'Niemand', 75000, 1, '-258.2490234375', '1043.837890625', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(13, 'Niemand', 75000, 1, '-278.892578125', '1003.068359375', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(14, 'Niemand', 75000, 1, '-247.84375', '1001.0751953125', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(15, 'Niemand', 175000, 1, '-207.8798828125', '1119.1806640625', '20.4296875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(16, 'Niemand', 75000, 1, '-35.9619140625', '1115.666015625', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(17, 'Niemand', 75000, 1, '-18.3076171875', '1115.6669921875', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(18, 'Niemand', 75000, 1, '-45.068359375', '1081.076171875', '20.939863204956', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(19, 'Niemand', 75000, 1, '-32.224609375', '1038.673828125', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(20, 'Niemand', 75000, 1, '1.751953125', '1076.0380859375', '20.939865112305', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(21, 'Niemand', 75000, 1, '12.77734375', '1113.6708984375', '20.939867019653', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(22, 'Niemand', 250000, 1, '-311.29296875', '1303.5107421875', '53.664344787598', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(23, 'Niemand', 350000, 1, '-255.1484375', '2603.22265625', '62.858154296875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(24, 'Niemand', 50000, 1, '-2358.8935546875', '1118.0751953125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(25, 'Niemand', 50000, 1, '-2369.44921875', '1122.3427734375', '55.733276367188', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(26, 'Niemand', 50000, 1, '-2383.837890625', '1128.1611328125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(27, 'Niemand', 50000, 1, '-2396.5087890625', '1132.7021484375', '55.733276367188', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(28, 'Niemand', 50000, 1, '-2406.9658203125', '1135.87109375', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(29, 'Niemand', 50000, 1, '-2413.5615234375', '1137.4892578125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(30, 'Niemand', 50000, 1, '-2423.998046875', '1139.4375', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(31, 'Niemand', 50000, 1, '-2438.3232421875', '1141.0166015625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(32, 'Niemand', 50000, 1, '-2451.1796875', '1141.7626953125', '55.733276367188', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(33, 'Niemand', 50000, 1, '-2461.646484375', '1141.9033203125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(34, 'Niemand', 50000, 1, '-2468.423828125', '1141.8935546875', '55.733268737793', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(35, 'Niemand', 50000, 1, '-2478.8310546875', '1141.9873046875', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(36, 'Niemand', 50000, 1, '-2493.3349609375', '1141.9765625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(37, 'Niemand', 50000, 1, '-2506.3349609375', '1142.15625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(38, 'Niemand', 50000, 1, '-2517.02734375', '1142.419921875', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(39, 'Niemand', 50000, 1, '-2523.826171875', '1142.69140625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(40, 'Niemand', 50000, 1, '-2534.435546875', '1143.767578125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(41, 'Niemand', 50000, 1, '-2549.11328125', '1145.734375', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(42, 'Niemand', 50000, 1, '-2563.0732421875', '1149.1025390625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '\n', 0),
(43, 'Niemand', 50000, 1, '-2402.416015625', '930.669921875', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(44, 'Niemand', 50000, 1, '-2413.064453125', '895.228515625', '45.466789245605', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(45, 'Niemand', 50000, 1, '-2412.986328125', '921.431640625', '45.469024658203', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(46, 'Niemand', 50000, 1, '-2431.3720703125', '921.4267578125', '50.578125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(47, 'Niemand', 50000, 1, '-2431.33203125', '895.234375', '50.545932769775', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(48, 'Niemand', 50000, 1, '-2449.8779296875', '895.234375', '58.146591186523', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(49, 'Niemand', 50000, 1, '-2449.8310546875', '921.4208984375', '58.144584655762', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(50, 'Niemand', 50000, 1, '-2471.806640625', '895.234375', '63.168376922607', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(51, 'Niemand', 50000, 1, '-2471.84375', '921.4248046875', '63.165908813477', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(52, 'Niemand', 50000, 1, '-2502.9599609375', '921.3798828125', '65.241333007813', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(53, 'Niemand', 50000, 1, '-2502.8544921875', '895.234375', '65.259613037109', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(54, 'Niemand', 50000, 1, '-2541.6083984375', '896.640625', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(55, 'Niemand', 50000, 1, '-2555.95703125', '896.638671875', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(56, 'Niemand', 50000, 1, '-2566.5068359375', '896.6396484375', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(57, 'Niemand', 50000, 1, '-2573.2822265625', '896.2548828125', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(58, 'Niemand', 50000, 1, '-2583.861328125', '896.2548828125', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(59, 'Niemand', 50000, 1, '-2580.90234375', '920.380859375', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(60, 'Niemand', 50000, 1, '-2569.998046875', '920.376953125', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(61, 'Niemand', 50000, 1, '-2562.361328125', '920.3798828125', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(62, 'Niemand', 50000, 1, '-2551.84765625', '920.3798828125', '64.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(63, 'Niemand', 50000, 1, '-2545.3173828125', '920.34375', '64.9765625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(64, 'Niemand', 50000, 1, '-2543.576171875', '922.2255859375', '67.09375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(65, 'Niemand', 50000, 1, '-2537.140625', '929.4892578125', '65.013061523438', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(66, 'Niemand', 50000, 1, '-2542.5009765625', '942.6943359375', '64', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(67, 'Niemand', 50000, 1, '-2542.5048828125', '951.2080078125', '65.505256652832', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(68, 'Niemand', 50000, 1, '-2542.5048828125', '967.6376953125', '73.536285400391', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(69, 'Niemand', 50000, 1, '-2541.66015625', '975.7099609375', '77.251663208008', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(70, 'Niemand', 50000, 1, '-2541.6611328125', '987.9365234375', '78.2890625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(71, 'Niemand', 50000, 1, '-2511.7392578125', '975.6181640625', '77.223991394043', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(72, 'Niemand', 50000, 1, '-2510.89453125', '967.5537109375', '73.530822753906', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(73, 'Niemand', 50000, 1, '-2510.8974609375', '951.189453125', '65.610160827637', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(74, 'Niemand', 50000, 1, '-2510.89453125', '942.7451171875', '65.2890625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(75, 'Niemand', 50000, 1, '-2511.7666015625', '987.8681640625', '78.34375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(76, 'Niemand', 50000, 1, '-2511.765625', '992.39453125', '78.335723876953', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(77, 'Niemand', 50000, 1, '-2511.767578125', '1000.556640625', '78.34375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(78, 'Niemand', 50000, 1, '-2511.767578125', '1008.7919921875', '78.34375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(79, 'Niemand', 50000, 1, '-2511.7626953125', '1020.953125', '77.213088989258', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(80, 'Niemand', 50000, 1, '-2510.921875', '1029.0986328125', '73.573165893555', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(81, 'Niemand', 50000, 1, '-2511.7119140625', '1045.40234375', '65.5078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(82, 'Niemand', 50000, 1, '-2510.919921875', '1053.94140625', '65.186050415039', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(83, 'Niemand', 50000, 1, '-2553.69140625', '992.25390625', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(84, 'Niemand', 50000, 1, '-2564.283203125', '992.2548828125', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(85, 'Niemand', 50000, 1, '-2573.6650390625', '992.255859375', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(86, 'Niemand', 50000, 1, '-2584.1494140625', '992.251953125', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(87, 'Niemand', 50000, 1, '-2596.6474609375', '986.326171875', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(88, 'Niemand', 50000, 1, '-2597.3251953125', '979.7724609375', '78.2734375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(89, 'Niemand', 50000, 1, '-2597.328125', '968.86328125', '78.284324645996', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(90, 'Niemand', 50000, 1, '-2591.1689453125', '960.763671875', '78.453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(91, 'Niemand', 50000, 1, '-2591.16796875', '944.345703125', '70.4296875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(92, 'Niemand', 50000, 1, '-2591.1708984375', '935.9541015625', '68.9296875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(93, 'Niemand', 50000, 1, '-2591.1708984375', '927.9326171875', '65.015625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(94, 'Niemand', 50000, 1, '-2593.2060546875', '883.1552734375', '63.25', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(95, 'Niemand', 50000, 1, '-2593.4169921875', '874.751953125', '58.921875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(96, 'Niemand', 50000, 1, '-2592.7373046875', '855.0712890625', '53.594215393066', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(97, 'Niemand', 50000, 1, '-2593.73046875', '845.236328125', '50.60245513916', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(98, 'Niemand', 50000, 1, '-2592.751953125', '832.8193359375', '52.09375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(99, 'Niemand', 50000, 1, '-2594.6904296875', '830.9990234375', '49.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(100, 'Niemand', 50000, 1, '-2590.90234375', '819.798828125', '49.991027832031', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(101, 'Niemand', 50000, 1, '-2576.5419921875', '819.7998046875', '49.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(102, 'Niemand', 50000, 1, '-2565.9189453125', '819.7998046875', '49.991027832031', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(103, 'Niemand', 50000, 1, '-2559.3056640625', '819.7998046875', '49.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(104, 'Niemand', 50000, 1, '-2548.6630859375', '819.7978515625', '49.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(105, 'Niemand', 50000, 1, '-2538.728515625', '830.056640625', '49.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(106, 'Niemand', 50000, 1, '-2540.666015625', '831.9482421875', '52.09375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(107, 'Niemand', 50000, 1, '-2539.7177734375', '845.2783203125', '50.597099304199', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(108, 'Niemand', 50000, 1, '-2540.685546875', '855.15234375', '53.1796875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(109, 'Niemand', 50000, 1, '-2540.0009765625', '874.767578125', '58.921875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(110, 'Niemand', 50000, 1, '-2540.21484375', '883.123046875', '63.25', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(111, 'Niemand', 50000, 1, '-2513.5068359375', '885.74609375', '62.778045654297', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(112, 'Niemand', 50000, 1, '-2513.5048828125', '867.4716796875', '57.7421875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(113, 'Niemand', 50000, 1, '-2513.5048828125', '849.1171875', '52.6953125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(114, 'Niemand', 50000, 1, '-2513.5048828125', '830.802734375', '49.998817443848', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(115, 'Niemand', 50000, 1, '-2504.560546875', '821.306640625', '45.987239837646', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(116, 'Niemand', 50000, 1, '-2487.3623046875', '821.306640625', '38.38484954834', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(117, 'Niemand', 50000, 1, '-2447.4853515625', '821.6171875', '35.1796875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(118, 'Niemand', 50000, 1, '-2408.98828125', '819.97265625', '35.1796875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(119, 'Niemand', 50000, 1, '-2402.4169921875', '829.2626953125', '36.868618011475', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(120, 'Niemand', 50000, 1, '-2372.5595703125', '834.326171875', '37.977504730225', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(121, 'Niemand', 50000, 1, '-2369.8818359375', '847.025390625', '43.7890625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(122, 'Niemand', 50000, 1, '-2402.4140625', '849.162109375', '40.59375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(123, 'Niemand', 50000, 1, '-2402.4169921875', '869.1201171875', '44.203125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(124, 'Niemand', 50000, 1, '-2372.5615234375', '872.0009765625', '44.509208679199', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(125, 'Niemand', 50000, 1, '-2402.4169921875', '886.107421875', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(126, 'Niemand', 50000, 1, '-2372.5263671875', '783.9501953125', '35.115287780762', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(127, 'Niemand', 50000, 1, '-2368.8173828125', '763.5263671875', '35.151756286621', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(128, 'Niemand', 50000, 1, '-2368.8193359375', '740.60546875', '35.151649475098', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(129, 'Niemand', 50000, 1, '-2368.8203125', '711.6943359375', '35.17317199707', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(130, 'Niemand', 50000, 1, '-2372.525390625', '692.7509765625', '35.1640625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(131, 'Niemand', 50000, 1, '-2358.4775390625', '679.9619140625', '35.1640625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(132, 'Niemand', 50000, 1, '-2358.6123046875', '656.7353515625', '35.171875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(133, 'Niemand', 50000, 1, '-2340.109375', '656.7392578125', '38.388259887695', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(134, 'Niemand', 50000, 1, '-2340.033203125', '679.9619140625', '38.388786315918', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(135, 'Niemand', 50000, 1, '-2321.7421875', '656.7373046875', '41.979385375977', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(136, 'Niemand', 50000, 1, '-2321.66796875', '679.9609375', '41.977882385254', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(137, 'Niemand', 50000, 1, '-2303.404296875', '679.9619140625', '45.345607757568', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(138, 'Niemand', 50000, 1, '-2303.412109375', '656.7353515625', '45.332092285156', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(139, 'Niemand', 50000, 1, '-2278.8037109375', '747.8759765625', '49.439266204834', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(140, 'Niemand', 50000, 1, '-2278.83203125', '767.87109375', '49.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(141, 'Niemand', 50000, 1, '-2278.8330078125', '787.8232421875', '49.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(142, 'Niemand', 50000, 1, '-2286.5595703125', '796.7607421875', '49.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(143, 'Niemand', 50000, 1, '-2303.412109375', '796.7998046875', '48.689014434814', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(144, 'Niemand', 50000, 1, '-2321.7890625', '796.7744140625', '45.34395980835', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(145, 'Niemand', 50000, 1, '-2340.09375', '796.7685546875', '41.988922119141', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(146, 'Niemand', 50000, 1, '-2358.5439453125', '796.7568359375', '38.346096038818', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(147, 'Niemand', 50000, 1, '-2358.33984375', '820.0361328125', '38.536743164063', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(148, 'Niemand', 50000, 1, '-2340.029296875', '820.0361328125', '41.98295211792', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(149, 'Niemand', 50000, 1, '-2321.697265625', '820.0048828125', '45.34045791626', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(150, 'Niemand', 50000, 1, '-2303.4619140625', '820.0361328125', '48.700378417969', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(151, 'Niemand', 50000, 1, '-2285.296875', '829.3095703125', '57.170230865479', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(152, 'Niemand', 50000, 1, '-2285.037109375', '849.65625', '65.4140625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(153, 'Niemand', 50000, 1, '-2282.333984375', '873.1044921875', '66.911026000977', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(154, 'Niemand', 50000, 1, '-2240.544921875', '786.0302734375', '49.377296447754', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(155, 'Niemand', 50000, 1, '-2240.5166015625', '753.4228515625', '49.376831054688', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(156, 'Niemand', 50000, 1, '-2223.8349609375', '795.705078125', '49.434280395508', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(157, 'Niemand', 50000, 1, '-2205.44140625', '795.7724609375', '50.476524353027', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(158, 'Niemand', 50000, 1, '-2187.037109375', '795.7265625', '57.553619384766', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(159, 'Niemand', 50000, 1, '-2168.75', '795.703125', '64.976791381836', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(160, 'Niemand', 50000, 1, '-2168.6611328125', '821.0556640625', '64.965789794922', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(161, 'Niemand', 50000, 1, '-2187.005859375', '821.068359375', '57.546211242676', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(162, 'Niemand', 50000, 1, '-2205.4052734375', '821.0654296875', '50.480072021484', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(163, 'Niemand', 50000, 1, '-2223.55859375', '821.134765625', '49.43864440918', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(164, 'Niemand', 50000, 1, '-2233.29296875', '830.6328125', '54.3046875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(165, 'Niemand', 50000, 1, '-2233.2705078125', '849.0078125', '61.890625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(166, 'Niemand', 50000, 1, '-2233.8671875', '870.431640625', '66.640975952148', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(167, 'Niemand', 50000, 1, '-2233.8505859375', '888.740234375', '66.652503967285', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(168, 'Niemand', 50000, 1, '-2282.4697265625', '916.6650390625', '66.6484375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(169, 'Niemand', 50000, 1, '-2224.8876953125', '902.7041015625', '66.6484375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(170, 'Niemand', 50000, 1, '-2210.95703125', '902.7353515625', '68.964881896973', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(171, 'Niemand', 50000, 1, '-2192.560546875', '902.7177734375', '75.01522064209', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(172, 'Niemand', 50000, 1, '-2174.267578125', '902.734375', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(173, 'Niemand', 50000, 1, '-2174.3291015625', '934.33203125', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(174, 'Niemand', 50000, 1, '-2192.6201171875', '934.3388671875', '74.99210357666', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(175, 'Niemand', 50000, 1, '-2210.9443359375', '934.306640625', '68.967300415039', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(176, 'Niemand', 50000, 1, '-2229.1943359375', '934.3837890625', '66.6484375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(177, 'Niemand', 50000, 1, '-2238.861328125', '943.8076171875', '66.652183532715', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(178, 'Niemand', 50000, 1, '-2238.857421875', '962.14453125', '66.652183532715', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(179, 'Niemand', 50000, 1, '-2238.794921875', '980.4765625', '71.404541015625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(180, 'Niemand', 50000, 1, '-2238.861328125', '998.8349609375', '78.995994567871', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(181, 'Niemand', 50000, 1, '-2282.4140625', '979.353515625', '70.87419128418', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(182, 'Niemand', 50000, 1, '-2294.9697265625', '969.9462890625', '65.328552246094', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(183, 'Niemand', 50000, 1, '-2307.5146484375', '944.3330078125', '61.599796295166', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(184, 'Niemand', 50000, 1, '-2325.98046875', '944.255859375', '55.320888519287', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(185, 'Niemand', 50000, 1, '-2282.4169921875', '999.4990234375', '79.251991271973', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(186, 'Niemand', 50000, 1, '-2282.35546875', '1023.0751953125', '84.107353210449', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(187, 'Niemand', 50000, 1, '-2282.3701171875', '1046.70703125', '84.116424560547', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(188, 'Niemand', 50000, 1, '-2282.3662109375', '1070.2578125', '81.698440551758', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(189, 'Arcane', 50000, 1, '-2282.3994140625', '1088.9189453125', '80.402938842773', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(190, 'Niemand', 50000, 1, '-2280.7470703125', '1112.572265625', '76.984375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(191, 'Niemand', 50000, 1, '-2280.7802734375', '1130.9970703125', '69.2265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(192, 'Niemand', 50000, 1, '-2280.8408203125', '1149.32421875', '61.609375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(193, 'Niemand', 50000, 1, '-2238.369140625', '1154.2236328125', '59.687602996826', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(194, 'Niemand', 50000, 1, '-2238.3369140625', '1135.884765625', '67.259056091309', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(195, 'Niemand', 50000, 1, '-2238.41796875', '1117.59375', '74.812683105469', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(196, 'Niemand', 50000, 1, '-2239.7939453125', '1070.6572265625', '81.026138305664', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(197, 'Niemand', 50000, 1, '-2239.744140625', '1054.158203125', '82.844909667969', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(198, 'Niemand', 50000, 1, '-2239.740234375', '1037.625', '83.849937438965', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(199, 'Niemand', 50000, 1, '-2230.5458984375', '1027.9912109375', '83.84375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(200, 'Niemand', 50000, 1, '-2220.98828125', '1051.197265625', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(201, 'Niemand', 50000, 1, '-2211.908203125', '1057.6416015625', '80.013061523438', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(202, 'Niemand', 50000, 1, '-2173.591796875', '992.9580078125', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(203, 'Niemand', 50000, 1, '-2173.5771484375', '974.3173828125', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(204, 'Niemand', 50000, 1, '-2182.92578125', '956.65234375', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(205, 'Niemand', 50000, 1, '-2218.15234375', '956.6103515625', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(206, 'Niemand', 50000, 1, '-2225.9306640625', '980.560546875', '82.1953125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(207, 'Niemand', 50000, 1, '-2225.890625', '1001.5146484375', '83.84375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(208, 'Niemand', 50000, 1, '-2169.642578125', '1027.953125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(209, 'Niemand', 50000, 1, '-2160.087890625', '1002.12109375', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(210, 'Niemand', 50000, 1, '-2160.1533203125', '983.841796875', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(211, 'Niemand', 50000, 1, '-2160.1435546875', '965.4375', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(212, 'Niemand', 50000, 1, '-2160.0810546875', '947.17578125', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(213, 'Niemand', 50000, 1, '-2129.6279296875', '942.56640625', '80', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(214, 'Niemand', 50000, 1, '-2126.4736328125', '978.5517578125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(215, 'Niemand', 50000, 1, '-2126.431640625', '996.2138671875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(216, 'Niemand', 50000, 1, '-2126.4814453125', '1014.236328125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(217, 'Niemand', 50000, 1, '-2126.4619140625', '1032.51953125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(218, 'Niemand', 50000, 1, '-2126.44921875', '1050.88671875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(219, 'Niemand', 50000, 1, '-2126.46484375', '1069.2724609375', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(220, 'Niemand', 50000, 1, '-2126.484375', '1087.4169921875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(221, 'Niemand', 50000, 1, '-2160.1259765625', '1030.6640625', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(222, 'Niemand', 50000, 1, '-2160.154296875', '1048.689453125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(223, 'Niemand', 50000, 1, '-2160.142578125', '1067.0556640625', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(224, 'Niemand', 50000, 1, '-2172.958984375', '1080.0634765625', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(225, 'Niemand', 50000, 1, '-2191.373046875', '1079.9912109375', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(226, 'Niemand', 50000, 1, '-2209.63671875', '1080.01171875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(227, 'Niemand', 50000, 1, '-2228.0302734375', '1079.9892578125', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(228, 'Niemand', 50000, 1, '-2227.927734375', '1107.9794921875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(229, 'Niemand', 50000, 1, '-2208.0771484375', '1107.982421875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(230, 'Niemand', 50000, 1, '-2188.2978515625', '1108.044921875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(231, 'Niemand', 50000, 1, '-2168.2685546875', '1107.998046875', '80.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(232, 'Niemand', 50000, 1, '-2158.27734375', '1117.5546875', '74.481605529785', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(233, 'Niemand', 50000, 1, '-2158.28125', '1148.7685546875', '61.836837768555', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(234, 'Niemand', 50000, 1, '-2140.05078125', '1190.349609375', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(235, 'Niemand', 50000, 1, '-2172.7197265625', '1163.78515625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(236, 'Niemand', 50000, 1, '-2189.3408203125', '1163.7587890625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(237, 'Niemand', 50000, 1, '-2205.7099609375', '1163.7900390625', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(238, 'Niemand', 50000, 1, '-2222.2333984375', '1163.8125', '55.7265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(239, 'Niemand', 50000, 1, '-2102.521484375', '1159.8271484375', '53.265625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(240, 'Niemand', 50000, 1, '-2084.26171875', '1159.8291015625', '49.953125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(241, 'Niemand', 50000, 1, '-2065.8984375', '1159.8447265625', '46.6484375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(242, 'Niemand', 50000, 1, '-2054.1494140625', '1194.09375', '45.457260131836', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(243, 'Niemand', 50000, 1, '-2018.6630859375', '1194.1064453125', '45.457286834717', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(244, 'Niemand', 50000, 1, '-2036.6484375', '1197.6513671875', '46.234375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(245, 'Niemand', 50000, 1, '-1997.521484375', '1190.546875', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(246, 'Niemand', 50000, 1, '-1982.4736328125', '1190.5361328125', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(247, 'Niemand', 50000, 1, '-1955.5986328125', '1190.5458984375', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(248, 'Niemand', 50000, 1, '-1929.84375', '1190.544921875', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(249, 'Niemand', 50000, 1, '-1915.4892578125', '1190.5478515625', '45.452735900879', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(250, 'Niemand', 50000, 1, '-1901.4150390625', '1203.1689453125', '42.377696990967', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(251, 'Niemand', 50000, 1, '-1901.9765625', '1222.69140625', '33.744758605957', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(252, 'Niemand', 50000, 1, '-1901.92578125', '1239.7705078125', '26.130104064941', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(253, 'Niemand', 50000, 1, '-1872.0703125', '1146.7041015625', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(254, 'Niemand', 50000, 1, '-1872.0673828125', '1125.4365234375', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(255, 'Niemand', 50000, 1, '-1860.8798828125', '1115.5224609375', '45.437515258789', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(256, 'Niemand', 50000, 1, '-1842.3876953125', '1115.5234375', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(257, 'Niemand', 50000, 1, '-1821.0400390625', '1117.30078125', '46.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(258, 'Niemand', 50000, 1, '-1776.240234375', '1115.5263671875', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(259, 'Niemand', 50000, 1, '-1732.150390625', '1115.521484375', '45.4453125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(260, 'Niemand', 50000, 1, '-1728.341796875', '1138.92578125', '38.573665618896', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(261, 'Niemand', 50000, 1, '-1728.341796875', '1159.01171875', '30.436103820801', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(262, 'Niemand', 50000, 1, '-1742.7666015625', '1174.0322265625', '25.125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(263, 'Niemand', 50000, 1, '-1760.953125', '1174.0341796875', '25.125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(264, 'Niemand', 50000, 1, '-1780.1015625', '1158.8330078125', '30.444402694702', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(265, 'Niemand', 50000, 1, '-1780.1015625', '1138.8251953125', '38.583599090576', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(268, 'Niemand', 500000, 1, '-2662.00390625', '876.33203125', '79.773796081543', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(269, 'Niemand', 50000, 1, '980.15234375', '-677.244140625', '121.97625732422', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(270, 'Niemand', 150000, 1, '-2706.615234375', '864.4521484375', '70.703125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(271, 'Niemand', 100000, 1, '1258.6005859375', '-785.3125', '92.030181884766', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(272, 'Niemand', 350000, 1, '-2710.708984375', '967.4697265625', '54.4609375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(273, 'Niemand', 150000, 1, '-2657.517578125', '848.615234375', '64.0078125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(274, 'Niemand', 325000, 1, '-2720.86328125', '923.998046875', '67.59375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(275, 'Niemand', 125000, 1, '-2641.1416015625', '935.720703125', '71.953125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(276, 'Niemand', 175000, 1, '-2655.490234375', '985.7841796875', '64.991287231445', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(277, 'Niemand', 50000, 1, '2145.9306640625', '2834.4462890625', '10.8203125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(278, 'Niemand', 1000000, 1, '725.3525390625', '-1276.2353515625', '13.6484375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(280, 'Niemand', 75000, 1, '432.1376953125', '-1253.9287109375', '51.580940246582', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(282, 'Niemand', 100000, 1, '827.841796875', '-857.97265625', '70.330810546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(283, 'Niemand', 165000, 1, '989.830078125', '-828.640625', '95.468574523926', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(284, 'Niemand', 300000, 1, '1094.033203125', '-807.1201171875', '107.41870117188', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(285, 'Niemand', 100000, 1, '1034.8232421875', '-813.1787109375', '101.8515625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(286, 'Niemand', 75000, 1, '1016.8876953125', '-763.3623046875', '112.56301879883', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(287, 'Niemand', 150000, 1, '977.4423828125', '-771.716796875', '112.20262908936', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(288, 'Niemand', 270000, 1, '891.265625', '-783.1220703125', '101.31398773193', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(289, 'Niemand', 75000, 1, '847.9892578125', '-745.5078125', '94.969268798828', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(290, 'Niemand', 90000, 1, '808.251953125', '-759.34765625', '76.531364440918', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(291, 'Niemand', 400000, 1, '1332.2099609375', '-633.4697265625', '109.1349029541', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(292, 'Niemand', 350000, 1, '1442.6484375', '-628.833984375', '95.718566894531', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(293, 'Niemand', 400000, 1, '1496.958984375', '-687.892578125', '95.56330871582', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(294, 'Niemand', 100000, 1, '1527.7744140625', '-772.5361328125', '80.578125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(295, 'Niemand', 100000, 1, '1535.0322265625', '-800.203125', '72.849456787109', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(296, 'Niemand', 100000, 1, '1540.470703125', '-851.36328125', '64.336059570312', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(297, 'Niemand', 90000, 1, '1535.7724609375', '-885.3017578125', '57.657482147217', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(298, 'Niemand', 100000, 1, '1468.62890625', '-906.18359375', '54.8359375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(299, 'Niemand', 100000, 1, '1421.8740234375', '-886.2314453125', '50.686408996582', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(300, 'Niemand', 75000, 1, '1411.1962890625', '-920.8740234375', '38.421875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(301, 'Niemand', 75000, 1, '1440.5849609375', '-926.12890625', '39.647666931152', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(302, 'Niemand', 75000, 1, '1325.9453125', '-1067.6435546875', '31.5546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(303, 'Niemand', 75000, 1, '1326.265625', '-1090.6943359375', '27.9765625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(304, 'Niemand', 75000, 1, '1242.26171875', '-1099.31640625', '27.9765625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(305, 'Niemand', 75000, 1, '1241.9453125', '-1076.466796875', '31.5546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(306, 'Niemand', 75000, 1, '1285.2626953125', '-1090.224609375', '28.2578125', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(307, 'Niemand', 75000, 1, '1285.2587890625', '-1067.19921875', '31.678918838501', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(308, 'Niemand', 20000, 1, '1227.2490234375', '-1017.171875', '32.6015625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(309, 'Niemand', 20000, 1, '1234.73828125', '-1016.181640625', '32.606651306152', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(310, 'Niemand', 75000, 1, '1227.23828125', '-1017.041015625', '36.3359375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(311, 'Niemand', 20000, 1, '1226.4326171875', '-1010.9765625', '32.6015625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(312, 'Niemand', 20000, 1, '1233.91796875', '-1009.9580078125', '32.6015625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(313, 'Niemand', 20000, 1, '1234.724609375', '-1016.103515625', '36.3359375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(314, 'Niemand', 20000, 1, '1233.92578125', '-1010.0126953125', '36.328262329102', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(315, 'Niemand', 20000, 1, '1226.44140625', '-1011.0244140625', '36.328262329102', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(316, 'Niemand', 20000, 1, '1189.009765625', '-1018.0888671875', '32.546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(317, 'Niemand', 20000, 1, '1196.49609375', '-1017.0810546875', '32.546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(318, 'Niemand', 20000, 1, '1188.9990234375', '-1017.9931640625', '36.234375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(319, 'Niemand', 20000, 1, '1196.509765625', '-1017.1953125', '36.234375', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(320, 'Niemand', 20000, 1, '1188.1943359375', '-1011.9013671875', '32.546875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(321, 'Niemand', 20000, 1, '1195.681640625', '-1010.8984375', '32.55313873291', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(322, 'Niemand', 20000, 1, '1195.6787109375', '-1010.8857421875', '36.226699829102', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(323, 'Niemand', 20000, 1, '1188.18359375', '-1011.7900390625', '36.226699829102', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(324, 'Niemand', 125000, 1, '1127.9775390625', '-1021.171875', '34.9921875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(325, 'Niemand', 125000, 1, '1118.1689453125', '-1021.171875', '34.9921875', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(326, 'Niemand', 300000, 1, '1111.525390625', '-976.4462890625', '42.765625', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(327, 'Niemand', 50000, 1, '983.26171875', '-676.1572265625', '121.97625732422', 17, '', 'Abgeschlossen', 0, 0, '', 0),
(328, 'Niemand', 15000, 1, '1570.1259765625', '991.8955078125', '10.671875', 17, '', 'Abgeschlossen', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kinder`
--

CREATE TABLE `kinder` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Besitzer` text NOT NULL,
  `Geschlecht` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logout`
--

CREATE TABLE `logout` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Weapons` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lotto`
--

CREATE TABLE `lotto` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Nr1` int NOT NULL,
  `Nr2` int NOT NULL,
  `Nr3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marktplatz`
--

CREATE TABLE `marktplatz` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Item` text NOT NULL,
  `Menge` int NOT NULL,
  `Preis` int NOT NULL,
  `Type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mautstellen`
--

CREATE TABLE `mautstellen` (
  `ID` int NOT NULL,
  `ZollkostenPreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mautstellen`
--

INSERT INTO `mautstellen` (`ID`, `ZollkostenPreis`, `Name`) VALUES
(1, 65, 'Mautstellen');

-- --------------------------------------------------------

--
-- Table structure for table `moebel`
--

CREATE TABLE `moebel` (
  `ID` int NOT NULL,
  `Model` int NOT NULL,
  `Name` text NOT NULL,
  `Besitzer` text NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotation` int NOT NULL,
  `Interior` int NOT NULL,
  `Dimension` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moebelhaus`
--

CREATE TABLE `moebelhaus` (
  `ID` int NOT NULL,
  `Objekt2289` int NOT NULL,
  `Objekt2289Preis` int NOT NULL,
  `Objekt2288` int NOT NULL,
  `Objekt2288Preis` int NOT NULL,
  `Objekt2287` int NOT NULL,
  `Objekt2287Preis` int NOT NULL,
  `Objekt2286` int NOT NULL,
  `Objekt2286Preis` int NOT NULL,
  `Objekt2285` int NOT NULL,
  `Objekt2285Preis` int NOT NULL,
  `Objekt2282` int NOT NULL,
  `Objekt2282Preis` int NOT NULL,
  `Objekt2281` int NOT NULL,
  `Objekt2281Preis` int NOT NULL,
  `Objekt2280` int NOT NULL,
  `Objekt2280Preis` int NOT NULL,
  `Objekt2279` int NOT NULL,
  `Objekt2279Preis` int NOT NULL,
  `Objekt2278` int NOT NULL,
  `Objekt2278Preis` int NOT NULL,
  `Objekt2277` int NOT NULL,
  `Objekt2277Preis` int NOT NULL,
  `Objekt2276` int NOT NULL,
  `Objekt2276Preis` int NOT NULL,
  `Objekt2275` int NOT NULL,
  `Objekt2275Preis` int NOT NULL,
  `Objekt2274` int NOT NULL,
  `Objekt2274Preis` int NOT NULL,
  `Objekt2273` int NOT NULL,
  `Objekt2273Preis` int NOT NULL,
  `Name` text NOT NULL,
  `Objekt1663` int NOT NULL DEFAULT '0',
  `Objekt1663Preis` int NOT NULL DEFAULT '0',
  `Objekt1704` int NOT NULL DEFAULT '0',
  `Objekt1704Preis` int NOT NULL DEFAULT '0',
  `Objekt1705` int NOT NULL DEFAULT '0',
  `Objekt1705Preis` int NOT NULL DEFAULT '0',
  `Objekt1711` int NOT NULL DEFAULT '0',
  `Objekt1711Preis` int NOT NULL DEFAULT '0',
  `Objekt1714` int NOT NULL DEFAULT '0',
  `Objekt1714Preis` int NOT NULL DEFAULT '0',
  `Objekt1715` int NOT NULL DEFAULT '0',
  `Objekt1715Preis` int NOT NULL DEFAULT '0',
  `Objekt1716` int NOT NULL DEFAULT '0',
  `Objekt1716Preis` int NOT NULL DEFAULT '0',
  `Objekt1720` int NOT NULL DEFAULT '0',
  `Objekt1720Preis` int NOT NULL DEFAULT '0',
  `Objekt1721` int NOT NULL DEFAULT '0',
  `Objekt1721Preis` int NOT NULL DEFAULT '0',
  `Objekt1723` int NOT NULL DEFAULT '0',
  `Objekt1723Preis` int NOT NULL DEFAULT '0',
  `Objekt1726` int NOT NULL DEFAULT '0',
  `Objekt1726Preis` int NOT NULL DEFAULT '0',
  `Objekt1727` int NOT NULL DEFAULT '0',
  `Objekt1727Preis` int NOT NULL DEFAULT '0',
  `Objekt1728` int NOT NULL DEFAULT '0',
  `Objekt1728Preis` int NOT NULL DEFAULT '0',
  `Objekt1729` int NOT NULL DEFAULT '0',
  `Objekt1729Preis` int NOT NULL DEFAULT '0',
  `Objekt1735` int NOT NULL DEFAULT '0',
  `Objekt1735Preis` int NOT NULL DEFAULT '0',
  `Objekt1739` int NOT NULL DEFAULT '0',
  `Objekt1739Preis` int NOT NULL DEFAULT '0',
  `Objekt1805` int NOT NULL DEFAULT '0',
  `Objekt1805Preis` int NOT NULL DEFAULT '0',
  `Objekt1806` int NOT NULL DEFAULT '0',
  `Objekt1806Preis` int NOT NULL DEFAULT '0',
  `Objekt1811` int NOT NULL DEFAULT '0',
  `Objekt1811Preis` int NOT NULL DEFAULT '0',
  `Objekt2079` int NOT NULL DEFAULT '0',
  `Objekt2079Preis` int NOT NULL DEFAULT '0',
  `Objekt2096` int NOT NULL DEFAULT '0',
  `Objekt2096Preis` int NOT NULL DEFAULT '0',
  `Objekt2124` int NOT NULL DEFAULT '0',
  `Objekt2124Preis` int NOT NULL DEFAULT '0',
  `Objekt2125` int NOT NULL DEFAULT '0',
  `Objekt2125Preis` int NOT NULL DEFAULT '0',
  `Objekt2350` int NOT NULL DEFAULT '0',
  `Objekt2350Preis` int NOT NULL DEFAULT '0',
  `Objekt2636` int NOT NULL DEFAULT '0',
  `Objekt2636Preis` int NOT NULL DEFAULT '0',
  `Objekt2776` int NOT NULL DEFAULT '0',
  `Objekt2776Preis` int NOT NULL DEFAULT '0',
  `Objekt1827` int NOT NULL DEFAULT '0',
  `Objekt1827Preis` int NOT NULL DEFAULT '0',
  `Objekt1963` int NOT NULL DEFAULT '0',
  `Objekt1963Preis` int NOT NULL DEFAULT '0',
  `Objekt1998` int NOT NULL DEFAULT '0',
  `Objekt1998Preis` int NOT NULL DEFAULT '0',
  `Objekt1999` int NOT NULL DEFAULT '0',
  `Objekt1999Preis` int NOT NULL DEFAULT '0',
  `Objekt2008` int NOT NULL DEFAULT '0',
  `Objekt2008Preis` int NOT NULL DEFAULT '0',
  `Objekt2009` int NOT NULL DEFAULT '0',
  `Objekt2009Preis` int NOT NULL DEFAULT '0',
  `Objekt2169` int NOT NULL DEFAULT '0',
  `Objekt2169Preis` int NOT NULL DEFAULT '0',
  `Objekt2173` int NOT NULL DEFAULT '0',
  `Objekt2173Preis` int NOT NULL DEFAULT '0',
  `Objekt2180` int NOT NULL DEFAULT '0',
  `Objekt2180Preis` int NOT NULL DEFAULT '0',
  `Objekt2184` int NOT NULL DEFAULT '0',
  `Objekt2184Preis` int NOT NULL DEFAULT '0',
  `Objekt2205` int NOT NULL DEFAULT '0',
  `Objekt2205Preis` int NOT NULL DEFAULT '0',
  `Objekt2206` int NOT NULL DEFAULT '0',
  `Objekt2206Preis` int NOT NULL DEFAULT '0',
  `Objekt2209` int NOT NULL DEFAULT '0',
  `Objekt2209Preis` int NOT NULL DEFAULT '0',
  `Objekt2311` int NOT NULL DEFAULT '0',
  `Objekt2311Preis` int DEFAULT '0',
  `Objekt2313` int NOT NULL DEFAULT '0',
  `Objekt2313Preis` int NOT NULL DEFAULT '0',
  `Objekt2314` int NOT NULL DEFAULT '0',
  `Objekt2314Preis` int NOT NULL DEFAULT '0',
  `Objekt2315` int NOT NULL DEFAULT '0',
  `Objekt2315Preis` int NOT NULL DEFAULT '0',
  `Objekt2321` int NOT NULL DEFAULT '0',
  `Objekt2321Preis` int NOT NULL DEFAULT '0',
  `Objekt2346` int NOT NULL DEFAULT '0',
  `Objekt2346Preis` int NOT NULL DEFAULT '0',
  `Objekt2370` int NOT NULL DEFAULT '0',
  `Objekt2370Preis` int NOT NULL DEFAULT '0',
  `Objekt2607` int NOT NULL DEFAULT '0',
  `Objekt2607Preis` int NOT NULL DEFAULT '0',
  `Objekt2747` int NOT NULL DEFAULT '0',
  `Objekt2747Preis` int NOT NULL DEFAULT '0',
  `Objekt1700` int NOT NULL DEFAULT '0',
  `Objekt1700Preis` int NOT NULL DEFAULT '0',
  `Objekt1701` int NOT NULL DEFAULT '0',
  `Objekt1701Preis` int NOT NULL DEFAULT '0',
  `Objekt1725` int NOT NULL DEFAULT '0',
  `Objekt1725Preis` int NOT NULL DEFAULT '0',
  `Objekt1745` int NOT NULL DEFAULT '0',
  `Objekt1745Preis` int NOT NULL DEFAULT '0',
  `Objekt1771` int NOT NULL DEFAULT '0',
  `Objekt1771Preis` int NOT NULL DEFAULT '0',
  `Objekt1794` int NOT NULL DEFAULT '0',
  `Objekt1794Preis` int NOT NULL DEFAULT '0',
  `Objekt1795` int NOT NULL DEFAULT '0',
  `Objekt1795Preis` int NOT NULL DEFAULT '0',
  `Objekt1796` int NOT NULL DEFAULT '0',
  `Objekt1796Preis` int NOT NULL DEFAULT '0',
  `Objekt1797` int NOT NULL DEFAULT '0',
  `Objekt1797Preis` int NOT NULL DEFAULT '0',
  `Objekt1798` int NOT NULL DEFAULT '0',
  `Objekt1798Preis` int NOT NULL DEFAULT '0',
  `Objekt1799` int NOT NULL DEFAULT '0',
  `Objekt1799Preis` int NOT NULL DEFAULT '0',
  `Objekt1800` int NOT NULL DEFAULT '0',
  `Objekt1800Preis` int NOT NULL DEFAULT '0',
  `Objekt1801` int NOT NULL DEFAULT '0',
  `Objekt1801Preis` int NOT NULL DEFAULT '0',
  `Objekt1802` int NOT NULL DEFAULT '0',
  `Objekt1802Preis` int NOT NULL DEFAULT '0',
  `Objekt1803` int NOT NULL DEFAULT '0',
  `Objekt1803Preis` int NOT NULL DEFAULT '0',
  `Objekt2090` int NOT NULL DEFAULT '0',
  `Objekt2090Preis` int NOT NULL DEFAULT '0',
  `Objekt2299` int NOT NULL DEFAULT '0',
  `Objekt2299Preis` int NOT NULL DEFAULT '0',
  `Objekt2301` int NOT NULL DEFAULT '0',
  `Objekt2301Preis` int NOT NULL DEFAULT '0',
  `Objekt2302` int NOT NULL DEFAULT '0',
  `Objekt2302Preis` int NOT NULL DEFAULT '0',
  `Objekt2566` int NOT NULL DEFAULT '0',
  `Objekt2566Preis` int DEFAULT '0',
  `Objekt2575` int NOT NULL DEFAULT '0',
  `Objekt2575Preis` int NOT NULL DEFAULT '0',
  `Objekt1518` int NOT NULL DEFAULT '0',
  `Objekt1518Preis` int NOT NULL DEFAULT '0',
  `Objekt1717` int NOT NULL DEFAULT '0',
  `Objekt1717Preis` int NOT NULL DEFAULT '0',
  `Objekt1747` int NOT NULL DEFAULT '0',
  `Objekt1747Preis` int NOT NULL DEFAULT '0',
  `Objekt1748` int NOT NULL DEFAULT '0',
  `Objekt1748Preis` int NOT NULL DEFAULT '0',
  `Objekt1749` int NOT NULL DEFAULT '0',
  `Objekt1749Preis` int NOT NULL DEFAULT '0',
  `Objekt1750` int NOT NULL DEFAULT '0',
  `Objekt1750Preis` int NOT NULL DEFAULT '0',
  `Objekt1751` int NOT NULL DEFAULT '0',
  `Objekt1751Preis` int NOT NULL DEFAULT '0',
  `Objekt1752` int NOT NULL DEFAULT '0',
  `Objekt1752Preis` int NOT NULL DEFAULT '0',
  `Objekt1781` int NOT NULL DEFAULT '0',
  `Objekt1781Preis` int NOT NULL DEFAULT '0',
  `Objekt1786` int NOT NULL DEFAULT '0',
  `Objekt1786Preis` int NOT NULL DEFAULT '0',
  `Objekt1792` int NOT NULL DEFAULT '0',
  `Objekt1792Preis` int NOT NULL DEFAULT '0',
  `Objekt2224` int NOT NULL DEFAULT '0',
  `Objekt2224Preis` int NOT NULL DEFAULT '0',
  `Objekt2312` int NOT NULL DEFAULT '0',
  `Objekt2312Preis` int NOT NULL DEFAULT '0',
  `Objekt2316` int NOT NULL DEFAULT '0',
  `Objekt2316Preis` int NOT NULL DEFAULT '0',
  `Objekt2317` int NOT NULL DEFAULT '0',
  `Objekt2317Preis` int NOT NULL DEFAULT '0',
  `Objekt2318` int NOT NULL DEFAULT '0',
  `Objekt2318Preis` int NOT NULL DEFAULT '0',
  `Objekt2320` int NOT NULL DEFAULT '0',
  `Objekt2320Preis` int NOT NULL DEFAULT '0',
  `Objekt2595` int NOT NULL DEFAULT '0',
  `Objekt2595Preis` int DEFAULT '0',
  `Objekt2648` int NOT NULL DEFAULT '0',
  `Objekt2648Preis` int NOT NULL DEFAULT '0',
  `Objekt2147` int NOT NULL DEFAULT '0',
  `Objekt2147Preis` int NOT NULL DEFAULT '0',
  `Objekt2149` int NOT NULL DEFAULT '0',
  `Objekt2149Preis` int NOT NULL DEFAULT '0',
  `Objekt2336` int NOT NULL DEFAULT '0',
  `Objekt2336Preis` int NOT NULL DEFAULT '0',
  `Objekt2337` int NOT NULL DEFAULT '0',
  `Objekt2337Preis` int NOT NULL DEFAULT '0',
  `Objekt2340` int NOT NULL DEFAULT '0',
  `Objekt2340Preis` int NOT NULL DEFAULT '0',
  `Objekt2415` int NOT NULL DEFAULT '0',
  `Objekt2415Preis` int NOT NULL DEFAULT '0',
  `Objekt2417` int NOT NULL DEFAULT '0',
  `Objekt2417Preis` int NOT NULL DEFAULT '0',
  `Objekt2514` int NOT NULL DEFAULT '0',
  `Objekt2514Preis` int NOT NULL DEFAULT '0',
  `Objekt2515` int NOT NULL DEFAULT '0',
  `Objekt2515Preis` int NOT NULL DEFAULT '0',
  `Objekt2516` int NOT NULL DEFAULT '0',
  `Objekt2516Preis` int NOT NULL DEFAULT '0',
  `Objekt2517` int NOT NULL DEFAULT '0',
  `Objekt2517Preis` int NOT NULL DEFAULT '0',
  `Objekt2518` int NOT NULL DEFAULT '0',
  `Objekt2518Preis` int NOT NULL DEFAULT '0',
  `Objekt2520` int NOT NULL DEFAULT '0',
  `Objekt2520Preis` int NOT NULL DEFAULT '0',
  `Objekt2521` int NOT NULL DEFAULT '0',
  `Objekt2521Preis` int NOT NULL DEFAULT '0',
  `Objekt2522` int NOT NULL DEFAULT '0',
  `Objekt2522Preis` int NOT NULL DEFAULT '0',
  `Objekt2523` int NOT NULL DEFAULT '0',
  `Objekt2523Preis` int NOT NULL DEFAULT '0',
  `Objekt2524` int NOT NULL DEFAULT '0',
  `Objekt2524Preis` int NOT NULL DEFAULT '0',
  `Objekt2525` int NOT NULL DEFAULT '0',
  `Objekt2525Preis` int NOT NULL DEFAULT '0',
  `Objekt2526` int NOT NULL DEFAULT '0',
  `Objekt2526Preis` int NOT NULL DEFAULT '0',
  `Objekt2527` int NOT NULL DEFAULT '0',
  `Objekt2527Preis` int NOT NULL DEFAULT '0',
  `Objekt2528` int NOT NULL DEFAULT '0',
  `Objekt2528Preis` int NOT NULL DEFAULT '0',
  `Objekt2738` int NOT NULL DEFAULT '0',
  `Objekt2738Preis` int NOT NULL DEFAULT '0',
  `Objekt1481` int NOT NULL DEFAULT '0',
  `Objekt1481Preis` int NOT NULL DEFAULT '0',
  `Objekt1661` int NOT NULL DEFAULT '0',
  `Objekt1661Preis` int NOT NULL DEFAULT '0',
  `Objekt1718` int NOT NULL DEFAULT '0',
  `Objekt1718Preis` int NOT NULL DEFAULT '0',
  `Objekt1719` int NOT NULL DEFAULT '0',
  `Objekt1719Preis` int NOT NULL DEFAULT '0',
  `Objekt1736` int NOT NULL DEFAULT '0',
  `Objekt1736Preis` int NOT NULL DEFAULT '0',
  `Objekt1738` int NOT NULL DEFAULT '0',
  `Objekt1738Preis` int NOT NULL DEFAULT '0',
  `Objekt1782` int NOT NULL DEFAULT '0',
  `Objekt1782Preis` int NOT NULL DEFAULT '0',
  `Objekt1783` int NOT NULL DEFAULT '0',
  `Objekt1783Preis` int NOT NULL DEFAULT '0',
  `Objekt1785` int NOT NULL DEFAULT '0',
  `Objekt1785Preis` int NOT NULL DEFAULT '0',
  `Objekt1787` int NOT NULL DEFAULT '0',
  `Objekt1787Preis` int NOT NULL DEFAULT '0',
  `Objekt1790` int NOT NULL DEFAULT '0',
  `Objekt1790Preis` int NOT NULL DEFAULT '0',
  `Objekt1808` int NOT NULL DEFAULT '0',
  `Objekt1808Preis` int NOT NULL DEFAULT '0',
  `Objekt1828` int NOT NULL DEFAULT '0',
  `Objekt1828Preis` int NOT NULL DEFAULT '0',
  `Objekt1840` int DEFAULT '0',
  `Objekt1840Preis` int NOT NULL DEFAULT '0',
  `Objekt2099` int NOT NULL DEFAULT '0',
  `Objekt2099Preis` int NOT NULL DEFAULT '0',
  `Objekt2102` int NOT NULL DEFAULT '0',
  `Objekt2102Preis` int NOT NULL DEFAULT '0',
  `Objekt2103` int NOT NULL DEFAULT '0',
  `Objekt2103Preis` int NOT NULL DEFAULT '0',
  `Objekt2186` int NOT NULL DEFAULT '0',
  `Objekt2186Preis` int NOT NULL DEFAULT '0',
  `Objekt2190` int NOT NULL DEFAULT '0',
  `Objekt2190Preis` int NOT NULL DEFAULT '0',
  `Objekt2229` int NOT NULL DEFAULT '0',
  `Objekt2229Preis` int NOT NULL DEFAULT '0',
  `Objekt2230` int NOT NULL DEFAULT '0',
  `Objekt2230Preis` int NOT NULL DEFAULT '0',
  `Objekt2231` int NOT NULL DEFAULT '0',
  `Objekt2231Preis` int NOT NULL DEFAULT '0',
  `Objekt2232` int NOT NULL DEFAULT '0',
  `Objekt2232Preis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moebelhaus`
--

INSERT INTO `moebelhaus` (`ID`, `Objekt2289`, `Objekt2289Preis`, `Objekt2288`, `Objekt2288Preis`, `Objekt2287`, `Objekt2287Preis`, `Objekt2286`, `Objekt2286Preis`, `Objekt2285`, `Objekt2285Preis`, `Objekt2282`, `Objekt2282Preis`, `Objekt2281`, `Objekt2281Preis`, `Objekt2280`, `Objekt2280Preis`, `Objekt2279`, `Objekt2279Preis`, `Objekt2278`, `Objekt2278Preis`, `Objekt2277`, `Objekt2277Preis`, `Objekt2276`, `Objekt2276Preis`, `Objekt2275`, `Objekt2275Preis`, `Objekt2274`, `Objekt2274Preis`, `Objekt2273`, `Objekt2273Preis`, `Name`, `Objekt1663`, `Objekt1663Preis`, `Objekt1704`, `Objekt1704Preis`, `Objekt1705`, `Objekt1705Preis`, `Objekt1711`, `Objekt1711Preis`, `Objekt1714`, `Objekt1714Preis`, `Objekt1715`, `Objekt1715Preis`, `Objekt1716`, `Objekt1716Preis`, `Objekt1720`, `Objekt1720Preis`, `Objekt1721`, `Objekt1721Preis`, `Objekt1723`, `Objekt1723Preis`, `Objekt1726`, `Objekt1726Preis`, `Objekt1727`, `Objekt1727Preis`, `Objekt1728`, `Objekt1728Preis`, `Objekt1729`, `Objekt1729Preis`, `Objekt1735`, `Objekt1735Preis`, `Objekt1739`, `Objekt1739Preis`, `Objekt1805`, `Objekt1805Preis`, `Objekt1806`, `Objekt1806Preis`, `Objekt1811`, `Objekt1811Preis`, `Objekt2079`, `Objekt2079Preis`, `Objekt2096`, `Objekt2096Preis`, `Objekt2124`, `Objekt2124Preis`, `Objekt2125`, `Objekt2125Preis`, `Objekt2350`, `Objekt2350Preis`, `Objekt2636`, `Objekt2636Preis`, `Objekt2776`, `Objekt2776Preis`, `Objekt1827`, `Objekt1827Preis`, `Objekt1963`, `Objekt1963Preis`, `Objekt1998`, `Objekt1998Preis`, `Objekt1999`, `Objekt1999Preis`, `Objekt2008`, `Objekt2008Preis`, `Objekt2009`, `Objekt2009Preis`, `Objekt2169`, `Objekt2169Preis`, `Objekt2173`, `Objekt2173Preis`, `Objekt2180`, `Objekt2180Preis`, `Objekt2184`, `Objekt2184Preis`, `Objekt2205`, `Objekt2205Preis`, `Objekt2206`, `Objekt2206Preis`, `Objekt2209`, `Objekt2209Preis`, `Objekt2311`, `Objekt2311Preis`, `Objekt2313`, `Objekt2313Preis`, `Objekt2314`, `Objekt2314Preis`, `Objekt2315`, `Objekt2315Preis`, `Objekt2321`, `Objekt2321Preis`, `Objekt2346`, `Objekt2346Preis`, `Objekt2370`, `Objekt2370Preis`, `Objekt2607`, `Objekt2607Preis`, `Objekt2747`, `Objekt2747Preis`, `Objekt1700`, `Objekt1700Preis`, `Objekt1701`, `Objekt1701Preis`, `Objekt1725`, `Objekt1725Preis`, `Objekt1745`, `Objekt1745Preis`, `Objekt1771`, `Objekt1771Preis`, `Objekt1794`, `Objekt1794Preis`, `Objekt1795`, `Objekt1795Preis`, `Objekt1796`, `Objekt1796Preis`, `Objekt1797`, `Objekt1797Preis`, `Objekt1798`, `Objekt1798Preis`, `Objekt1799`, `Objekt1799Preis`, `Objekt1800`, `Objekt1800Preis`, `Objekt1801`, `Objekt1801Preis`, `Objekt1802`, `Objekt1802Preis`, `Objekt1803`, `Objekt1803Preis`, `Objekt2090`, `Objekt2090Preis`, `Objekt2299`, `Objekt2299Preis`, `Objekt2301`, `Objekt2301Preis`, `Objekt2302`, `Objekt2302Preis`, `Objekt2566`, `Objekt2566Preis`, `Objekt2575`, `Objekt2575Preis`, `Objekt1518`, `Objekt1518Preis`, `Objekt1717`, `Objekt1717Preis`, `Objekt1747`, `Objekt1747Preis`, `Objekt1748`, `Objekt1748Preis`, `Objekt1749`, `Objekt1749Preis`, `Objekt1750`, `Objekt1750Preis`, `Objekt1751`, `Objekt1751Preis`, `Objekt1752`, `Objekt1752Preis`, `Objekt1781`, `Objekt1781Preis`, `Objekt1786`, `Objekt1786Preis`, `Objekt1792`, `Objekt1792Preis`, `Objekt2224`, `Objekt2224Preis`, `Objekt2312`, `Objekt2312Preis`, `Objekt2316`, `Objekt2316Preis`, `Objekt2317`, `Objekt2317Preis`, `Objekt2318`, `Objekt2318Preis`, `Objekt2320`, `Objekt2320Preis`, `Objekt2595`, `Objekt2595Preis`, `Objekt2648`, `Objekt2648Preis`, `Objekt2147`, `Objekt2147Preis`, `Objekt2149`, `Objekt2149Preis`, `Objekt2336`, `Objekt2336Preis`, `Objekt2337`, `Objekt2337Preis`, `Objekt2340`, `Objekt2340Preis`, `Objekt2415`, `Objekt2415Preis`, `Objekt2417`, `Objekt2417Preis`, `Objekt2514`, `Objekt2514Preis`, `Objekt2515`, `Objekt2515Preis`, `Objekt2516`, `Objekt2516Preis`, `Objekt2517`, `Objekt2517Preis`, `Objekt2518`, `Objekt2518Preis`, `Objekt2520`, `Objekt2520Preis`, `Objekt2521`, `Objekt2521Preis`, `Objekt2522`, `Objekt2522Preis`, `Objekt2523`, `Objekt2523Preis`, `Objekt2524`, `Objekt2524Preis`, `Objekt2525`, `Objekt2525Preis`, `Objekt2526`, `Objekt2526Preis`, `Objekt2527`, `Objekt2527Preis`, `Objekt2528`, `Objekt2528Preis`, `Objekt2738`, `Objekt2738Preis`, `Objekt1481`, `Objekt1481Preis`, `Objekt1661`, `Objekt1661Preis`, `Objekt1718`, `Objekt1718Preis`, `Objekt1719`, `Objekt1719Preis`, `Objekt1736`, `Objekt1736Preis`, `Objekt1738`, `Objekt1738Preis`, `Objekt1782`, `Objekt1782Preis`, `Objekt1783`, `Objekt1783Preis`, `Objekt1785`, `Objekt1785Preis`, `Objekt1787`, `Objekt1787Preis`, `Objekt1790`, `Objekt1790Preis`, `Objekt1808`, `Objekt1808Preis`, `Objekt1828`, `Objekt1828Preis`, `Objekt1840`, `Objekt1840Preis`, `Objekt2099`, `Objekt2099Preis`, `Objekt2102`, `Objekt2102Preis`, `Objekt2103`, `Objekt2103Preis`, `Objekt2186`, `Objekt2186Preis`, `Objekt2190`, `Objekt2190Preis`, `Objekt2229`, `Objekt2229Preis`, `Objekt2230`, `Objekt2230Preis`, `Objekt2231`, `Objekt2231Preis`, `Objekt2232`, `Objekt2232Preis`) VALUES
(1, 50, 15000, 50, 15000, 50, 25000, 50, 30000, 50, 45000, 50, 20000, 50, 15000, 50, 10000, 50, 55000, 50, 45000, 50, 25000, 50, 12500, 50, 10000, 50, 75000, 50, 10000, 'Moebelhaus1', 49, 500, 650, 1500, 50, 650, 50, 900, 49, 1200, 50, 1350, 50, 250, 50, 900, 1500, 2500, 50, 2850, 49, 2900, 50, 900, 50, 3000, 50, 650, 50, 1300, 50, 700, 50, 700, 0, 0, 50, 1000, 50, 1450, 50, 4950, 1200, 2500, 50, 500, 50, 600, 50, 1150, 50, 850, 50, 1000, 50, 400, 50, 1800, 50, 1800, 50, 1800, 50, 1800, 50, 1250, 50, 1250, 50, 1250, 50, 1250, 50, 1250, 75, 2500, 50, 2250, 50, 1350, 50, 1350, 50, 1350, 50, 1350, 50, 1350, 50, 1350, 50, 1350, 50, 2000, 50, 600, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 5000, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 3450, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 1500, 5000, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 1500, 50, 500, 50, 700, 50, 1000, 50, 1250, 50, 1250, 50, 500, 50, 650, 50, 650, 50, 800, 50, 1000, 50, 750, 50, 1000, 50, 950, 50, 950, 50, 1000, 50, 700, 50, 700, 50, 650, 50, 1000, 50, 950, 50, 650, 0, 0, 50, 800, 50, 1000, 50, 500, 50, 500, 50, 8500, 50, 800, 50, 1200, 1200, 1500, 50, 1200, 50, 1200, 50, 1200, 50, 6500, 50, 250, 50, 400, 50, 1250, 50, 1600, 50, 1600, 50, 1400, 50, 3350, 50, 1200, 1200, 1200, 50, 1200, 50, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `moebelinventory`
--

CREATE TABLE `moebelinventory` (
  `ID` int NOT NULL,
  `Besitzer` text NOT NULL,
  `Model` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int NOT NULL,
  `Text` text NOT NULL,
  `Gelesen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nickchanges`
--

CREATE TABLE `nickchanges` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `NeuerName` text NOT NULL,
  `Status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offlinemessages`
--

CREATE TABLE `offlinemessages` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paynspray`
--

CREATE TABLE `paynspray` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Kasse` int NOT NULL,
  `Garage` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paynspray`
--

INSERT INTO `paynspray` (`ID`, `Spawnx`, `Spawny`, `Spawnz`, `Kasse`, `Garage`, `Name`) VALUES
(1, '2063.349609375', '-1831.2890625', '11.252596855164', 0, 8, 'PaynSpray1'),
(2, '487.388671875', '-1741.552734375', '8.837544441223', 0, 12, 'PaynSpray2'),
(3, '1025.044921875', '-1020.9736328125', '32.098804473877', 0, 11, 'PaynSpray3'),
(4, '-1420.5849609375', '2584.3154296875', '55.84326171875', 0, 40, 'PaynSpray4'),
(5, '-100.0478515625', '1117.5234375', '19.74169921875', 0, 41, 'PaynSpray5'),
(6, '-1904.517578125', '285.4404296875', '41.046875', 0, 19, 'PaynSpray6'),
(7, '-2425.642578125', '1021.76953125', '50.397659301758', 0, 27, 'PaynSpray7');

-- --------------------------------------------------------

--
-- Table structure for table `peds`
--

CREATE TABLE `peds` (
  `ID` int NOT NULL,
  `Model` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotz` int NOT NULL,
  `Interior` int NOT NULL,
  `Dimension` int NOT NULL,
  `CircleSize` varchar(11) NOT NULL,
  `Name` text NOT NULL,
  `Event` text NOT NULL,
  `Typ` text NOT NULL,
  `Blip` int NOT NULL DEFAULT '0',
  `Deaktiviert` int NOT NULL DEFAULT '0',
  `KannAusgeraubtWerden` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peds`
--

INSERT INTO `peds` (`ID`, `Model`, `Spawnx`, `Spawny`, `Spawnz`, `Rotz`, `Interior`, `Dimension`, `CircleSize`, `Name`, `Event`, `Typ`, `Blip`, `Deaktiviert`, `KannAusgeraubtWerden`) VALUES
(1, 240, '359.79998779297', '173.5', '1008.4000244141', 270, 3, 1, '2.5', 'Dan\r\nJobcenter', 'Jobcenter.openWindow', 'Client', 0, 0, 0),
(2, 141, '356.39999389648', '168.39999389648', '1008.4000244141', 270, 3, 1, '2.5', 'Lara\r\nStatusverwaltung', 'Status.openWindow', 'Server', 0, 0, 0),
(3, 141, '356.39999389648', '165.60000610352', '1008.4000244141', 270, 3, 1, '2.5', 'Casey\r\nFahrzeugstelle', 'Fahrzeugstelle.openWindow', 'Client', 0, 0, 0),
(4, 141, '356.39999389648', '162.60000610352', '1008.4000244141', 270, 3, 1, '2.5', 'Lilly\r\nPersonalien', 'Personalien.openWindow', 'Client', 0, 0, 0),
(5, 141, '356.39999389648', '178.10000610352', '1008.4000244141', 270, 3, 1, '2.5', 'Larissa\r\nPrivate Firma', 'Firma.openWindow', 'Client', 0, 0, 0),
(6, 141, '356.39999389648', '182', '1008.4000244141', 270, 3, 1, '2.5', 'Vivien\r\nMitarbeiterin', '', '', 0, 0, 0),
(7, 141, '356.39999389648', '185.60000610352', '1008.4000244141', 270, 3, 1, '2.5', 'Luise\r\nMitarbeiterin', '', '', 0, 0, 0),
(8, 280, '238.80000305176', '112.80000305176', '1003.200012207', 270, 10, 0, '2.5', 'Officer Mason\r\nStellen', 'Polizei.stellen', 'Client', 0, 0, 0),
(9, 281, '253.89999389648', '117.40000152588', '1003.200012207', 90, 10, 0, '2.5', 'Officer Jayden\r\nKaution', 'Polizei.kaution', 'Client', 0, 0, 0),
(10, 282, '246.5', '120.59999847412', '1003.299987793', 180, 10, 0, '2.5', 'Officer Donalds\r\nWaffenschein', 'Waffenschein.openWindow', 'Client', 0, 0, 0),
(11, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 1, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(12, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 2, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(13, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 3, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(14, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 4, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(15, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 5, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(16, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 6, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(17, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 7, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(18, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 8, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(19, 312, '296.10000610352', '-40.200000762939', '1001.5', 0, 1, 9, '2.5', 'Toad\r\nMitarbeiter', 'Ammunation.openWindow', 'Client', 0, 0, 1),
(20, 194, '-1994.400390625', '201.400390625', '28.509999084473', 0, 0, 0, '2.5', '', '', '', 0, 0, 0),
(21, 194, '-1622.1999511719', '790.09997558594', '7.9', 0, 0, 0, '2.5', '', '', '', 0, 0, 0),
(22, 70, '-840.5', '2249.8000488281', '201.5', 270, 2, 0, '2.5', 'Dr.House\r\nAids-Behandlungen', 'Krankenhaus.aidsBehandlung', 'Client', 0, 0, 0),
(23, 141, '664.79998779297', '-1210.4000244141', '2084', 0, 1, 0, '2.5', 'Cassie\r\nBibliothekarin', 'Buecherei.getBooks', 'Server', 0, 0, 0),
(24, 276, '-827.40002441406', '2242.3999023438', '201.39999389648', 0, 2, 0, '2.5', 'Dr. Winchester\r\nSchwangerschaft & Adoption', 'Krankenhaus.openWindow', 'Server', 0, 0, 0),
(25, 70, '-804.59997558594', '2252.3000488281', '201.39999389648', 270, 2, 0, '2.5', 'Josh\r\nMitarbeiter', '', '', 0, 0, 0),
(26, 189, '501.60000610352', '-20.799999237061', '1000.700012207', 90, 17, 1, '2.5', 'Frank\r\nBarkeeper', 'Bar.openWindow', 'Client', 0, 0, 1),
(27, 189, '501.60000610352', '-20.799999237061', '1000.700012207', 90, 17, 2, '2.5', 'Frank\r\nBarkeeper', 'Bar.openWindow', 'Client', 0, 0, 1),
(28, 189, '501.60000610352', '-20.799999237061', '1000.700012207', 90, 17, 3, '2.5', 'Frank\r\nBarkeeper', 'Bar.openWindow', 'Client', 0, 0, 1),
(29, 268, '-2038.3000488281', '172.19999694824', '28.799999237061', 270, 0, 0, '2.5', 'Johannes\r\nRepairkits', 'Mechaniker.buyRepairkits', 'Client', 0, 0, 0),
(30, 305, '-2032.4000244141', '130', '28.799999237061', 0, 0, 0, '2.5', 'Erik\r\nAbschlepphof', 'Mechaniker.abschlepphof', 'Server', 0, 0, 0),
(31, 141, '-2035', '-118.09999847412', '1035.1999511719', 270, 3, 0, '2.5', 'Effy\r\nFahrschullehrerin', 'Fahrschule.openWindow', 'Server', 0, 0, 0),
(32, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 1, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(33, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 2, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(34, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 3, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(35, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 4, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(36, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 5, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(37, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 6, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(38, 155, '375.60000610352', '-117.40000152588', '1001.5', 180, 5, 7, '2.5', 'Toby\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(39, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 1, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(40, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 2, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(41, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 3, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(42, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 4, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(43, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 10, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(44, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 6, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(45, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 7, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(46, 205, '377.39999389648', '-65.800003051758', '1001.5', 180, 10, 8, '2.5', 'Betty\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(47, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 1, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(48, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 2, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(49, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 3, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(50, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 4, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(51, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 5, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(52, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 6, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(53, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 7, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(54, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 8, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(55, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 9, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(56, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 10, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(57, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 11, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(58, 167, '369.29611206055', '-4.6455297470093', '1001.8516235352', 180, 9, 12, '2.5', 'Lance\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(59, 235, '380.56719970703', '-187.86540222168', '1000.6328125', 90, 17, 1, '2.5', 'Jochen\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(60, 235, '380.56719970703', '-187.86540222168', '1000.6328125', 90, 17, 2, '2.5', 'Jochen\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(61, 235, '380.56719970703', '-187.86540222168', '1000.6328125', 90, 17, 3, '2.5', 'Jochen\r\nBedienung', 'Restaurants.openWindow', 'Client', 0, 0, 1),
(62, 253, '-2265.6999511719', '177.60000610352', '35.299999237061', 180, 0, 0, '2.5', 'Fred\r\nBusfahrer', 'Jobs.openWindow', 'Client', 58, 0, 0),
(63, 16, '-2003.9000244141', '-2363', '30.60000038147', 312, 0, 0, '2.5', 'Guenther\r\nHolzfaeller', 'Jobs.openWindow', 'Client', 58, 0, 0),
(64, 35, '2494.3999023438', '-2257.6999511719', '3', 180, 0, 0, '2.5', 'Olaf\r\nMeeresreiniger', 'Jobs.openWindow', 'Client', 58, 0, 0),
(65, 61, '-1413.5999755859', '-297.89999389648', '6.1999998092651', 132, 0, 0, '2.5', 'Alfred\r\nPilot', 'Jobs.openWindow', 'Client', 58, 0, 0),
(66, 17, '-1988.3000488281', '1039.0999755859', '55.700000762939', 45, 0, 0, '2.5', 'Juergen\r\nPostbote', 'Jobs.openWindow', 'Client', 58, 0, 0),
(67, 44, '2138.8000488281', '-1994.0999755859', '13.5', 48, 0, 0, '2.5', 'Olgen\r\nSchrottplatzmitarbeiter', 'Jobs.openWindow', 'Client', 58, 0, 0),
(68, 260, '-1897.5999755859', '-1682.6999511719', '23', 270, 0, 0, '2.5', 'Kenny\r\nMuellmann', 'Jobs.openWindow', 'Client', 58, 0, 0),
(69, 295, '-1968.5999755859', '110', '27.700000762939', 0, 0, 0, '2.5', 'James\r\nZugfuehrer', 'Jobs.openWindow', 'Client', 58, 1, 0),
(70, 157, '-1061.0999755859', '-1192.3000488281', '129.19999694824', 270, 0, 0, '2.5', 'Lisa\r\nFarmerin', 'Jobs.openWindow', 'Client', 58, 0, 0),
(71, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 1, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(72, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 2, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(73, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 3, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(74, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 4, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(75, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 5, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(76, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 6, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(77, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 7, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(78, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 8, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(79, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 9, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(80, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 10, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(81, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 11, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(82, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 12, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(83, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 13, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(84, 184, '-28.179029464722', '-91.510520935059', '1003.546875', 0, 18, 14, '2.5', 'Dean\r\nMitarbeiter', 'Supermarkt.openWindow', 'Client', 0, 0, 1),
(85, 35, '413.36837768555', '2536.7390136719', '10', 270, 10, 1, '2.5', 'Dave\r\nAngler', 'Angelsystem.openWindow', 'Client', 0, 0, 1),
(86, 35, '413.36837768555', '2536.7390136719', '10', 270, 10, 2, '2.5', 'Dave\r\nAngler', 'Angelsystem.openWindow', 'Client', 0, 0, 1),
(87, 35, '413.36837768555', '2536.7390136719', '10', 270, 10, 3, '2.5', 'Dave\r\nAngler', 'Angelsystem.openWindow', 'Client', 0, 0, 1),
(88, 105, '413.36837768555', '2536.7390136719', '10', 270, 10, 4, '2.5', 'Tom\r\nGartenclub', 'Gartenclub.openWindow', 'Client', 0, 0, 1),
(89, 105, '413.36837768555', '2536.7390136719', '10', 270, 10, 5, '2.5', 'Tom\r\nGartenclub', 'Gartenclub.openWindow', 'Client', 0, 0, 1),
(90, 105, '413.36837768555', '2536.7390136719', '10', 270, 10, 6, '2.5', 'Tom\r\nGartenclub', 'Gartenclub.openWindow', 'Client', 0, 0, 1),
(91, 14, '1403.6999511719', '-1613.3000488281', '14.39999961853', 180, 0, 0, '2.5', 'Berry\r\nMitarbeiter', 'Moebel.showObject', 'Client', 0, 0, 1),
(92, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 1, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(93, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 2, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(94, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 3, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(95, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 4, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(96, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 5, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(97, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 6, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(98, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 7, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(99, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 8, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(100, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 9, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(101, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 10, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(102, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 11, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(103, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 12, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(104, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 13, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(105, 182, '-23.430734634399', '-57.213180541992', '1003.546875', 0, 6, 14, '2.5', 'Lenny\r\nMitarbeiter', 'Tankstellen.openShop', 'Client', 0, 0, 1),
(106, 26, '-1968.6999511719', '162.60000610352', '27.700000762939', 180, 0, 0, '2.5', 'Tom\r\nTopliste', 'Topliste.openWindow', 'Client', 0, 0, 0),
(107, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 1, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(108, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 2, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(109, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 3, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(110, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 4, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(111, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 5, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(112, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 6, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(113, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 7, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(114, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 8, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(115, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 9, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(116, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 10, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(117, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 11, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(118, 55, '207.60848999023', '-98.747253417969', '1005.2578125', 180, 15, 12, '2.5', 'Lilly\r\nMitarbeiterin', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(119, 127, '2717.3803710938', '-1422.5891113281', '16.25', 270, 0, 0, '2.5', 'Anonyme Person', 'Marktplatz.openWindow', 'Server', 0, 0, 0),
(120, 250, '-1978.7027587891', '144.36225891113', '27.694049835205', 270, 0, 0, '2.5', 'Lenny\r\nMarktplatz', 'Marktplatz.openWindow', 'Server', 0, 0, 0),
(121, 80, '774.59387207031', '7.1871790885925', '1000.7084960938', 90, 5, 1, '2.5', 'Freddy\r\nBoxer', 'Jobs.openWindow', 'Client', 0, 0, 0),
(122, 156, '-201.88259887695', '-27.043395996094', '1002.2734375', 0, 16, 1, '2.5', 'Bobby\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(123, 156, '-201.88259887695', '-27.043395996094', '1002.2734375', 0, 16, 2, '2.5', 'Bobby\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(124, 156, '-201.88259887695', '-27.043395996094', '1002.2734375', 0, 16, 4, '2.5', 'Bobby\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(125, 156, '-201.88259887695', '-27.043395996094', '1002.2734375', 0, 16, 3, '2.5', 'Bobby\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(126, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 1, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(127, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 2, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(128, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 3, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(129, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 4, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(130, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 5, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(131, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 6, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(132, 177, '408.86566162109', '-52.129203796387', '1001.8983764648', 270, 12, 7, '2.5', 'Leo\r\nMitarbeiter', 'CJSkinshop.openWindow', 'Client', 0, 0, 1),
(133, 102, '1709.6999511719', '701.40002441406', '10.800000190735', 90, 0, 0, '2.5', 'Anonyme Person\r\nDrogendealer', 'Drogentransporter.createWindow', 'Client', 24, 0, 0),
(134, 37, '-2237.1000976563', '128.60000610352', '1035.4000244141', 0, 6, 1, '2.5', 'Bobby\r\nAngestellter', 'Zoohandlung.openWindow', 'Client', 0, 0, 1),
(135, 141, '2311.3000488281', '-11', '26.700000762939', 180, 0, 0, '2.5', 'Anonyme Person\r\nStaatsbeamte', 'Geldtransporter.openWindow', 'Server', 0, 0, 0),
(136, 287, '127.43949890137', '1942.4761962891', '19.32439994812', 0, 0, 0, '2.5', 'Anonyme Person\r\nStaatsbeamter', 'Staatswaffentransporter.openWindow', 'Server', 0, 0, 0),
(137, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 1, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(138, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 2, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(139, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 3, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(140, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 4, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(141, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 5, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(142, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 6, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(143, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 7, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(144, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 8, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(145, 101, '2217.337890625', '-1144.9377441406', '1026.0672607422', 180, 15, 9, '2.5', 'Moritz\r\nMitarbeiter', 'Hotel.openWindow', 'Server', 0, 0, 1),
(146, 141, '359.78588867188', '173.49150085449', '1008.3828125', 270, 3, 98, '2.5', 'Lina\r\nAngestellte', 'ATM.createKonto', 'Client', 0, 0, 0),
(147, 141, '359.78588867188', '173.49150085449', '1008.3828125', 270, 3, 99, '2.5', 'Lina\r\nAngestellte', 'ATM.createKonto', 'Client', 0, 0, 0),
(148, 141, '359.78588867188', '173.49150085449', '1008.3828125', 270, 3, 100, '2.5', 'Lina\r\nAngestellte', 'ATM.createKonto', 'Client', 0, 0, 0),
(149, 141, '359.78588867188', '173.49150085449', '1008.3828125', 270, 3, 101, '2.5', 'Lina\r\nAngestellte', 'ATM.createKonto', 'Client', 0, 0, 0),
(150, 29, '2874.7509765625', '-2052.5710449219', '8.8832998275757', 270, 0, 0, '2.5', 'Anonyme Person\r\nDrogendealer', 'Drogenschiff.openWindow', 'Client', 24, 0, 0),
(151, 29, '2352.369140625', '545.10461425781', '1.7969000339508', 180, 0, 0, '2.5', 'Anonyme Person\r\nDrogendealer', 'Drogenschiff.openWindow', 'Client', 0, 0, 0),
(152, 127, '1426.1484375', '-1313.8026123047', '13.554699897766', 90, 0, 0, '2.5', 'Anonyme Person\r\nWarenhausraub', 'Warenhaus.openWindow', 'Client', 51, 0, 0),
(153, 246, '-105.9262008667', '-9.0347003936768', '1000.7188110352', 180, 3, 1, '2.5', 'Blasma\r\nAngestellte', 'Sexshop.openWindow', 'Client', 0, 0, 1),
(154, 246, '-105.9262008667', '-9.0347003936768', '1000.7188110352', 180, 3, 2, '2.5', 'Blasma\r\nAngestellte', 'Sexshop.openWindow', 'Client', 0, 0, 1),
(155, 246, '-105.9262008667', '-9.0347003936768', '1000.7188110352', 180, 3, 3, '2.5', 'Blasma\r\nAngestellte', 'Sexshop.openWindow', 'Client', 0, 0, 1),
(156, 246, '-105.9262008667', '-9.0347003936768', '1000.7188110352', 180, 3, 4, '2.5', 'Blasma\r\nAngestellte', 'Sexshop.openWindow', 'Client', 0, 0, 1),
(157, 16, '1726.2012939453', '-2228.4487304688', '39.380298614502', 180, 1, 1, '3', 'Toby\r\nMitarbeiter', 'Airport.openWindow', 'Client', 0, 0, 0),
(158, 16, '1726.2012939453', '-2228.4487304688', '39.380298614502', 180, 1, 2, '3', 'Toby\r\nMitarbeiter', 'Airport.openWindow', 'Client', 0, 0, 0),
(169, 16, '1726.2012939453', '-2228.4487304688', '39.380298614502', 180, 1, 3, '3', 'Toby\r\nMitarbeiter', 'Airport.openWindow', 'Client', 0, 0, 0),
(170, 159, '-910.69140625', '-491.36828613281', '25.960899353027', 312, 0, 0, '2.5', 'Malloy\r\nWohnwagenverkauf', 'Wohnwagen.buyWindow', 'Client', 11, 0, 0),
(171, 255, '-2239.8037109375', '285.93090820313', '35.320301055908', 0, 0, 0, '2.5', 'Woody\r\nTaxifahrer', 'Jobs.openWindow', 'Client', 58, 0, 0),
(172, 261, '-2223.5395507813', '-2793.0942382813', '8.9919996261597', 180, 0, 0, '2.5', 'Jack Sparrow\r\nPirat', 'Pirat.openWindow', 'Client', 37, 1, 0),
(173, 258, '1040.1887207031', '1303.6822509766', '10.820300102234', 0, 0, 0, '2.5', 'Logan\r\nGabelstaplerfahrer', 'Jobs.openWindow', 'Client', 58, 1, 0),
(174, 157, '-371.99319458008', '-1422.9422607422', '25.726600646973', 90, 0, 0, '2.5', 'Schlom pe\r\nJaegerin', 'Jobs.openWindow', 'Client', 58, 1, 0),
(175, 16, '816.59918212891', '856.59802246094', '12.789099693298', 292, 0, 0, '2.5', 'Obi\r\nArchaeologe', 'Jobs.openWindow', 'Client', 58, 1, 0),
(176, 100, '656.92077636719', '-460.79330444336', '16.333200454712', 180, 0, 0, '2.5', 'Jax\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(177, 173, '1685.6158447266', '1912.44140625', '11.023400306702', 0, 0, 0, '2.5', 'Rodriguez\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(178, 126, '-1476.9434814453', '2646.5522460938', '55.835899353027', 0, 0, 0, '2.5', 'Luigi\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(179, 118, '2011.3725585938', '2183.0520019531', '10.845399856567', 180, 0, 0, '2.5', 'Itsuki\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(180, 81, '765.58911132813', '-5.3213000297546', '1000.7138061523', 0, 5, 1, '2.5', 'Max\r\nBoxer', 'Fightstyles.openWindow', 'Client', 0, 0, 0),
(181, 81, '765.58911132813', '-5.3213000297546', '1000.7138061523', 0, 5, 2, '2.5', 'Max\r\nBoxer', 'Fightstyles.openWindow', 'Client', 0, 0, 0),
(182, 81, '765.58911132813', '-5.3213000297546', '1000.7138061523', 0, 5, 3, '2.5', 'Max\r\nBoxer', 'Fightstyles.openWindow', 'Client', 0, 0, 0),
(183, 91, '820.26818847656', '2.4077000617981', '1004.1796875', 270, 3, 1, '3.5', 'Laura\r\nAngestellte', 'Lotto.openWindow', 'Client', 0, 0, 0),
(184, 27, '1234.1302490234', '146.03689575195', '20.097200393677', 298, 0, 0, '2.5', 'Eduard\r\nHoehlenforscher', 'Jobs.openWindow', 'Client', 58, 0, 0),
(185, 260, '565.90032958984', '1218.0773925781', '11.718799591064', 208, 0, 0, '2.5', 'Johann\r\nSchmied', 'Hoehlenforscher.openSchmied', 'Server', 60, 0, 0),
(186, 127, '-685.14001464844', '2382.0466308594', '130.57389831543', 90, 0, 0, '2.5', 'Anonyme Person\r\nSchwarzpulvertransport', 'Schwarzpulvertransporter.openWindow', 'Client', 0, 0, 0),
(187, 126, '2655.94921875', '783.87689208984', '5.3158001899719', 46, 0, 0, '2.5', 'Anonyme Person\r\nBankraub', 'Bankraub.openWindow', 'Client', 0, 0, 0),
(188, 24, '-86.229301452637', '-299.66351318359', '2.7646000385284', 180, 0, 0, '2.5', 'Friedrich\r\nGoldbarren-Ankauf', 'Hoehlenforscher.sellGoldbarren', 'Client', 37, 0, 0),
(189, 118, '-2188.0139160156', '695.13000488281', '53.890598297119', 0, 0, 0, '2.5', 'Itsuki\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(190, 173, '-2456.3225097656', '-96.945198059082', '25.984399795532', 90, 0, 0, '2.5', 'Rodriguez\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(191, 100, '-2216.3684082031', '71.474899291992', '35.327899932861', 270, 0, 0, '2.5', 'Jax\r\nWaffendealer', 'Matslager.openWindow', 'Client', 0, 0, 0),
(192, 126, '-2222.4973144531', '-102.17900085449', '35.320301055908', 180, 0, 0, '2.5', 'Luigi\r\nWaffendealer', 'Matslager.openWindow', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pflanzen`
--

CREATE TABLE `pflanzen` (
  `ID` int NOT NULL,
  `Model` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotz` int NOT NULL,
  `STime` int NOT NULL,
  `Besitzer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pizzeria`
--

CREATE TABLE `pizzeria` (
  `ID` int NOT NULL,
  `Gericht2218` int NOT NULL,
  `Gericht2218Preis` int NOT NULL,
  `Gericht2219` int NOT NULL,
  `Gericht2219Preis` int NOT NULL,
  `Gericht2220` int NOT NULL,
  `Gericht2220Preis` int NOT NULL,
  `Gericht2355` int NOT NULL,
  `Gericht2355Preis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizzeria`
--

INSERT INTO `pizzeria` (`ID`, `Gericht2218`, `Gericht2218Preis`, `Gericht2219`, `Gericht2219Preis`, `Gericht2220`, `Gericht2220Preis`, `Gericht2355`, `Gericht2355Preis`, `Name`) VALUES
(1, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria1'),
(2, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria2'),
(3, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria3'),
(4, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria4'),
(5, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria5'),
(6, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria6'),
(7, 50, 15, 50, 25, 50, 45, 50, 15, 'Pizzeria7');

-- --------------------------------------------------------

--
-- Table structure for table `postfach`
--

CREATE TABLE `postfach` (
  `ID` int NOT NULL,
  `Absender` text NOT NULL,
  `Empfaenger` text NOT NULL,
  `Betreff` text NOT NULL,
  `Text` text NOT NULL,
  `Datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Gelesen` int NOT NULL DEFAULT '0',
  `Ticket` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prestige`
--

CREATE TABLE `prestige` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Preis` varchar(50) NOT NULL,
  `Besitzer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestige`
--

INSERT INTO `prestige` (`ID`, `Name`, `Spawnx`, `Spawny`, `Spawnz`, `Preis`, `Besitzer`) VALUES
(1, 'Sir. Rayden', '-1938.2166748047', '883.42242431641', '38.5078125', '750000', 'Niemand'),
(2, 'Drogenlabor', '-2134.1525878906', '-79.9140625', '35.3203125', '800000', 'Niemand'),
(3, 'Frachtschiff', '-2522.74609375', '1544.9450683594', '17.328125', '1200000', 'Niemand'),
(4, 'San Fierro Docks', '-1741.2666015625', '23.076774597168', '3.5546875', '800000', 'Niemand'),
(5, 'PD-Bridge', '-1541.6870117188', '696.8984375', '7.1875', '1000000', 'Niemand'),
(6, 'Gewässer', '-1642.2049560547', '1312.6104736328', '7.1739654541016', '900000', 'Niemand'),
(7, 'Golden Gate', '-2663.0163574219', '1246.2965087891', '55.778095245361', '1500000', 'Niemand'),
(8, 'Stadthalle', '-2800.1477050781', '375.56143188477', '6.3359375', '1200000', 'Niemand'),
(9, 'Einkaufszentrum', '-1965.1317138672', '-726.32958984375', '32.2265625', '1350000', 'Niemand'),
(10, 'Mount Chiliad', '-2228.6005859375', '-1744.5715332031', '480.8850402832', '6000000', 'Niemand'),
(11, 'Leuchtturm', '154.20692443848', '-1946.6228027344', '5.3903141021729', '750000', 'Niemand'),
(12, 'Riesenrad', '379.75521850586', '-2020.6944580078', '7.8359375', '800000', 'Niemand'),
(13, 'Presidenten Memorial', '1126.3386230469', '-2042.0583496094', '69.881164550781', '4000000', 'Niemand'),
(14, 'Los Santos Airport', '1585.7620849609', '-2279.0129394531', '13.546875', '4500000', 'Niemand'),
(15, 'Grove Street', '2438.2509765625', '-1680.6090087891', '13.793256759644', '1750000', 'Niemand'),
(16, 'Pyramide', '2239.0344238281', '1293.7744140625', '10.8203125', '1800000', 'Niemand'),
(17, 'Piratenschiff', '2000.6174316406', '1551.111328125', '13.625149726868', '950000', 'Niemand'),
(18, 'Baseballstadion', '1480.2563476563', '2232.0927734375', '11.8984375', '1650000', 'Niemand'),
(19, 'Blackfield Stadium LV', '1097.9328613281', '1597.7768554688', '12.546875', '2250000', 'Niemand'),
(20, 'Kiesgrube', '830.07244873047', '865.63671875', '12.520274162292', '3650000', 'Niemand');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `QuestID` int NOT NULL,
  `QuestStufe` int NOT NULL,
  `Item` text NOT NULL,
  `Menge` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rechnungen`
--

CREATE TABLE `rechnungen` (
  `ID` int NOT NULL,
  `Summe` int NOT NULL,
  `Grund` text NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sammelobjekte`
--

CREATE TABLE `sammelobjekte` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Paeckchen` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `Hufeisen` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `Tikistatuen` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `Speicherdisketten` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `GTA3Logos` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schmied`
--

CREATE TABLE `schmied` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `STime` varchar(50) NOT NULL,
  `Abholen` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schwarzesbrett`
--

CREATE TABLE `schwarzesbrett` (
  `ID` int NOT NULL,
  `Posx` varchar(50) NOT NULL,
  `Posy` varchar(50) NOT NULL,
  `Posz` varchar(50) NOT NULL,
  `Rotz` int NOT NULL,
  `Text` text NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schwarzesbrett`
--

INSERT INTO `schwarzesbrett` (`ID`, `Posx`, `Posy`, `Posz`, `Rotz`, `Text`, `Name`) VALUES
(1, '-2765.6001', '378.70001', '6.5', 270, '', 'Stadthalle'),
(2, '-1984.2998046875', '201.400390625', '27.680000305176', 0, '', 'Bahnhof'),
(3, '-1572.6711425781', '719.04571533203', '7.1842999458313', 0, '', 'SFPD'),
(4, '-1598.3306884766', '764.75250244141', '7.2684001922607', 310, '', 'Noobspawn'),
(5, '-2424.1181640625', '339.93460083008', '37.00590133667', 239, '', 'SF Hotel'),
(6, '-2058.2172851563', '-102.14489746094', '35.274501800537', 0, '', 'Fahrschule'),
(7, '-2034.6534423828', '166.16529846191', '28.710899353027', 0, '', 'Mechaniker'),
(8, '-2339.8166503906', '-167.9134979248', '35.186798095703', 0, '', 'SF Burgershot'),
(9, '-1648.3269042969', '1213.7980957031', '7.2115998268127', 316, '', 'Otto\'s Cars'),
(10, '-2696.1457519531', '1235.330078125', '55.693300628662', 316, 'Herzlich willkommen auf Redfield Roleplay!', 'Golden Gate');

-- --------------------------------------------------------

--
-- Table structure for table `sexshops`
--

CREATE TABLE `sexshops` (
  `ID` int NOT NULL,
  `Vibrator` int NOT NULL DEFAULT '0',
  `VibratorPreis` int NOT NULL DEFAULT '0',
  `Dildo` int NOT NULL DEFAULT '0',
  `DildoPreis` int NOT NULL DEFAULT '0',
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sexshops`
--

INSERT INTO `sexshops` (`ID`, `Vibrator`, `VibratorPreis`, `Dildo`, `DildoPreis`, `Name`) VALUES
(1, 50, 100, 50, 75, 'Sexshop1'),
(2, 50, 100, 50, 75, 'Sexshop2'),
(3, 50, 100, 50, 75, 'Sexshop3'),
(4, 50, 100, 50, 75, 'Sexshop4');

-- --------------------------------------------------------

--
-- Table structure for table `skinshop`
--

CREATE TABLE `skinshop` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `player_torso` int NOT NULL DEFAULT '0',
  `player_torsoPreis` int NOT NULL DEFAULT '0',
  `vestblack` int NOT NULL DEFAULT '0',
  `vestblackPreis` int DEFAULT '0',
  `vest` int NOT NULL DEFAULT '0',
  `vestPreis` int NOT NULL DEFAULT '0',
  `tshirt2horiz` int NOT NULL DEFAULT '0',
  `tshirt2horizPreis` int NOT NULL DEFAULT '0',
  `tshirtwhite` int NOT NULL DEFAULT '0',
  `tshirtwhitePreis` int NOT NULL DEFAULT '0',
  `tshirtilovels` int NOT NULL DEFAULT '0',
  `tshirtilovelsPreis` int NOT NULL DEFAULT '0',
  `tshirtblunts` int NOT NULL DEFAULT '0',
  `tshirtbluntsPreis` int NOT NULL DEFAULT '0',
  `shirtbplaid` int NOT NULL DEFAULT '0',
  `shirtbplaidPreis` int NOT NULL DEFAULT '0',
  `shirtbcheck` int NOT NULL DEFAULT '0',
  `shirtbcheckPreis` int NOT NULL DEFAULT '0',
  `field` int NOT NULL DEFAULT '0',
  `fieldPreis` int NOT NULL DEFAULT '0',
  `tshirterisyell` int NOT NULL DEFAULT '0',
  `tshirterisyellPreis` int NOT NULL DEFAULT '0',
  `tshirterisorn` int NOT NULL DEFAULT '0',
  `tshirterisornPreis` int NOT NULL DEFAULT '0',
  `trackytop2eris` int NOT NULL DEFAULT '0',
  `trackytop2erisPreis` int NOT NULL DEFAULT '0',
  `bbjackrim` int NOT NULL DEFAULT '0',
  `bbjackrimPreis` int NOT NULL DEFAULT '0',
  `bballjackrstar` int NOT NULL DEFAULT '0',
  `bballjackrstarPreis` int NOT NULL DEFAULT '0',
  `baskballdrib` int NOT NULL DEFAULT '0',
  `baskballdribPreis` int NOT NULL DEFAULT '0',
  `baskballrim` int NOT NULL DEFAULT '0',
  `baskballrimPreis` int NOT NULL DEFAULT '0',
  `sixtyniners` int NOT NULL DEFAULT '0',
  `sixtyninersPreis` int NOT NULL DEFAULT '0',
  `bandits` int NOT NULL DEFAULT '0',
  `banditsPreis` int NOT NULL DEFAULT '0',
  `tshirtprored` int NOT NULL DEFAULT '0',
  `tshirtproredPreis` int NOT NULL DEFAULT '0',
  `tshirtproblk` int NOT NULL DEFAULT '0',
  `tshirtproblkPreis` int NOT NULL DEFAULT '0',
  `trackytop1pro` int NOT NULL DEFAULT '0',
  `trackytop1proPreis` int NOT NULL DEFAULT '0',
  `hockeytop` int NOT NULL DEFAULT '0',
  `hockeytopPreis` int NOT NULL DEFAULT '0',
  `bbjersey` int NOT NULL DEFAULT '0',
  `bbjerseyPreis` int NOT NULL DEFAULT '0',
  `shellsuit` int NOT NULL DEFAULT '0',
  `shellsuitPreis` int NOT NULL DEFAULT '0',
  `tshirtheatwht` int NOT NULL DEFAULT '0',
  `tshirtheatwhtPreis` int NOT NULL DEFAULT '0',
  `tshirtbobomonk` int NOT NULL DEFAULT '0',
  `tshirtbobomonkPreis` int NOT NULL DEFAULT '0',
  `tshirtbobored` int NOT NULL DEFAULT '0',
  `tshirtboboredPreis` int NOT NULL DEFAULT '0',
  `tshirtbase5` int NOT NULL DEFAULT '0',
  `tshirtbase5Preis` int NOT NULL DEFAULT '0',
  `tshirtsuburb` int NOT NULL DEFAULT '0',
  `tshirtsuburbPreis` int NOT NULL DEFAULT '0',
  `hoodyamerc` int NOT NULL DEFAULT '0',
  `hoodyamercPreis` int NOT NULL DEFAULT '0',
  `hoodyabase5` int NOT NULL DEFAULT '0',
  `hoodyabase5Preis` int NOT NULL DEFAULT '0',
  `hoodyarockstar` int NOT NULL DEFAULT '0',
  `hoodyarockstarPreis` int NOT NULL DEFAULT '0',
  `wcoatblue` int NOT NULL DEFAULT '0',
  `wcoatbluePreis` int NOT NULL DEFAULT '0',
  `coach` int NOT NULL DEFAULT '0',
  `coachPreis` int NOT NULL DEFAULT '0',
  `coachsemi` int NOT NULL DEFAULT '0',
  `coachsemiPreis` int NOT NULL DEFAULT '0',
  `sweatrstar` int NOT NULL DEFAULT '0',
  `sweatrstarPreis` int NOT NULL DEFAULT '0',
  `hoodyAblue` int NOT NULL DEFAULT '0',
  `hoodyAbluePreis` int NOT NULL DEFAULT '0',
  `hoodyAblack` int NOT NULL DEFAULT '0',
  `hoodyAblackPreis` int NOT NULL DEFAULT '0',
  `hoodyAgreen` int NOT NULL DEFAULT '0',
  `hoodyAgreenPreis` int NOT NULL DEFAULT '0',
  `sleevtbrown` int NOT NULL DEFAULT '0',
  `sleevtbrownPreis` int NOT NULL DEFAULT '0',
  `shirtablue` int NOT NULL DEFAULT '0',
  `shirtabluePreis` int NOT NULL DEFAULT '0',
  `shirtayellow` int NOT NULL DEFAULT '0',
  `shirtayellowPreis` int NOT NULL DEFAULT '0',
  `shirtagrey` int DEFAULT '0',
  `shirtagreyPreis` int NOT NULL DEFAULT '0',
  `shirtbgang` int NOT NULL DEFAULT '0',
  `shirtbgangPreis` int NOT NULL DEFAULT '0',
  `tshirtzipcrm` int NOT NULL DEFAULT '0',
  `tshirtzipcrmPreis` int NOT NULL DEFAULT '0',
  `tshirtzipgry` int NOT NULL DEFAULT '0',
  `tshirtzipgryPreis` int NOT NULL DEFAULT '0',
  `denimfade` int NOT NULL DEFAULT '0',
  `denimfadePreis` int NOT NULL DEFAULT '0',
  `bowling` int NOT NULL DEFAULT '0',
  `bowlingPreis` int NOT NULL DEFAULT '0',
  `hoodjackbeige` int NOT NULL DEFAULT '0',
  `hoodjackbeigePreis` int NOT NULL DEFAULT '0',
  `baskballloc` int NOT NULL DEFAULT '0',
  `baskballlocPreis` int NOT NULL DEFAULT '0',
  `tshirtlocgrey` int NOT NULL DEFAULT '0',
  `tshirtlocgreyPreis` int NOT NULL DEFAULT '0',
  `tshirtmaddgrey` int NOT NULL DEFAULT '0',
  `tshirtmaddgreyPreis` int NOT NULL DEFAULT '0',
  `tshirtmaddgrn` int NOT NULL DEFAULT '0',
  `tshirtmaddgrnPreis` int NOT NULL DEFAULT '0',
  `suit1grey` int NOT NULL DEFAULT '0',
  `suit1greyPreis` int NOT NULL DEFAULT '0',
  `suit1blk` int NOT NULL DEFAULT '0',
  `suit1blkPreis` int NOT NULL DEFAULT '0',
  `leather` int NOT NULL DEFAULT '0',
  `leatherPreis` int NOT NULL DEFAULT '0',
  `painter` int NOT NULL DEFAULT '0',
  `painterPreis` int NOT NULL DEFAULT '0',
  `hawaiiwht` int NOT NULL DEFAULT '0',
  `hawaiiwhtPreis` int NOT NULL DEFAULT '0',
  `hawaiired` int NOT NULL DEFAULT '0',
  `hawaiiredPreis` int NOT NULL DEFAULT '0',
  `sportjack` int NOT NULL DEFAULT '0',
  `sportjackPreis` int NOT NULL DEFAULT '0',
  `suit1red` int NOT NULL DEFAULT '0',
  `suit1redPreis` int NOT NULL DEFAULT '0',
  `suit1blue` int NOT NULL DEFAULT '0',
  `suit1bluePreis` int NOT NULL DEFAULT '0',
  `suit1yellow` int NOT NULL DEFAULT '0',
  `suit1yellowPreis` int NOT NULL DEFAULT '0',
  `suit2grn` int NOT NULL DEFAULT '0',
  `suit2grnPreis` int NOT NULL DEFAULT '0',
  `tuxedo` int NOT NULL DEFAULT '0',
  `tuxedoPreis` int NOT NULL DEFAULT '0',
  `suit1gang` int NOT NULL DEFAULT '0',
  `suit1gangPreis` int NOT NULL DEFAULT '0',
  `letter` int NOT NULL DEFAULT '0',
  `letterPreis` int NOT NULL DEFAULT '0',
  `player_legs` int NOT NULL DEFAULT '0',
  `player_legsPreis` int NOT NULL DEFAULT '0',
  `worktrcamogrn` int NOT NULL DEFAULT '0',
  `worktrcamogrnPreis` int NOT NULL DEFAULT '0',
  `worktrcamogry` int NOT NULL DEFAULT '0',
  `worktrcamogryPreis` int NOT NULL DEFAULT '0',
  `worktrgrey` int NOT NULL DEFAULT '0',
  `worktrgreyPreis` int NOT NULL DEFAULT '0',
  `worktrkhaki` int NOT NULL DEFAULT '0',
  `worktrkhakiPreis` int NOT NULL DEFAULT '0',
  `tracktr` int NOT NULL DEFAULT '0',
  `tracktrPreis` int NOT NULL DEFAULT '0',
  `tracktreris` int NOT NULL DEFAULT '0',
  `tracktrerisPreis` int NOT NULL DEFAULT '0',
  `jeansdenim` int NOT NULL DEFAULT '0',
  `jeansdenimPreis` int NOT NULL DEFAULT '0',
  `legsblack` int NOT NULL DEFAULT '0',
  `legsblackPreis` int NOT NULL DEFAULT '0',
  `legsheart` int NOT NULL DEFAULT '0',
  `legsheartPreis` int NOT NULL DEFAULT '0',
  `biegetr` int NOT NULL DEFAULT '0',
  `biegetrPreis` int NOT NULL DEFAULT '0',
  `tracktrpro` int NOT NULL DEFAULT '0',
  `tracktrproPreis` int NOT NULL DEFAULT '0',
  `tracktrwhstr` int NOT NULL DEFAULT '0',
  `tracktrwhstrPreis` int NOT NULL DEFAULT '0',
  `tracktrblue` int NOT NULL DEFAULT '0',
  `tracktrbluePreis` int NOT NULL DEFAULT '0',
  `tracktrgang` int NOT NULL DEFAULT '0',
  `tracktrgangPreis` int NOT NULL DEFAULT '0',
  `bbshortwht` int NOT NULL DEFAULT '0',
  `bbshortwhtPreis` int DEFAULT '0',
  `boxshort` int NOT NULL DEFAULT '0',
  `boxshortPreis` int NOT NULL DEFAULT '0',
  `bbshortred` int NOT NULL DEFAULT '0',
  `bbshortredPreis` int NOT NULL DEFAULT '0',
  `shellsuittr` int NOT NULL DEFAULT '0',
  `shellsuittrPreis` int NOT NULL DEFAULT '0',
  `shortsgrey` int NOT NULL DEFAULT '0',
  `shortsgreyPreis` int NOT NULL DEFAULT '0',
  `shortskhaki` int NOT NULL DEFAULT '0',
  `shortskhakiPreis` int NOT NULL DEFAULT '0',
  `chongergrey` int NOT NULL DEFAULT '0',
  `chongergreyPreis` int NOT NULL DEFAULT '0',
  `chongergang` int NOT NULL DEFAULT '0',
  `chongergangPreis` int NOT NULL DEFAULT '0',
  `chongerred` int NOT NULL DEFAULT '0',
  `chongerredPreis` int NOT NULL DEFAULT '0',
  `chongerblue` int NOT NULL DEFAULT '0',
  `chongerbluePreis` int NOT NULL DEFAULT '0',
  `shortsgang` int NOT NULL DEFAULT '0',
  `shortsgangPreis` int NOT NULL DEFAULT '0',
  `denimsgang` int NOT NULL DEFAULT '0',
  `denimsgangPreis` int NOT NULL DEFAULT '0',
  `denimsred` int NOT NULL DEFAULT '0',
  `denimsredPreis` int NOT NULL DEFAULT '0',
  `chinosbiege` int NOT NULL DEFAULT '0',
  `chinosbiegePreis` int NOT NULL DEFAULT '0',
  `chinoskhaki` int NOT NULL DEFAULT '0',
  `chinoskhakiPreis` int NOT NULL DEFAULT '0',
  `cutoffchinos` int DEFAULT '0',
  `cutoffchinosPreis` int NOT NULL DEFAULT '0',
  `cutoffchinosblue` int NOT NULL DEFAULT '0',
  `cutoffchinosbluePreis` int NOT NULL DEFAULT '0',
  `chinosblack` int NOT NULL DEFAULT '0',
  `chinosblackPreis` int NOT NULL DEFAULT '0',
  `chinosblue` int NOT NULL DEFAULT '0',
  `chinosbluePreis` int NOT NULL DEFAULT '0',
  `leathertr` int NOT NULL DEFAULT '0',
  `leathertrPreis` int NOT NULL DEFAULT '0',
  `leathertrchaps` int NOT NULL DEFAULT '0',
  `leathertrchapsPreis` int NOT NULL DEFAULT '0',
  `suit1trgrey` int NOT NULL DEFAULT '0',
  `suit1trgreyPreis` int NOT NULL DEFAULT '0',
  `suit1trblk` int NOT NULL DEFAULT '0',
  `suit1trblkPreis` int NOT NULL DEFAULT '0',
  `cutoffdenims` int NOT NULL DEFAULT '0',
  `cutoffdenimsPreis` int NOT NULL DEFAULT '0',
  `suit1trred` int NOT NULL DEFAULT '0',
  `suit1trredPreis` int NOT NULL DEFAULT '0',
  `suit1trblue` int NOT NULL DEFAULT '0',
  `suit1trbluePreis` int NOT NULL DEFAULT '0',
  `suit1tryellow` int NOT NULL DEFAULT '0',
  `suit1tryellowPreis` int NOT NULL DEFAULT '0',
  `suit1trgreen` int NOT NULL DEFAULT '0',
  `suit1trgreenPreis` int NOT NULL DEFAULT '0',
  `suit1trblk2` int NOT NULL DEFAULT '0',
  `suit1trblk2Preis` int NOT NULL DEFAULT '0',
  `suit1trgang` int NOT NULL DEFAULT '0',
  `suit1trgangPreis` int NOT NULL DEFAULT '0',
  `foot` int NOT NULL DEFAULT '0',
  `footPreis` int NOT NULL DEFAULT '0',
  `cowboyboot2` int NOT NULL DEFAULT '0',
  `cowboyboot2Preis` int NOT NULL DEFAULT '0',
  `bask2semi` int NOT NULL DEFAULT '0',
  `bask2semiPreis` int NOT NULL DEFAULT '0',
  `bask1eris` int NOT NULL DEFAULT '0',
  `bask1erisPreis` int NOT NULL DEFAULT '0',
  `sneakerbincgang` int NOT NULL DEFAULT '0',
  `sneakerbincgangPreis` int NOT NULL DEFAULT '0',
  `sneakerbincblk` int NOT NULL DEFAULT '0',
  `sneakerbincblkPreis` int NOT NULL DEFAULT '0',
  `sandal` int NOT NULL DEFAULT '0',
  `sandalPreis` int NOT NULL DEFAULT '0',
  `sandalsock` int NOT NULL DEFAULT '0',
  `sandalsockPreis` int NOT NULL DEFAULT '0',
  `flipflop` int NOT NULL DEFAULT '0',
  `flipflopPreis` int NOT NULL DEFAULT '0',
  `hitop` int NOT NULL DEFAULT '0',
  `hitopPreis` int NOT NULL DEFAULT '0',
  `convproblk` int NOT NULL DEFAULT '0',
  `convproblkPreis` int NOT NULL DEFAULT '0',
  `convproblu` int NOT NULL DEFAULT '0',
  `convprobluPreis` int NOT NULL DEFAULT '0',
  `convprogrn` int NOT NULL DEFAULT '0',
  `convprogrnPreis` int NOT NULL DEFAULT '0',
  `sneakerprored` int NOT NULL DEFAULT '0',
  `sneakerproredPreis` int NOT NULL DEFAULT '0',
  `sneakerproblu` int NOT NULL DEFAULT '0',
  `sneakerprobluPreis` int NOT NULL DEFAULT '0',
  `sneakerprowht` int NOT NULL DEFAULT '0',
  `sneakerprowhtPreis` int NOT NULL DEFAULT '0',
  `bask1prowht` int NOT NULL DEFAULT '0',
  `bask1prowhtPreis` int NOT NULL DEFAULT '0',
  `bask1problk` int NOT NULL DEFAULT '0',
  `bask1problkPreis` int NOT NULL DEFAULT '0',
  `boxingshoe` int NOT NULL DEFAULT '0',
  `boxingshoePreis` int NOT NULL DEFAULT '0',
  `convheatblk` int NOT NULL DEFAULT '0',
  `convheatblkPreis` int NOT NULL DEFAULT '0',
  `convheatred` int NOT NULL DEFAULT '0',
  `convheatredPreis` int NOT NULL DEFAULT '0',
  `convheatorn` int NOT NULL DEFAULT '0',
  `convheatornPreis` int NOT NULL DEFAULT '0',
  `sneakerheatwht` int NOT NULL DEFAULT '0',
  `sneakerheatwhtPreis` int NOT NULL DEFAULT '0',
  `sneakerheatgry` int NOT NULL DEFAULT '0',
  `sneakerheatgryPreis` int NOT NULL DEFAULT '0',
  `sneakerheatblk` int NOT NULL DEFAULT '0',
  `sneakerheatblkPreis` int NOT NULL DEFAULT '0',
  `bask2heatwht` int NOT NULL DEFAULT '0',
  `bask2heatwhtPreis` int NOT NULL DEFAULT '0',
  `bask2heatband` int NOT NULL DEFAULT '0',
  `bask2heatbandPreis` int NOT NULL DEFAULT '0',
  `timbergrey` int NOT NULL DEFAULT '0',
  `timbergreyPreis` int NOT NULL DEFAULT '0',
  `timberred` int NOT NULL DEFAULT '0',
  `timberredPreis` int NOT NULL DEFAULT '0',
  `timberfawn` int NOT NULL DEFAULT '0',
  `timberfawnPreis` int NOT NULL DEFAULT '0',
  `timberhike` int NOT NULL DEFAULT '0',
  `timberhikePreis` int NOT NULL DEFAULT '0',
  `cowboyboot` int NOT NULL DEFAULT '0',
  `cowboybootPreis` int NOT NULL DEFAULT '0',
  `biker` int NOT NULL DEFAULT '0',
  `bikerPreis` int NOT NULL DEFAULT '0',
  `snakeskin` int NOT NULL DEFAULT '0',
  `snakeskinPreis` int NOT NULL DEFAULT '0',
  `shoedressblk` int NOT NULL DEFAULT '0',
  `shoedressblkPreis` int NOT NULL DEFAULT '0',
  `shoedressbrn` int NOT NULL DEFAULT '0',
  `shoedressbrnPreis` int NOT NULL DEFAULT '0',
  `shoespatz` int NOT NULL DEFAULT '0',
  `shoespatzPreis` int NOT NULL DEFAULT '0',
  `dogtag` int NOT NULL DEFAULT '0',
  `dogtagPreis` int NOT NULL DEFAULT '0',
  `neckafrica` int NOT NULL DEFAULT '0',
  `neckafricaPreis` int NOT NULL DEFAULT '0',
  `stopwatch` int NOT NULL DEFAULT '0',
  `stopwatchPreis` int NOT NULL DEFAULT '0',
  `necksaints` int NOT NULL DEFAULT '0',
  `necksaintsPreis` int NOT NULL DEFAULT '0',
  `neckhash` int NOT NULL DEFAULT '0',
  `neckhashPreis` int NOT NULL DEFAULT '0',
  `necksilver` int NOT NULL DEFAULT '0',
  `necksilverPreis` int NOT NULL DEFAULT '0',
  `neckgold` int NOT NULL DEFAULT '0',
  `neckgoldPreis` int NOT NULL DEFAULT '0',
  `neckropes` int NOT NULL DEFAULT '0',
  `neckropesPreis` int NOT NULL DEFAULT '0',
  `neckropeg` int NOT NULL DEFAULT '0',
  `neckropegPreis` int NOT NULL DEFAULT '0',
  `neckls` int NOT NULL DEFAULT '0',
  `necklsPreis` int NOT NULL DEFAULT '0',
  `neckdollar` int NOT NULL DEFAULT '0',
  `neckdollarPreis` int NOT NULL DEFAULT '0',
  `neckcross` int NOT NULL DEFAULT '0',
  `neckcrossPreis` int NOT NULL DEFAULT '0',
  `watchpink` int NOT NULL DEFAULT '0',
  `watchpinkPreis` int NOT NULL DEFAULT '0',
  `watchyellow` int NOT NULL DEFAULT '0',
  `watchyellowPreis` int NOT NULL DEFAULT '0',
  `watchpro` int NOT NULL DEFAULT '0',
  `watchproPreis` int NOT NULL DEFAULT '0',
  `watchpro2` int NOT NULL DEFAULT '0',
  `watchpro2Preis` int NOT NULL DEFAULT '0',
  `watchsub1` int NOT NULL DEFAULT '0',
  `watchsub1Preis` int NOT NULL DEFAULT '0',
  `watchsub2` int NOT NULL DEFAULT '0',
  `watchsub2Preis` int NOT NULL DEFAULT '0',
  `watchzip1` int NOT NULL DEFAULT '0',
  `watchzip1Preis` int NOT NULL DEFAULT '0',
  `watchzip2` int NOT NULL DEFAULT '0',
  `watchzip2Preis` int NOT NULL DEFAULT '0',
  `watchgno` int NOT NULL DEFAULT '0',
  `watchgnoPreis` int NOT NULL DEFAULT '0',
  `watchgno2` int NOT NULL DEFAULT '0',
  `watchgno2Preis` int NOT NULL DEFAULT '0',
  `watchcro` int NOT NULL DEFAULT '0',
  `watchcroPreis` int NOT NULL DEFAULT '0',
  `watchcro2` int NOT NULL DEFAULT '0',
  `watchcro2Preis` int NOT NULL DEFAULT '0',
  `zorro` int NOT NULL DEFAULT '0',
  `zorroPreis` int NOT NULL DEFAULT '0',
  `eyepatch` int NOT NULL DEFAULT '0',
  `eyepatchPreis` int NOT NULL DEFAULT '0',
  `glasses01` int NOT NULL DEFAULT '0',
  `glasses01Preis` int NOT NULL DEFAULT '0',
  `glasses04` int NOT NULL DEFAULT '0',
  `glasses04Preis` int NOT NULL DEFAULT '0',
  `bandred3` int NOT NULL DEFAULT '0',
  `bandred3Preis` int NOT NULL DEFAULT '0',
  `bandblue3` int NOT NULL DEFAULT '0',
  `bandblue3Preis` int NOT NULL DEFAULT '0',
  `bandgang3` int NOT NULL DEFAULT '0',
  `bandgang3Preis` int NOT NULL DEFAULT '0',
  `bandblack3` int NOT NULL DEFAULT '0',
  `bandblack3Preis` int NOT NULL DEFAULT '0',
  `glasses01dark` int NOT NULL DEFAULT '0',
  `glasses01darkPreis` int NOT NULL DEFAULT '0',
  `glasses04dark` int NOT NULL DEFAULT '0',
  `glasses04darkPreis` int NOT NULL DEFAULT '0',
  `glasses03` int NOT NULL DEFAULT '0',
  `glasses03Preis` int NOT NULL DEFAULT '0',
  `glasses03red` int NOT NULL DEFAULT '0',
  `glasses03redPreis` int NOT NULL DEFAULT '0',
  `glasses03blue` int NOT NULL DEFAULT '0',
  `glasses03bluePreis` int NOT NULL DEFAULT '0',
  `glasses03dark` int NOT NULL DEFAULT '0',
  `glasses03darkPreis` int NOT NULL DEFAULT '0',
  `glasses05dark` int NOT NULL DEFAULT '0',
  `glasses05darkPreis` int DEFAULT '0',
  `glasses05` int NOT NULL DEFAULT '0',
  `glasses05Preis` int NOT NULL DEFAULT '0',
  `bandred` int NOT NULL DEFAULT '0',
  `bandredPreis` int NOT NULL DEFAULT '0',
  `bandblue` int NOT NULL DEFAULT '0',
  `bandbluePreis` int NOT NULL DEFAULT '0',
  `bandgang` int NOT NULL DEFAULT '0',
  `bandgangPreis` int NOT NULL DEFAULT '0',
  `bandblack` int NOT NULL DEFAULT '0',
  `bandblackPreis` int NOT NULL DEFAULT '0',
  `bandred2` int NOT NULL DEFAULT '0',
  `bandred2Preis` int NOT NULL DEFAULT '0',
  `bandblue2` int NOT NULL DEFAULT '0',
  `bandblue2Preis` int NOT NULL DEFAULT '0',
  `bandblack2` int NOT NULL DEFAULT '0',
  `bandblack2Preis` int NOT NULL DEFAULT '0',
  `bandgang2` int NOT NULL DEFAULT '0',
  `bandgang2Preis` int NOT NULL DEFAULT '0',
  `capknitgrn` int NOT NULL DEFAULT '0',
  `capknitgrnPreis` int NOT NULL DEFAULT '0',
  `captruck` int NOT NULL DEFAULT '0',
  `captruckPreis` int NOT NULL DEFAULT '0',
  `cowboy` int NOT NULL DEFAULT '0',
  `cowboyPreis` int NOT NULL DEFAULT '0',
  `hattiger` int NOT NULL DEFAULT '0',
  `hattigerPreis` int NOT NULL DEFAULT '0',
  `helmet` int NOT NULL DEFAULT '0',
  `helmetPreis` int NOT NULL DEFAULT '0',
  `moto` int NOT NULL DEFAULT '0',
  `motoPreis` int NOT NULL DEFAULT '0',
  `boxingcap` int NOT NULL DEFAULT '0',
  `boxingcapPreis` int NOT NULL DEFAULT '0',
  `hockey` int NOT NULL DEFAULT '0',
  `hockeyPreis` int NOT NULL DEFAULT '0',
  `capgang` int NOT NULL DEFAULT '0',
  `capgangPreis` int NOT NULL DEFAULT '0',
  `capgangback` int NOT NULL DEFAULT '0',
  `capgangbackPreis` int NOT NULL DEFAULT '0',
  `capgangside` int NOT NULL DEFAULT '0',
  `capgangsidePreis` int NOT NULL DEFAULT '0',
  `capgangover` int NOT NULL DEFAULT '0',
  `capgangoverPreis` int NOT NULL DEFAULT '0',
  `capgangup` int NOT NULL DEFAULT '0',
  `capgangupPreis` int NOT NULL DEFAULT '0',
  `bikerhelmet` int NOT NULL DEFAULT '0',
  `bikerhelmetPreis` int NOT NULL DEFAULT '0',
  `capred` int NOT NULL DEFAULT '0',
  `capredPreis` int NOT NULL DEFAULT '0',
  `capredback` int NOT NULL DEFAULT '0',
  `capredbackPreis` int NOT NULL DEFAULT '0',
  `capredside` int NOT NULL DEFAULT '0',
  `capredsidePreis` int NOT NULL DEFAULT '0',
  `capredover` int NOT NULL DEFAULT '0',
  `capredoverPreis` int NOT NULL DEFAULT '0',
  `capredup` int NOT NULL DEFAULT '0',
  `capredupPreis` int NOT NULL DEFAULT '0',
  `capblue` int NOT NULL DEFAULT '0',
  `capbluePreis` int NOT NULL DEFAULT '0',
  `capblueback` int NOT NULL DEFAULT '0',
  `capbluebackPreis` int NOT NULL DEFAULT '0',
  `capblueside` int NOT NULL DEFAULT '0',
  `capbluesidePreis` int NOT NULL DEFAULT '0',
  `capblueover` int NOT NULL DEFAULT '0',
  `capblueoverPreis` int NOT NULL DEFAULT '0',
  `capblueup` int NOT NULL DEFAULT '0',
  `capblueupPreis` int NOT NULL DEFAULT '0',
  `skullyblk` int NOT NULL DEFAULT '0',
  `skullyblkPreis` int NOT NULL DEFAULT '0',
  `skullygrn` int NOT NULL DEFAULT '0',
  `skullygrnPreis` int NOT NULL DEFAULT '0',
  `hatmancblk` int NOT NULL DEFAULT '0',
  `hatmancblkPreis` int NOT NULL DEFAULT '0',
  `hatmancplaid` int NOT NULL DEFAULT '0',
  `hatmancplaidPreis` int NOT NULL DEFAULT '0',
  `capzip` int NOT NULL DEFAULT '0',
  `capzipPreis` int NOT NULL DEFAULT '0',
  `capzipback` int NOT NULL DEFAULT '0',
  `capzipbackPreis` int NOT NULL DEFAULT '0',
  `capzipside` int NOT NULL DEFAULT '0',
  `capzipsidePreis` int NOT NULL DEFAULT '0',
  `capzipover` int NOT NULL DEFAULT '0',
  `capzipoverPreis` int NOT NULL DEFAULT '0',
  `capzipup` int NOT NULL DEFAULT '0',
  `capzipupPreis` int NOT NULL DEFAULT '0',
  `beretred` int NOT NULL DEFAULT '0',
  `beretredPreis` int NOT NULL DEFAULT '0',
  `beretblk` int NOT NULL DEFAULT '0',
  `beretblkPreis` int NOT NULL DEFAULT '0',
  `capblk` int NOT NULL DEFAULT '0',
  `capblkPreis` int NOT NULL DEFAULT '0',
  `capblkback` int NOT NULL DEFAULT '0',
  `capblkbackPreis` int NOT NULL DEFAULT '0',
  `capblkside` int NOT NULL DEFAULT '0',
  `capblksidePreis` int NOT NULL DEFAULT '0',
  `capblkover` int NOT NULL DEFAULT '0',
  `capblkoverPreis` int NOT NULL DEFAULT '0',
  `capblkup` int NOT NULL DEFAULT '0',
  `capblkupPreis` int NOT NULL DEFAULT '0',
  `trilbydrk` int NOT NULL DEFAULT '0',
  `trilbydrkPreis` int NOT NULL DEFAULT '0',
  `trilbylght` int NOT NULL DEFAULT '0',
  `trilbylghtPreis` int NOT NULL DEFAULT '0',
  `bowler` int NOT NULL DEFAULT '0',
  `bowlerPreis` int NOT NULL DEFAULT '0',
  `bowlerred` int NOT NULL DEFAULT '0',
  `bowlerredPreis` int NOT NULL DEFAULT '0',
  `bowlerblue` int NOT NULL DEFAULT '0',
  `bowlerbluePreis` int NOT NULL DEFAULT '0',
  `bowleryellow` int NOT NULL DEFAULT '0',
  `bowleryellowPreis` int NOT NULL DEFAULT '0',
  `boater` int NOT NULL DEFAULT '0',
  `boaterPreis` int NOT NULL DEFAULT '0',
  `bowlergang` int NOT NULL DEFAULT '0',
  `bowlergangPreis` int NOT NULL DEFAULT '0',
  `boaterblk` int NOT NULL DEFAULT '0',
  `boaterblkPreis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skinshop`
--

INSERT INTO `skinshop` (`ID`, `Name`, `player_torso`, `player_torsoPreis`, `vestblack`, `vestblackPreis`, `vest`, `vestPreis`, `tshirt2horiz`, `tshirt2horizPreis`, `tshirtwhite`, `tshirtwhitePreis`, `tshirtilovels`, `tshirtilovelsPreis`, `tshirtblunts`, `tshirtbluntsPreis`, `shirtbplaid`, `shirtbplaidPreis`, `shirtbcheck`, `shirtbcheckPreis`, `field`, `fieldPreis`, `tshirterisyell`, `tshirterisyellPreis`, `tshirterisorn`, `tshirterisornPreis`, `trackytop2eris`, `trackytop2erisPreis`, `bbjackrim`, `bbjackrimPreis`, `bballjackrstar`, `bballjackrstarPreis`, `baskballdrib`, `baskballdribPreis`, `baskballrim`, `baskballrimPreis`, `sixtyniners`, `sixtyninersPreis`, `bandits`, `banditsPreis`, `tshirtprored`, `tshirtproredPreis`, `tshirtproblk`, `tshirtproblkPreis`, `trackytop1pro`, `trackytop1proPreis`, `hockeytop`, `hockeytopPreis`, `bbjersey`, `bbjerseyPreis`, `shellsuit`, `shellsuitPreis`, `tshirtheatwht`, `tshirtheatwhtPreis`, `tshirtbobomonk`, `tshirtbobomonkPreis`, `tshirtbobored`, `tshirtboboredPreis`, `tshirtbase5`, `tshirtbase5Preis`, `tshirtsuburb`, `tshirtsuburbPreis`, `hoodyamerc`, `hoodyamercPreis`, `hoodyabase5`, `hoodyabase5Preis`, `hoodyarockstar`, `hoodyarockstarPreis`, `wcoatblue`, `wcoatbluePreis`, `coach`, `coachPreis`, `coachsemi`, `coachsemiPreis`, `sweatrstar`, `sweatrstarPreis`, `hoodyAblue`, `hoodyAbluePreis`, `hoodyAblack`, `hoodyAblackPreis`, `hoodyAgreen`, `hoodyAgreenPreis`, `sleevtbrown`, `sleevtbrownPreis`, `shirtablue`, `shirtabluePreis`, `shirtayellow`, `shirtayellowPreis`, `shirtagrey`, `shirtagreyPreis`, `shirtbgang`, `shirtbgangPreis`, `tshirtzipcrm`, `tshirtzipcrmPreis`, `tshirtzipgry`, `tshirtzipgryPreis`, `denimfade`, `denimfadePreis`, `bowling`, `bowlingPreis`, `hoodjackbeige`, `hoodjackbeigePreis`, `baskballloc`, `baskballlocPreis`, `tshirtlocgrey`, `tshirtlocgreyPreis`, `tshirtmaddgrey`, `tshirtmaddgreyPreis`, `tshirtmaddgrn`, `tshirtmaddgrnPreis`, `suit1grey`, `suit1greyPreis`, `suit1blk`, `suit1blkPreis`, `leather`, `leatherPreis`, `painter`, `painterPreis`, `hawaiiwht`, `hawaiiwhtPreis`, `hawaiired`, `hawaiiredPreis`, `sportjack`, `sportjackPreis`, `suit1red`, `suit1redPreis`, `suit1blue`, `suit1bluePreis`, `suit1yellow`, `suit1yellowPreis`, `suit2grn`, `suit2grnPreis`, `tuxedo`, `tuxedoPreis`, `suit1gang`, `suit1gangPreis`, `letter`, `letterPreis`, `player_legs`, `player_legsPreis`, `worktrcamogrn`, `worktrcamogrnPreis`, `worktrcamogry`, `worktrcamogryPreis`, `worktrgrey`, `worktrgreyPreis`, `worktrkhaki`, `worktrkhakiPreis`, `tracktr`, `tracktrPreis`, `tracktreris`, `tracktrerisPreis`, `jeansdenim`, `jeansdenimPreis`, `legsblack`, `legsblackPreis`, `legsheart`, `legsheartPreis`, `biegetr`, `biegetrPreis`, `tracktrpro`, `tracktrproPreis`, `tracktrwhstr`, `tracktrwhstrPreis`, `tracktrblue`, `tracktrbluePreis`, `tracktrgang`, `tracktrgangPreis`, `bbshortwht`, `bbshortwhtPreis`, `boxshort`, `boxshortPreis`, `bbshortred`, `bbshortredPreis`, `shellsuittr`, `shellsuittrPreis`, `shortsgrey`, `shortsgreyPreis`, `shortskhaki`, `shortskhakiPreis`, `chongergrey`, `chongergreyPreis`, `chongergang`, `chongergangPreis`, `chongerred`, `chongerredPreis`, `chongerblue`, `chongerbluePreis`, `shortsgang`, `shortsgangPreis`, `denimsgang`, `denimsgangPreis`, `denimsred`, `denimsredPreis`, `chinosbiege`, `chinosbiegePreis`, `chinoskhaki`, `chinoskhakiPreis`, `cutoffchinos`, `cutoffchinosPreis`, `cutoffchinosblue`, `cutoffchinosbluePreis`, `chinosblack`, `chinosblackPreis`, `chinosblue`, `chinosbluePreis`, `leathertr`, `leathertrPreis`, `leathertrchaps`, `leathertrchapsPreis`, `suit1trgrey`, `suit1trgreyPreis`, `suit1trblk`, `suit1trblkPreis`, `cutoffdenims`, `cutoffdenimsPreis`, `suit1trred`, `suit1trredPreis`, `suit1trblue`, `suit1trbluePreis`, `suit1tryellow`, `suit1tryellowPreis`, `suit1trgreen`, `suit1trgreenPreis`, `suit1trblk2`, `suit1trblk2Preis`, `suit1trgang`, `suit1trgangPreis`, `foot`, `footPreis`, `cowboyboot2`, `cowboyboot2Preis`, `bask2semi`, `bask2semiPreis`, `bask1eris`, `bask1erisPreis`, `sneakerbincgang`, `sneakerbincgangPreis`, `sneakerbincblk`, `sneakerbincblkPreis`, `sandal`, `sandalPreis`, `sandalsock`, `sandalsockPreis`, `flipflop`, `flipflopPreis`, `hitop`, `hitopPreis`, `convproblk`, `convproblkPreis`, `convproblu`, `convprobluPreis`, `convprogrn`, `convprogrnPreis`, `sneakerprored`, `sneakerproredPreis`, `sneakerproblu`, `sneakerprobluPreis`, `sneakerprowht`, `sneakerprowhtPreis`, `bask1prowht`, `bask1prowhtPreis`, `bask1problk`, `bask1problkPreis`, `boxingshoe`, `boxingshoePreis`, `convheatblk`, `convheatblkPreis`, `convheatred`, `convheatredPreis`, `convheatorn`, `convheatornPreis`, `sneakerheatwht`, `sneakerheatwhtPreis`, `sneakerheatgry`, `sneakerheatgryPreis`, `sneakerheatblk`, `sneakerheatblkPreis`, `bask2heatwht`, `bask2heatwhtPreis`, `bask2heatband`, `bask2heatbandPreis`, `timbergrey`, `timbergreyPreis`, `timberred`, `timberredPreis`, `timberfawn`, `timberfawnPreis`, `timberhike`, `timberhikePreis`, `cowboyboot`, `cowboybootPreis`, `biker`, `bikerPreis`, `snakeskin`, `snakeskinPreis`, `shoedressblk`, `shoedressblkPreis`, `shoedressbrn`, `shoedressbrnPreis`, `shoespatz`, `shoespatzPreis`, `dogtag`, `dogtagPreis`, `neckafrica`, `neckafricaPreis`, `stopwatch`, `stopwatchPreis`, `necksaints`, `necksaintsPreis`, `neckhash`, `neckhashPreis`, `necksilver`, `necksilverPreis`, `neckgold`, `neckgoldPreis`, `neckropes`, `neckropesPreis`, `neckropeg`, `neckropegPreis`, `neckls`, `necklsPreis`, `neckdollar`, `neckdollarPreis`, `neckcross`, `neckcrossPreis`, `watchpink`, `watchpinkPreis`, `watchyellow`, `watchyellowPreis`, `watchpro`, `watchproPreis`, `watchpro2`, `watchpro2Preis`, `watchsub1`, `watchsub1Preis`, `watchsub2`, `watchsub2Preis`, `watchzip1`, `watchzip1Preis`, `watchzip2`, `watchzip2Preis`, `watchgno`, `watchgnoPreis`, `watchgno2`, `watchgno2Preis`, `watchcro`, `watchcroPreis`, `watchcro2`, `watchcro2Preis`, `zorro`, `zorroPreis`, `eyepatch`, `eyepatchPreis`, `glasses01`, `glasses01Preis`, `glasses04`, `glasses04Preis`, `bandred3`, `bandred3Preis`, `bandblue3`, `bandblue3Preis`, `bandgang3`, `bandgang3Preis`, `bandblack3`, `bandblack3Preis`, `glasses01dark`, `glasses01darkPreis`, `glasses04dark`, `glasses04darkPreis`, `glasses03`, `glasses03Preis`, `glasses03red`, `glasses03redPreis`, `glasses03blue`, `glasses03bluePreis`, `glasses03dark`, `glasses03darkPreis`, `glasses05dark`, `glasses05darkPreis`, `glasses05`, `glasses05Preis`, `bandred`, `bandredPreis`, `bandblue`, `bandbluePreis`, `bandgang`, `bandgangPreis`, `bandblack`, `bandblackPreis`, `bandred2`, `bandred2Preis`, `bandblue2`, `bandblue2Preis`, `bandblack2`, `bandblack2Preis`, `bandgang2`, `bandgang2Preis`, `capknitgrn`, `capknitgrnPreis`, `captruck`, `captruckPreis`, `cowboy`, `cowboyPreis`, `hattiger`, `hattigerPreis`, `helmet`, `helmetPreis`, `moto`, `motoPreis`, `boxingcap`, `boxingcapPreis`, `hockey`, `hockeyPreis`, `capgang`, `capgangPreis`, `capgangback`, `capgangbackPreis`, `capgangside`, `capgangsidePreis`, `capgangover`, `capgangoverPreis`, `capgangup`, `capgangupPreis`, `bikerhelmet`, `bikerhelmetPreis`, `capred`, `capredPreis`, `capredback`, `capredbackPreis`, `capredside`, `capredsidePreis`, `capredover`, `capredoverPreis`, `capredup`, `capredupPreis`, `capblue`, `capbluePreis`, `capblueback`, `capbluebackPreis`, `capblueside`, `capbluesidePreis`, `capblueover`, `capblueoverPreis`, `capblueup`, `capblueupPreis`, `skullyblk`, `skullyblkPreis`, `skullygrn`, `skullygrnPreis`, `hatmancblk`, `hatmancblkPreis`, `hatmancplaid`, `hatmancplaidPreis`, `capzip`, `capzipPreis`, `capzipback`, `capzipbackPreis`, `capzipside`, `capzipsidePreis`, `capzipover`, `capzipoverPreis`, `capzipup`, `capzipupPreis`, `beretred`, `beretredPreis`, `beretblk`, `beretblkPreis`, `capblk`, `capblkPreis`, `capblkback`, `capblkbackPreis`, `capblkside`, `capblksidePreis`, `capblkover`, `capblkoverPreis`, `capblkup`, `capblkupPreis`, `trilbydrk`, `trilbydrkPreis`, `trilbylght`, `trilbylghtPreis`, `bowler`, `bowlerPreis`, `bowlerred`, `bowlerredPreis`, `bowlerblue`, `bowlerbluePreis`, `bowleryellow`, `bowleryellowPreis`, `boater`, `boaterPreis`, `bowlergang`, `bowlergangPreis`, `boaterblk`, `boaterblkPreis`) VALUES
(1, 'Skinshop1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Skinshop2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Skinshop3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Skinshop4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Skinshop5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Skinshop6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Skinshop7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Skinshop8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'Skinshop9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Skinshop10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Skinshop11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 'Skinshop12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sprunkautomaten`
--

CREATE TABLE `sprunkautomaten` (
  `ID` int NOT NULL,
  `Dosen` int NOT NULL,
  `DosenPreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sprunkautomaten`
--

INSERT INTO `sprunkautomaten` (`ID`, `Dosen`, `DosenPreis`, `Name`) VALUES
(1, 50, 50, 'Sprunk'),
(2, 50, 50, 'Sprunk'),
(3, 50, 50, 'Sprunk'),
(4, 50, 50, 'Sprunk'),
(5, 50, 50, 'Sprunk'),
(6, 50, 50, 'Sprunk'),
(7, 50, 50, 'Sprunk'),
(8, 50, 50, 'Sprunk');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Status1` int NOT NULL DEFAULT '0',
  `Status2` int NOT NULL DEFAULT '0',
  `Status3` int NOT NULL DEFAULT '0',
  `Status4` int NOT NULL DEFAULT '0',
  `Status5` int NOT NULL DEFAULT '0',
  `Status6` int NOT NULL DEFAULT '0',
  `Status7` int NOT NULL DEFAULT '0',
  `Status8` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supermarkt`
--

CREATE TABLE `supermarkt` (
  `ID` int NOT NULL,
  `Kondome` int NOT NULL,
  `KondomePreis` int NOT NULL,
  `Benzinkanister` int NOT NULL,
  `BenzinkanisterPreis` int NOT NULL,
  `Limonade` int NOT NULL,
  `LimonadePreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supermarkt`
--

INSERT INTO `supermarkt` (`ID`, `Kondome`, `KondomePreis`, `Benzinkanister`, `BenzinkanisterPreis`, `Limonade`, `LimonadePreis`, `Name`) VALUES
(1, 25, 5, 10, 150, 25, 8, 'Supermarkt1'),
(2, 25, 5, 10, 150, 25, 8, 'Supermarkt2'),
(3, 25, 5, 10, 150, 25, 8, 'Supermarkt3'),
(4, 25, 5, 10, 150, 25, 8, 'Supermarkt4'),
(5, 25, 5, 10, 150, 25, 8, 'Supermarkt5'),
(6, 25, 5, 10, 150, 25, 8, 'Supermarkt6'),
(7, 25, 5, 10, 150, 25, 8, 'Supermarkt7'),
(8, 25, 5, 10, 150, 25, 8, 'Supermarkt8'),
(9, 25, 5, 10, 150, 25, 8, 'Supermarkt9'),
(10, 25, 5, 10, 150, 25, 8, 'Supermarkt10'),
(11, 25, 5, 10, 150, 25, 8, 'Supermarkt11'),
(12, 25, 5, 10, 150, 25, 8, 'Supermarkt12'),
(13, 25, 5, 10, 150, 25, 8, 'Supermarkt13'),
(14, 25, 5, 10, 150, 25, 8, 'Supermarkt14');

-- --------------------------------------------------------

--
-- Table structure for table `tankstellen`
--

CREATE TABLE `tankstellen` (
  `ID` int NOT NULL,
  `Tankmarkerx` varchar(50) NOT NULL,
  `Tankmarkery` varchar(50) NOT NULL,
  `Tankmarkerz` varchar(50) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tankstellen`
--

INSERT INTO `tankstellen` (`ID`, `Tankmarkerx`, `Tankmarkery`, `Tankmarkerz`, `Name`) VALUES
(1, '1939.3531494141', '-1778.4748535156', '12.368292808533', 'Tankstelle1'),
(2, '1943.9680175781', '-1767.0120849609', '12.368292808533', 'Tankstelle1'),
(3, '-1326.7840576172', '2687.9543457031', '49.026786804199', 'Tankstelle2'),
(4, '-1327.5114746094', '2682.4382324219', '49.026786804199', 'Tankstelle2'),
(5, '-1328.2937011719', '2677.0065917969', '49.026786804199', 'Tankstelle2'),
(6, '-1328.9842529297', '2671.6020507813', '49.026786804199', 'Tankstelle2'),
(7, '-736.98919677734', '2742.7680664063', '46.198112487793', 'Tankstelle3'),
(8, '1601.8836669922', '2206.7055664063', '9.7824573516846', 'Tankstelle4'),
(9, '1590.3991699219', '2202.2297363281', '9.7824573516846', 'Tankstelle4'),
(10, '1590.4012451172', '2195.9235839844', '9.7824573516846', 'Tankstelle4'),
(11, '1602.0209960938', '2191.4221191406', '9.7824573516846', 'Tankstelle4'),
(12, '2141.7067871094', '2740.1899414063', '9.8008241653442', 'Tankstelle5'),
(13, '2153.3122558594', '2744.8349609375', '9.8008241653442', 'Tankstelle5'),
(14, '2153.3288574219', '2751.001953125', '9.8008241653442', 'Tankstelle5'),
(15, '2141.6652832031', '2755.7067871094', '9.8008241653442', 'Tankstelle5'),
(16, '2210.1022949219', '2470.3361816406', '9.7928237915039', 'Tankstelle6'),
(17, '2205.3889160156', '2480.2214355469', '9.7928237915039', 'Tankstelle6'),
(18, '2199.3537597656', '2480.3156738281', '9.7928237915039', 'Tankstelle6'),
(19, '2194.5483398438', '2470.1640625', '9.7928237915039', 'Tankstelle6'),
(20, '2634.6647949219', '1114.0942382813', '9.7911911010742', 'Tankstelle7'),
(21, '2645.1147460938', '1109.4194335938', '9.7911911010742', 'Tankstelle7'),
(22, '2645.1416015625', '1103.3073730469', '9.7911911010742', 'Tankstelle7'),
(23, '2634.6774902344', '1098.5855712891', '9.7911911010742', 'Tankstelle7'),
(24, '2120.8210449219', '912.38262939453', '9.8142318725586', 'Tankstelle8'),
(25, '2109.0131835938', '917.06329345703', '9.8142318725586', 'Tankstelle8'),
(26, '2109.2189941406', '923.08605957031', '9.8142318725586', 'Tankstelle8'),
(27, '2120.7482910156', '927.90014648438', '9.8142318725586', 'Tankstelle8'),
(28, '653.09423828125', '-559.79583740234', '15.3068151474', 'Tankstelle9'),
(29, '658.03625488281', '-570.35491943359', '15.3068151474', 'Tankstelle9'),
(30, '-88.285507202148', '-1177.6329345703', '1.0961662530899', 'Tankstelle10'),
(31, '-89.970191955566', '-1162.8072509766', '1.1401661634445', 'Tankstelle10'),
(32, '-2239.6813964844', '-2563.3857421875', '30.912017822266', 'Tankstelle11'),
(33, '-2244.5764160156', '-2560.7238769531', '30.912017822266', 'Tankstelle11'),
(34, '-1677.6182861328', '401.35681152344', '6.1611566543579', 'Tankstelle12'),
(35, '-1667.3293457031', '418.50671386719', '6.1611566543579', 'Tankstelle12'),
(36, '-1670.4390869141', '421.75216674805', '6.1611566543579', 'Tankstelle12'),
(37, '-1687.7368164063', '411.40512084961', '6.1611566543579', 'Tankstelle12'),
(38, '71.172088623047', '1220.0618896484', '17.782121658325', 'Tankstelle13'),
(39, '1009.2421264648', '-933.67761230469', '41.157382965088', 'Tankstelle14'),
(40, '998.51336669922', '-939.96142578125', '41.157382965088', 'Tankstelle14');

-- --------------------------------------------------------

--
-- Table structure for table `tankstellenshop`
--

CREATE TABLE `tankstellenshop` (
  `ID` int NOT NULL,
  `Benzinkanister` int NOT NULL,
  `BenzinkanisterPreis` int NOT NULL,
  `Limonade` int NOT NULL,
  `LimonadePreis` int NOT NULL,
  `Liter` int NOT NULL,
  `LiterPreis` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tankstellenshop`
--

INSERT INTO `tankstellenshop` (`ID`, `Benzinkanister`, `BenzinkanisterPreis`, `Limonade`, `LimonadePreis`, `Liter`, `LiterPreis`, `Name`) VALUES
(1, 10, 150, 10, 8, 1000, 2, 'Tankstelle1'),
(2, 10, 150, 10, 8, 1000, 2, 'Tankstelle2'),
(3, 10, 150, 10, 8, 1000, 2, 'Tankstelle3'),
(4, 10, 150, 10, 8, 1000, 2, 'Tankstelle4'),
(5, 10, 150, 10, 8, 1000, 2, 'Tankstelle5'),
(6, 10, 150, 10, 8, 1000, 2, 'Tankstelle6'),
(7, 10, 150, 10, 8, 1000, 2, 'Tankstelle7'),
(8, 10, 150, 10, 8, 1000, 2, 'Tankstelle8'),
(9, 10, 150, 10, 8, 1000, 2, 'Tankstelle9'),
(10, 10, 150, 10, 8, 1000, 2, 'Tankstelle10'),
(11, 10, 150, 10, 8, 1000, 2, 'Tankstelle11'),
(12, 10, 150, 10, 8, 1000, 2, 'Tankstelle12'),
(13, 10, 150, 10, 8, 1000, 2, 'Tankstelle13'),
(14, 10, 150, 10, 8, 1000, 2, 'Tankstelle14');

-- --------------------------------------------------------

--
-- Table structure for table `tattoostudio`
--

CREATE TABLE `tattoostudio` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `4WEED` int NOT NULL DEFAULT '0',
  `4WEEDPreis` int NOT NULL DEFAULT '0',
  `4RIP` int NOT NULL DEFAULT '0',
  `4RIPPreis` int NOT NULL DEFAULT '0',
  `4SPIDER` int NOT NULL DEFAULT '0',
  `4SPIDERPreis` int NOT NULL DEFAULT '0',
  `5GUN` int NOT NULL DEFAULT '0',
  `5GUNPreis` int DEFAULT '0',
  `5CROSS` int NOT NULL DEFAULT '0',
  `5CROSSPreis` int NOT NULL DEFAULT '0',
  `5CROSS2` int NOT NULL DEFAULT '0',
  `5CROSS2Preis` int NOT NULL DEFAULT '0',
  `5CROSS3` int NOT NULL DEFAULT '0',
  `5CROSS3Preis` int NOT NULL DEFAULT '0',
  `6AZTEC` int NOT NULL DEFAULT '0',
  `6AZTECPreis` int NOT NULL DEFAULT '0',
  `6CROWN` int NOT NULL DEFAULT '0',
  `6CROWNPreis` int NOT NULL DEFAULT '0',
  `6CLOWN` int NOT NULL DEFAULT '0',
  `6CLOWNPreis` int NOT NULL DEFAULT '0',
  `6AFRICA` int NOT NULL DEFAULT '0',
  `6AFRICAPreis` int NOT NULL DEFAULT '0',
  `7CROSS` int NOT NULL DEFAULT '0',
  `7CROSSPreis` int NOT NULL DEFAULT '0',
  `7CROSS2` int NOT NULL DEFAULT '0',
  `7CROSS2Preis` int NOT NULL DEFAULT '0',
  `7CROSS3` int NOT NULL DEFAULT '0',
  `7CROSS3Preis` int NOT NULL DEFAULT '0',
  `7MARY` int NOT NULL DEFAULT '0',
  `7MARYPreis` int NOT NULL DEFAULT '0',
  `8SA` int NOT NULL DEFAULT '0',
  `8SAPreis` int NOT NULL DEFAULT '0',
  `8SA2` int NOT NULL DEFAULT '0',
  `8SA2Preis` int NOT NULL DEFAULT '0',
  `8SA3` int NOT NULL DEFAULT '0',
  `8SA3Preis` int NOT NULL DEFAULT '0',
  `8SANTOS` int NOT NULL DEFAULT '0',
  `8SANTOSPreis` int NOT NULL DEFAULT '0',
  `8POKER` int NOT NULL DEFAULT '0',
  `8POKERPreis` int NOT NULL DEFAULT '0',
  `8GUN` int NOT NULL DEFAULT '0',
  `8GUNPreis` int NOT NULL DEFAULT '0',
  `9CROWN` int NOT NULL DEFAULT '0',
  `9CROWNPreis` int NOT NULL DEFAULT '0',
  `9GUN` int NOT NULL DEFAULT '0',
  `9GUNPreis` int NOT NULL DEFAULT '0',
  `9RASTA` int NOT NULL DEFAULT '0',
  `9RASTAPreis` int NOT NULL DEFAULT '0',
  `10LS` int NOT NULL DEFAULT '0',
  `10LSPreis` int NOT NULL DEFAULT '0',
  `10LS2` int NOT NULL DEFAULT '0',
  `10LS2Preis` int NOT NULL DEFAULT '0',
  `10LS3` int NOT NULL DEFAULT '0',
  `10LS3Preis` int NOT NULL DEFAULT '0',
  `10LS4` int NOT NULL DEFAULT '0',
  `10LS4Preis` int NOT NULL DEFAULT '0',
  `10ls5` int NOT NULL DEFAULT '0',
  `10ls5Preis` int NOT NULL DEFAULT '0',
  `10OG` int NOT NULL DEFAULT '0',
  `10OGPreis` int NOT NULL DEFAULT '0',
  `10WEED` int NOT NULL DEFAULT '0',
  `10WEEDPreis` int NOT NULL DEFAULT '0',
  `11GROVE` int NOT NULL DEFAULT '0',
  `11GROVEPreis` int NOT NULL DEFAULT '0',
  `11DICE` int NOT NULL DEFAULT '0',
  `11DICEPreis` int NOT NULL DEFAULT '0',
  `11DICE2` int NOT NULL DEFAULT '0',
  `11DICE2Preis` int NOT NULL DEFAULT '0',
  `11JAIL` int NOT NULL DEFAULT '0',
  `11JAILPreis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tattoostudio`
--

INSERT INTO `tattoostudio` (`ID`, `Name`, `4WEED`, `4WEEDPreis`, `4RIP`, `4RIPPreis`, `4SPIDER`, `4SPIDERPreis`, `5GUN`, `5GUNPreis`, `5CROSS`, `5CROSSPreis`, `5CROSS2`, `5CROSS2Preis`, `5CROSS3`, `5CROSS3Preis`, `6AZTEC`, `6AZTECPreis`, `6CROWN`, `6CROWNPreis`, `6CLOWN`, `6CLOWNPreis`, `6AFRICA`, `6AFRICAPreis`, `7CROSS`, `7CROSSPreis`, `7CROSS2`, `7CROSS2Preis`, `7CROSS3`, `7CROSS3Preis`, `7MARY`, `7MARYPreis`, `8SA`, `8SAPreis`, `8SA2`, `8SA2Preis`, `8SA3`, `8SA3Preis`, `8SANTOS`, `8SANTOSPreis`, `8POKER`, `8POKERPreis`, `8GUN`, `8GUNPreis`, `9CROWN`, `9CROWNPreis`, `9GUN`, `9GUNPreis`, `9RASTA`, `9RASTAPreis`, `10LS`, `10LSPreis`, `10LS2`, `10LS2Preis`, `10LS3`, `10LS3Preis`, `10LS4`, `10LS4Preis`, `10ls5`, `10ls5Preis`, `10OG`, `10OGPreis`, `10WEED`, `10WEEDPreis`, `11GROVE`, `11GROVEPreis`, `11DICE`, `11DICEPreis`, `11DICE2`, `11DICE2Preis`, `11JAIL`, `11JAILPreis`) VALUES
(1, 'Tattoostudio1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Tattoostudio2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Tattoostudio3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Tattoostudio4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teleporter`
--

CREATE TABLE `teleporter` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Pickupx` varchar(50) NOT NULL,
  `Pickupy` varchar(50) NOT NULL,
  `Pickupz` varchar(50) NOT NULL,
  `PickupInterior` int NOT NULL,
  `PickupDimension` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Spawnrotz` varchar(50) NOT NULL,
  `SpawnInterior` int NOT NULL,
  `SpawnDimension` int NOT NULL,
  `Blip` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teleporter`
--

INSERT INTO `teleporter` (`ID`, `Name`, `Pickupx`, `Pickupy`, `Pickupz`, `PickupInterior`, `PickupDimension`, `Spawnx`, `Spawny`, `Spawnz`, `Spawnrotz`, `SpawnInterior`, `SpawnDimension`, `Blip`) VALUES
(1, 'StadthalleRein', '-2766.5520019531', '375.5270690918', '6.3346824645996', 0, 0, '388.29998779297', '173.69999694824', '1008.4000244141', '90', 3, 1, 56),
(2, 'StadthalleRaus', '390.76809692383', '173.8366394043', '1008.3828125', 3, 1, '-2764.3254394531', '375.65124511719', '6.3406562805176', '270', 0, 0, 0),
(3, 'SFPDRein', '-1605.5211181641', '710.27197265625', '13.8671875', 0, 0, '246.39999389648', '109.40000152588', '1003.200012207', '0', 10, 0, 30),
(4, 'SFPDRaus', '246.3772277832', '107.29943847656', '1003.21875', 10, 0, '-1605.4677734375', '712.86920166016', '13.800924301147', '0', 0, 0, 0),
(5, 'SFPDGarageRein', '214.09799194336', '122.38565063477', '1003.21875', 10, 0, '-1606.3000488281', '674.09997558594', '-5.1999998092651', '360', 0, 0, 0),
(6, 'SFPDGarageRaus', '-1606.3452148438', '672.06207275391', '-4.90625', 0, 0, '216.10000610352', '122.19999694824', '1003.200012207', '270', 10, 0, 0),
(7, 'Ammunation1Rein', '-2626.6220703125', '208.24775695801', '4.8125', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 1, 6),
(8, 'Ammunation1Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 1, '-2626.5590820313', '210.24462890625', '4.5990629196167', '0', 0, 0, 0),
(9, 'Ammunation2Rein', '2400.5', '-1981.8000488281', '13.60000038147', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 2, 6),
(10, 'Ammunation2Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 2, '2400.3461914063', '-1979.5811767578', '13.546875', '0', 0, 0, 0),
(11, 'Ammunation3Rein', '1368.9825439453', '-1279.6826171875', '13.546875', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 3, 6),
(12, 'Ammunation3Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 3, '1365.9781494141', '-1279.9213867188', '13.546875', '90', 0, 0, 0),
(13, 'Ammunation4Rein', '2159.3000488281', '943.20001220703', '10.8999996185303', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 4, 6),
(14, 'Ammunation4Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 4, '2156.8212890625', '943.07867431641', '10.8203125', '90', 0, 0, 0),
(15, 'Ammunation5Rein', '2539.1000976563', '2084', '10.8999996185303', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 5, 6),
(16, 'Ammunation5Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 5, '2536.8937988281', '2083.8842773438', '10.8203125', '90', 0, 0, 0),
(17, 'Ammunation6Rein', '777.09997558594', '1871.4000244141', '5', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 6, 6),
(18, 'Ammunation6Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 6, '779.62738037109', '1871.1350097656', '4.9033632278442', '270', 0, 0, 0),
(19, 'Ammunation7Rein', '-315.79998779297', '829.79998779297', '14.300000190735', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 7, 6),
(20, 'Ammunation7Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 7, '-314.12088012695', '829.82397460938', '14.2421875', '270', 0, 0, 0),
(21, 'Ammunation8Rein', '-1508.9000244141', '2610.5', '55.900001525879', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 8, 6),
(22, 'Ammunation8Rein', '285.4885559082', '-41.805458068848', '1001.515625', 1, 8, '-1508.9138183594', '2608.6547851563', '55.8359375', '180', 0, 0, 0),
(23, 'Ammunation9Rein', '243', '-178.39999389648', '1.69999998807907', 0, 0, '285.70001220703', '-38.799999237061', '1001.5', '0', 1, 9, 6),
(24, 'Ammunation9Raus', '285.4885559082', '-41.805458068848', '1001.515625', 1, 9, '240.70440673828', '-178.20443725586', '1.578125', '90', 0, 0, 0),
(25, 'Tankstelle1Rein', '1928.5814208984', '-1776.31640625', '13.546875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.5', '0', 6, 1, 42),
(26, 'Tankstelle1Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 1, '1931.0056152344', '-1776.3616943359', '13.546875', '270', 0, 0, 0),
(27, 'Tankstelle2Rein', '-1320.4393310547', '2698.6713867188', '50.26628112793', 0, 0, '-27.307024002075', '-55.947074890137', '1003.546875', '0', 6, 2, 42),
(28, 'Tankstelle2Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 2, '-1319.7681884766', '2697.1359863281', '50.0625', '211', 0, 0, 0),
(29, 'Tankstelle3Rein', '-736.18377685547', '2747.83984375', '47.2265625', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 3, 42),
(30, 'Tankstelle3Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 3, '-736.04064941406', '2745.7670898438', '47.2265625', '180', 0, 0, 0),
(31, 'Tankstelle4Rein', '1599.119140625', '2221.8479003906', '11.0625', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 4, 42),
(32, 'Tankstelle4Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 4, '1600.7331542969', '2220.2983398438', '11.0625', '228', 0, 0, 0),
(33, 'Tankstelle5Rein', '2150.7434082031', '2733.8803710938', '11.176349639893', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 5, 42),
(34, 'Tankstelle5Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 5, '2150.6740722656', '2736.6735839844', '11.176349639893', '0.96078491210938', 0, 0, 0),
(35, 'Tankstelle6Rein', '2187.7160644531', '2469.6396484375', '11.2421875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 6, 42),
(36, 'Tankstelle6Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 6, '2190.6965332031', '2469.4348144531', '11.2421875', '270', 0, 0, 0),
(37, 'Tankstelle7Rein', '2637.3977050781', '1129.6781005859', '11.1796875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 7, 42),
(38, 'Tankstelle7Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 7, '2637.1391601563', '1126.8079833984', '11.1796875', '180', 0, 0, 0),
(39, 'Tankstelle8Rein', '2117.4780273438', '896.77563476563', '11.1796875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 8, 42),
(40, 'Tankstelle8Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 8, '2117.4055175781', '899.56024169922', '11.1796875', '0', 0, 0, 0),
(41, 'Tankstelle9Rein', '661.36114501953', '-573.43896484375', '16.3359375', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 9, 42),
(42, 'Tankstelle9Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 9, '659.90777587891', '-573.67041015625', '16.3359375', '90', 0, 0, 0),
(43, 'Tankstelle10Rein', '-78.383155822754', '-1169.9211425781', '2.1354537010193', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 10, 42),
(44, 'Tankstelle10Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 10, '-80.160499572754', '-1169.0793457031', '2.183572769165', '70', 0, 0, 0),
(45, 'Tankstelle11Rein', '-2231.4621582031', '-2558.2756347656', '31.921875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 11, 42),
(46, 'Tankstelle11Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 11, '-2233.5520019531', '-2557.080078125', '31.921875', '60', 0, 0, 0),
(47, 'Tankstelle12Rein', '-1676.1492919922', '432.20806884766', '7.1796875', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 12, 42),
(48, 'Tankstelle12Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 12, '-1675.1319580078', '431.10144042969', '7.1796875', '225', 0, 0, 0),
(49, 'Tankstelle13Rein', '53.534530639648', '1211.6439208984', '18.8912525177', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 13, 42),
(50, 'Tankstelle13Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 13, '53.592319488525', '1209.1661376953', '18.888957977295', '180', 0, 0, 0),
(51, 'ReporterRein', '-2521.1267089844', '-624.95245361328', '132.78070068359', 0, 0, '1381.0498046875', '-130.03021240234', '1002.551574707', '0', 0, 0, 0),
(52, 'ReporterRaus', '1381.2833251953', '-131.17227172852', '1002.551574707', 0, 0, '-2521.1396484375', '-623.21740722656', '132.76689147949', '0', 0, 0, 0),
(53, 'DillimoreDevilsRein', '681.65447998047', '-473.34649658203', '16.536296844482', 0, 0, '502', '-69.900001525879', '998.79998779297', '180', 11, 0, 0),
(54, 'DillimoreDevilsRaus', '501.94372558594', '-67.566619873047', '998.7578125', 11, 0, '681.55291748047', '-476.63070678711', '16.335937', '180', 0, 0, 0),
(55, 'KrankenhausRein', '-2646.908203125', '640.15930175781', '14.453125', 0, 0, '-826.40002441406', '2261.6000976563', '201.5', '180', 2, 0, 22),
(56, 'KrankenhausRaus', '-824.69769287109', '2263.7390136719', '201.44636535645', 2, 0, '-2646.9111328125', '638.09045410156', '14.453125', '180', 0, 0, 0),
(57, 'RescueTeamRein', '-2594.7961425781', '642.31427001953', '14.453125', 0, 0, '-805.13616943359', '2258.5681152344', '201.44636535645', '180', 2, 0, 0),
(58, 'RescueTeamRaus', '-805.52270507813', '2260.1394042969', '201.44636535645', 2, 0, '-2592.7153320313', '642.1640625', '14.453125', '270', 0, 0, 0),
(59, 'Bar1Rein', '2310.0454101563', '-1643.4954833984', '14.827047348022', 0, 0, '493.3600769043', '-23.411201477051', '1000.6796875', '0', 17, 1, 23),
(60, 'Bar1Raus', '493.41522216797', '-24.897438049316', '1000.671875', 17, 1, '2307.5715332031', '-1643.6647949219', '14.827047348022', '90', 0, 0, 0),
(61, 'Bar2Rein', '-2242.1430664063', '-88.239952087402', '35.3203125', 0, 0, '493.3600769043', '-23.411201477051', '1000.6796875', '0', 17, 2, 23),
(62, 'Bar2Raus', '493.41522216797', '-24.897438049316', '1000.671875', 17, 2, '-2243.9580078125', '-88.177589416504', '35.3203125', '90', 0, 0, 0),
(63, 'Bar3Rein', '2507.3933105469', '1242.2525634766', '10.8203125', 0, 0, '493.3600769043', '-23.411201477051', '1000.6796875', '0', 17, 3, 23),
(64, 'Bar3Raus', '493.41522216797', '-24.897438049316', '1000.671875', 17, 3, '2507.3522949219', '1244.1005859375', '10.8203125', '0', 0, 0, 0),
(65, 'Pizza1Rein', '-1720.9456787109', '1359.7738037109', '7.1853160858154', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 1, 29),
(66, 'Pizza1Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 1, '-1723.1636962891', '1359.8326416016', '7.1875', '90', 0, 0, 0),
(67, 'Pizza2Rein', '-1808.7166748047', '945.91345214844', '24.890625', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 2, 29),
(68, 'Pizza2Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 2, '-1806.8920898438', '943.82952880859', '24.890625', '224', 0, 0, 0),
(69, 'Pizza3Rein', '2083.3269042969', '2224.7014160156', '11.0234375', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 3, 29),
(70, 'Pizza3Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 3, '2083.0183105469', '2222.5161132813', '10.8203125', '180', 0, 0, 0),
(71, 'Pizza4Rein', '2756.7819824219', '2477.3359375', '11.0625', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 4, 29),
(72, 'Pizza4Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 4, '2754.53125', '2476.6455078125', '11.0625', '43', 0, 0, 0),
(73, 'Pizza5Rein', '2105.4875488281', '-1806.5426025391', '13.5546875', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 5, 29),
(74, 'Pizza5Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 5, '2103.0319824219', '-1806.4860839844', '13.5546875', '90', 0, 0, 0),
(75, 'Pizza6Rein', '203.47265625', '-201.93322753906', '1.578125', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 6, 29),
(76, 'Pizza6Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 6, '203.1700592041', '-204.39044189453', '1.578125', '180', 0, 0, 0),
(77, 'Pizza7Rein', '1367.5361328125', '248.31690979004', '19.566932678223', 0, 0, '372.39999389648', '-131.60000610352', '1001.5', '0', 5, 7, 29),
(78, 'Pizza7Raus', '372.31784057617', '-133.52465820313', '1001.4921875', 5, 7, '1365.5474853516', '249.2368927002', '19.566932678223', '65', 0, 0, 0),
(79, 'Burgershot1Rein', '-2336.8686523438', '-166.84481811523', '35.5546875', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 1, 10),
(80, 'Burgershot1Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 1, '-2334.8337402344', '-166.93701171875', '35.5546875', '270', 0, 0, 0),
(81, 'Burgershot2Rein', '-2355.8173828125', '1008.1403198242', '50.8984375', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 2, 10),
(82, 'Burgershot2Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 2, '-2357.9599609375', '1008.2755737305', '50.8984375', '90', 0, 0, 0),
(83, 'Burgershot3Rein', '-1912.4064941406', '827.88952636719', '35.227672576904', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 3, 10),
(84, 'Burgershot3Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 3, '-1910.8115234375', '829.82305908203', '35.171875', '316', 0, 0, 0),
(85, 'Burgershot4Rein', '1157.9177246094', '2072.2888183594', '11.0625', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 4, 10),
(86, 'Burgershot4Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 4, '1160.0430908203', '2071.885498046', '11.0625', '270', 0, 0, 0),
(87, 'Burgershot5Rein', '2169.4077148438', '2795.8676757813', '10.8203125', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 5, 10),
(88, 'Burgershot5Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 5, '2171.3488769531', '2795.7526855469', '10.8203125', '270', 0, 0, 0),
(89, 'Burgershot6Rein', '2472.8647460938', '2034.1782226563', '11.0625', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 6, 10),
(90, 'Burgershot6Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 6, '2470.7353515625', '2034.3498535156', '11.0625', '90', 0, 0, 0),
(91, 'Burgershot7Rein', '1199.1779785156', '-918.14929199219', '43.123691558838', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 7, 10),
(92, 'Burgershot7Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 7, '1199.0001220703', '-919.99383544922', '43.110973358154', '180', 0, 0, 0),
(93, 'Burgershot8Rein', '810.48480224609', '-1616.2053222656', '13.546875', 0, 0, '364.89999389648', '-73.699996948242', '1001.5', '300', 10, 8, 10),
(94, 'Burgershot8Raus', '362.85015869141', '-75.148216247559', '1001.5078125', 10, 8, '812.79284667969', '-1616.3133544922', '13.546875', '270', 0, 0, 0),
(95, 'CluckinBell1Rein', '2397.7951660156', '-1899.1820068359', '13.546875', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 1, 14),
(96, 'CluckinBell1Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 1, '2397.8657226563', '-1897.7130126953', '13.546875', '0', 0, 0, 0),
(97, 'CluckinBell2Rein', '2419.7023925781', '-1509.0545654297', '24', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 2, 14),
(98, 'CluckinBell2Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 2, '2421.3149414063', '-1508.9117431641', '23.992208480835', '270', 0, 0, 0),
(99, 'CluckinBell3Rein', '928.91650390625', '-1352.9406738281', '13.34375', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 3, 14),
(100, 'CluckinBell3Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 3, '927.33428955078', '-1352.8571777344', '13.376669883728', '90', 0, 0, 0),
(101, 'CluckinBell4Rein', '-1816.5897216797', '618.68243408203', '35.171875', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 4, 14),
(102, 'CluckinBell4Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 4, '-1816.6563720703', '616.7392578125', '35.171875', '180', 0, 0, 0),
(103, 'CluckinBell5Rein', '-2671.4887695313', '257.92929077148', '4.6328125', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 5, 14),
(104, 'CluckinBell5Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 5, '-2671.49609375', '260.10244750977', '4.6328125', '0', 0, 0, 0),
(105, 'CluckinBell6Rein', '2845.857421875', '2415.359375', '11.0625', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 6, 14),
(106, 'CluckinBell6Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 6, '2847.2763671875', '2413.8989257813', '11.0625', '224', 0, 0, 0),
(107, 'CluckinBell7Rein', '2101.8959960938', '2228.8874511719', '11.0234375', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 7, 14),
(108, 'CluckinBell7Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 7, '2103.6657714844', '2228.9313964844', '11.0234375', '270', 0, 0, 0),
(109, 'CluckinBell8Rein', '2638.4658203125', '1671.9221191406', '11.0234375', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 8, 14),
(110, 'CluckinBell8Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 8, '2636.1437988281', '1672.0407714844', '11.0234375', '90', 0, 0, 0),
(111, 'CluckinBell9Rein', '-2155.3356933594', '-2460.1875', '30.8515625', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 9, 14),
(112, 'CluckinBell9Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 9, '-2152.8540039063', '-2462.0744628906', '30.8515625', '230', 0, 0, 0),
(113, 'CluckinBell10Rein', '173.02445983887', '1177.1571044922', '14.7578125', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 10, 14),
(114, 'CluckinBell10Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 10, '171.83079528809', '1175.6199951172', '14.7578125', '147', 0, 0, 0),
(115, 'CluckinBell11Rein', '-1213.7900390625', '1830.3272705078', '41.9296875', 0, 0, '364.93682861328', '-10.032744407654', '1001.8515625', '360', 9, 11, 14),
(116, 'CluckinBell11Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 11, '-1212.0375976563', '1832.1396484375', '41.9296875', '315', 0, 0, 0),
(117, 'CluckinBell12Rein', '2393.3002929688', '2041.5599365234', '10.8203125', 0, 0, '-1212.0375976563', '1832.1396484375', '41.9296875', '360', 9, 12, 14),
(118, 'CluckinBell12Raus', '365.00491333008', '-11.844552993774', '1001.8515625', 9, 12, '2393.31640625', '2043.2506103516', '10.8203125', '360', 0, 0, 0),
(119, 'Donutladen1Rein', '-2767.8720703125', '788.85650634766', '52.78125', 0, 0, '377.00875854492', '-192.02456665039', '1000.6328125', '0', 17, 1, 17),
(120, 'Donutladen1Raus', '377.12655639648', '-193.30615234375', '1000.6328125', 17, 1, '-2766.3186035156', '788.75830078125', '52.78125', '270', 0, 0, 0),
(121, 'Donutladen2Rein', '1038.1818847656', '-1340.7321777344', '13.742406845093', 0, 0, '377.00875854492', '-192.02456665039', '1000.6328125', '0', 17, 2, 17),
(122, 'Donutladen2Raus', '377.12655639648', '-193.30615234375', '1000.6328125', 17, 2, '1038.2524414063', '-1338.8830566406', '13.7265625', '360', 0, 0, 0),
(123, 'Donutladen3Rein', '-144.11114501953', '1225.2197265625', '19.899219512939', 0, 0, '377.00875854492', '-192.02456665039', '1000.6328125', '0', 17, 3, 17),
(124, 'Donutladen3Raus', '377.12655639648', '-193.30615234375', '1000.6328125', 17, 3, '-144.11036682129', '1223.1466064453', '19.899219512939', '180', 0, 0, 0),
(125, 'YakuzaRein', '2007.9396972656', '2183.1066894531', '10.845405578613', 0, 0, '-2162.1000976563', '642.20001220703', '1052.4000244141', '90', 1, 0, 0),
(126, 'YakuzaRaus', '-2158.6501464844', '643.14221191406', '1052.375', 1, 0, '2007.7639160156', '2180.4282226563', '10.845405578613', '180', 0, 0, 0),
(127, 'AztecasRein', '1681.9674072266', '1909.779296875', '10.8203125', 0, 0, '2496', '-1695.0999755859', '1014.700012207', '180', 3, 0, 0),
(128, 'AztecasRaus', '2495.9384765625', '-1692.0838623047', '1014.7421875', 3, 0, '1681.9539794922', '1913.7822265625', '10.8203125', '0', 0, 0, 0),
(129, 'Skinshop1Rein', '2244.349609375', '-1665.5572509766', '15.4765625', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 1, 45),
(130, 'Skinshop1Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 1, '2244.8186035156', '-1664.1196289063', '15.4765625', '342', 0, 0, 0),
(131, 'Skinshop2Rein', '-2489.86328125', '-29.101196289063', '25.6171875', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 2, 45),
(132, 'Skinshop2Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 2, '-2491.9848632813', '-29.020618438721', '25.765625', '90', 0, 0, 0),
(133, 'Skinshop3Rein', '-1694.5693359375', '951.90606689453', '24.890625', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 3, 45),
(134, 'Skinshop3Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 3, '-1695.9725341797', '950.72210693359', '24.890625', '134', 0, 0, 0),
(135, 'Skinshop4Rein', '478.83346557617', '-1538.9102783203', '19.377563476563', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 4, 45),
(136, 'Skinshop4Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 4, '480.44046020508', '-1538.1251220703', '19.387655258179', '292', 0, 0, 0),
(137, 'Skinshop5Rein', '2112.8269042969', '-1211.4554443359', '23.962863922119', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 5, 45),
(138, 'Skinshop5Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 5, '2112.8579101563', '-1213.2353515625', '23.9654712677', '180', 0, 0, 0),
(139, 'Skinshop6Rein', '461.69641113281', '-1500.7390136719', '31.045923233032', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 6, 45),
(140, 'Skinshop6Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 6, '459.57516479492', '-1501.3376464844', '31.037624359131', '100', 0, 0, 0),
(141, 'Skinshop7Rein', '2802.9125976563', '2430.736328125', '11.0625', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 7, 45),
(142, 'Skinshop7Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 7, '2801.9216308594', '2428.7475585938', '11.0625', '135', 0, 0, 0),
(143, 'Skinshop8Rein', '2779.7353515625', '2453.9147949219', '11.0625', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 8, 45),
(144, 'Skinshop8Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 8, '2778.404296875', '2451.275390625', '11.0625', '140', 0, 0, 0),
(145, 'Skinshop9Rein', '2090.4724121094', '2224.6997070313', '11.0234375', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 9, 45),
(146, 'Skinshop9Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 9, '2090.5092773438', '2222.9304199219', '10.8203125', '180', 0, 0, 0),
(147, 'Skinshop10Rein', '2101.8923339844', '2257.3718261719', '11.0234375', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 10, 45),
(148, 'Skinshop10Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 10, '2103.1452636719', '2257.3791503906', '11.0234375', '270', 0, 0, 0),
(149, 'Skinshop11Rein', '-1882.2734375', '866.52081298828', '35.171875', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 11, 45),
(150, 'Skinshop11Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 11, '-1883.9555664063', '864.81463623047', '35.171875', '134', 0, 0, 0),
(151, 'Skinshop12Rein', '-2373.7736816406', '910.16839599609', '45.4453125', 0, 0, '207.86196899414', '-109.77652740479', '1005.1328125', '360', 15, 12, 45),
(152, 'Skinshop12Raus', '207.71670532227', '-111.26605987549', '1005.1328125', 15, 12, '-2375.748046875', '910.10327148438', '45.4453125', '90', 0, 0, 0),
(153, 'Supermarkt1Rein', '-2442.6889648438', '755.41796875', '35.171875', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 1, 36),
(154, 'Supermarkt1Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 1, '-2442.7192382813', '753.46875', '35.171875', '180', 0, 0, 0),
(155, 'Supermarkt2Rein', '-2224.3413085938', '331.98086547852', '35.3203125', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 2, 36),
(156, 'Supermarkt2Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 2, '-2224.2980957031', '330.66461181641', '35.3203125', '180', 0, 0, 0),
(157, 'Supermarkt3Rein', '2194.9331054688', '1991.1153564453', '12.2', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 3, 36),
(158, 'Supermarkt3Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 3, '2192.6762695313', '1990.9267578125', '12.296875', '90', 0, 0, 0),
(159, 'Supermarkt4Rein', '2884.728', '2453.8388', '11.06', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 4, 36),
(160, 'Supermarkt4Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 4, '2885.8979492188', '2451.5056152344', '11.068956375122', '222', 0, 0, 0),
(161, 'Supermarkt5Rein', '1937.825', '2307.234', '10.82', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 5, 36),
(162, 'Supermarkt5Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 5, '1936.1921386719', '2307.248046875', '10.8203125', '90', 0, 0, 0),
(163, 'Supermarkt6Rein', '2097.69', '2224.582', '11.023', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 6, 36),
(164, 'Supermarkt6Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 6, '2097.6064453125', '2222.92578125', '10.8203125', '180', 0, 0, 0),
(165, 'Supermarkt7Rein', '2247.694', '2396.168', '10.82', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 7, 36),
(166, 'Supermarkt7Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 7, '2247.736328125', '2398.4140625', '10.8203125', '360', 0, 0, 0),
(167, 'Supermarkt8Rein', '2452.481', '2065.165', '10.82', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 8, 36),
(168, 'Supermarkt8Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 8, '2452.4831542969', '2063.5935058594', '10.8203125', '180', 0, 0, 0),
(169, 'Supermarkt9Rein', '2546.466', '1972.659', '10.82', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 9, 36),
(170, 'Supermarkt9Raus', '-30.965982437134', '-92.011192321777', '1003.546875', 18, 9, '2546.4702148438', '1971.2731933594', '10.8203125', '180', 0, 0, 0),
(171, 'Supermarkt10Rein', '1315.4521484375', '-898.7373046875', '39.578125', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 10, 36),
(172, 'Supermarkt10Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 10, '1315.5340576172', '-899.31396484375', '39.578125', '180', 0, 0, 0),
(173, 'Supermarkt11Rein', '2424.2097167969', '-1742.8151855469', '13.545528411865', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 11, 36),
(174, 'Supermarkt11Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 11, '2423.1721191406', '-1741.7147216797', '13.546875', '49', 0, 0, 0),
(175, 'Tankstelle14Rein', '1000.5980834961', '-919.94421386719', '42.328125', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 14, 42),
(176, 'Tankstelle14Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 14, '999.13891601563', '-920.09088134766', '42.1796875', '100', 0, 0, 0),
(177, 'Supermarkt12Rein', '1352.436', '-1759.125', '13.508', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 12, 36),
(178, 'Supermarkt12Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 12, '1352.5418701172', '-1757.5369873047', '13.5078125', '360', 0, 0, 0),
(179, 'Supermarkt13Rein', '-180.742', '1034.869', '19.742', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 13, 36),
(180, 'Supermarkt13Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 13, '-183.01445007324', '1034.7270507813', '19.7421875', '90', 0, 0, 0),
(181, 'Supermarkt14Rein', '-1562.534', '-2732.942', '48.743', 0, 0, '-31.10000038147', '-89.400001525879', '1003.5', '0', 18, 14, 36),
(182, 'Supermarkt14Raus', '-31.017902374268', '-92.010955810547', '1003.546875', 18, 14, '-1561.2098388672', '-2734.06640625', '48.743457794189', '234', 0, 0, 0),
(183, 'Tankstelle15Rein', '-1623.5665283203', '-2693.1889648438', '48.742660522461', 0, 0, '-27.215188980103', '-55.947074890137', '1003.546875', '0', 6, 15, 42),
(184, 'Tankstelle15Raus', '-27.307024002075', '-58.268898010254', '1003.546875', 6, 15, '-1624.4028320313', '-2694.7097167969', '48.5390625', '147', 0, 0, 0),
(185, 'FahrschuleRein', '-2026.6300048828', '-102.06623840332', '35.1640625', 0, 0, '-2029.8000488281', '-116.59999847412', '1035.1999511719', '0', 3, 0, 56),
(186, 'FahrschuleRaus', '-2029.7520751953', '-119.62436676025', '1035.171875', 3, 0, '-2026.7858886719', '-100.46098327637', '35.1640625', '0', 0, 0, 0),
(187, 'Angelladen1Rein', '388.71008300781', '-1928.8646240234', '8.3437519073486', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 1, 9),
(188, 'Angelladen1Raus', '422.56927490234', '2536.42578125', '10', 10, 1, '387.36706542969', '-1928.8129882813', '8.3437519073486', '90', 0, 0, 0),
(189, 'Angelladen2Rein', '-1747.5767822266', '212.32510375977', '4.0625023841858', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 2, 9),
(190, 'Angelladen2Raus', '422.56927490234', '2536.42578125', '10', 10, 2, '-1747.619140625', '210.91751098633', '4.0625023841858', '180', 0, 0, 0),
(191, 'Angelladen3Rein', '-1354.0963134766', '2057.6555175781', '53.1171875', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 3, 9),
(192, 'Angelladen3Raus', '422.56927490234', '2536.42578125', '10', 10, 3, '-1352.7191162109', '2057.6489257813', '53.1171875', '270', 0, 0, 0),
(193, 'Gartenclub1Rein', '-2579.4284667969', '310.08010864258', '5.1796875', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 4, 62),
(194, 'Gartenclub1Raus', '422.56927490234', '2536.42578125', '10', 10, 4, '-2581.9150390625', '310.0966796875', '5.1796875', '90', 0, 0, 0),
(195, 'Gartenclub2Rein', '2348.5385742188', '-1372.6789550781', '24.3984375', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 5, 62),
(196, 'Gartenclub2Raus', '422.56927490234', '2536.42578125', '10', 10, 5, '2348.5583496094', '-1374.2303466797', '24.185852050781', '180', 0, 0, 0),
(197, 'Gartenclub3Rein', '1557.5874023438', '990.60266113281', '10.8203125', 0, 0, '420.50909423828', '2536.4694824219', '10', '90', 10, 6, 62),
(198, 'Gartenclub3Raus', '422.56927490234', '2536.42578125', '10', 10, 6, '1559.0003662109', '990.50494384766', '10.8203125', '270', 0, 0, 0),
(199, 'BuechereiRein', '1726.9416503906', '-1636.9664306641', '20.217359542847', 0, 0, '665', '-1207.4000244141', '2084', '180', 1, 0, 56),
(200, 'BuechereiRaus', '665.01391601563', '-1205.1339111328', '2083.9821777344', 1, 0, '1726.9653320313', '-1635.33203125', '20.216562271118', '360', 0, 0, 0),
(201, 'KircheRein', '-1989.8996582031', '1117.8793945313', '54.46875', 0, 0, '1964.0999755859', '-352.10000610352', '1092.9000244141', '180', 0, 0, 0),
(202, 'KircheRaus', '1964.0543212891', '-349.63095092773', '1092.9454345703', 0, 0, '-1987.9158935547', '1117.8063964844', '54.474472045898', '270', 0, 0, 0),
(203, 'Casino1Rein', '1471.3657226563', '-1178.0900878906', '23.921480178833', 0, 0, '2234.0185546875', '1712.8984375', '1011.9699707031', '180', 1, 1, 25),
(204, 'Casino1Raus', '2233.974609375', '1714.6827392578', '1012.3828125', 1, 1, '1470.4136962891', '-1177.0590820313', '23.924535751343', '44', 0, 0, 0),
(205, 'Casino2Rein', '2019.3173828125', '1007.7349853516', '10.8203125', 0, 0, '2234.0185546875', '1712.8984375', '1011.9699707031', '180', 1, 2, 25),
(206, 'Casino2Raus', '2233.974609375', '1714.6827392578', '1012.3828125', 1, 2, '2020.7766113281', '1007.7391357422', '10.8203125', '270', 0, 0, 0),
(207, 'Casino3Rein', '2330.4113769531', '2166.1135253906', '10.828125', 0, 0, '2234.0185546875', '1712.8984375', '1011.9699707031', '180', 1, 3, 25),
(208, 'Caisno3Rein', '2233.974609375', '1714.6827392578', '1012.3828125', 1, 3, '2331.5598144531', '2165.2666015625', '10.828125', '240', 0, 0, 0),
(209, 'Casino4Rein', '-2463.4816894531', '131.76693725586', '35.171875', 0, 0, '2234.0185546875', '1712.8984375', '1011.9699707031', '180', 1, 4, 25),
(210, 'Casino4Raus', '2233.974609375', '1714.6827392578', '1012.3828125', 1, 4, '-2462.119140625', '133.14950561523', '35.171875', '315', 0, 0, 0),
(211, 'BoxerjobRein', '2229.8806152344', '-1721.2368164063', '13.561038970947', 0, 0, '772.34118652344', '-4.1896843910217', '1000.7291870117', '360', 5, 1, 58),
(212, 'BoxerjobRaus', '772.26684570313', '-5.5160279273987', '1000.7283935547', 5, 1, '2228.6940917969', '-1722.4884033203', '13.555212020874', '135', 0, 0, 0),
(213, 'Friseur1Rein', '2070.6267089844', '-1793.8150634766', '13.546875', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 1, 7),
(214, 'Friseur1Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 1, '2072.4602050781', '-1793.8944091797', '13.546875', '270', 0, 0, 0),
(215, 'Friseur2Rein', '2724.4555664063', '-2026.5418701172', '13.5546875', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 2, 7),
(216, 'Friseur2Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 2, '2722.5920410156', '-2026.6192626953', '13.554688453674', '90', 0, 0, 0),
(217, 'Friseur3Rein', '823.99652099609', '-1588.2623291016', '13.543579101563', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 3, 7),
(218, 'Friseur3Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 3, '823.26153564453', '-1589.2104492188', '13.55445098877', '140', 0, 0, 0),
(219, 'Friseur4Rein', '-2571.3347167969', '246.77816772461', '10.452730178833', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 4, 7),
(220, 'Friseur4Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 4, '-2570.3044433594', '245.61116027832', '10.115907669067', '215', 0, 0, 0),
(221, 'Friseur5Rein', '2080.2924804688', '2122.8647460938', '10.8203125', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 5, 7),
(222, 'Friseur5Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 5, '2080.3022460938', '2121.2456054688', '10.812517166138', '180', 0, 0, 0),
(223, 'Friseur6Rein', '672.08758544922', '-496.86169433594', '16.3359375', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 6, 7),
(224, 'Friseur6Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 6, '673.66003417969', '-496.84790039063', '16.3359375', '270', 0, 0, 0),
(225, 'Friseur7Rein', '-1449.8621826172', '2591.90234375', '55.8359375', 0, 0, '412.0517578125', '-53.147789001465', '1001.8983764648', '0', 12, 7, 7),
(226, 'Friseur7Raus', '412.03408813477', '-54.446605682373', '1001.8984375', 12, 7, '-1449.9790039063', '2593.8283691406', '55.8359375', '0', 0, 0, 0),
(227, 'Tattoo1Rein', '2068.580078125', '-1779.8138427734', '13.55962562561', 0, 0, '-204.34951782227', '-25.73882484436', '1002.2733764648', '0', 16, 1, 39),
(228, 'Tattoo1Raus', '-204.41191101074', '-27.34760093689', '1002.2734375', 16, 1, '2070.3361816406', '-1779.8322753906', '13.5587682724', '270', 0, 0, 0),
(229, 'Tattoo2Rein', '1976.6518554688', '-2036.6784667969', '13.546875', 0, 0, '-204.34951782227', '-25.73882484436', '1002.2733764648', '0', 16, 2, 39),
(230, 'Tattoo2Raus', '-204.41191101074', '-27.34760093689', '1002.2734375', 16, 2, '1974.736328125', '-2036.7078857422', '13.546875', '90', 0, 0, 0),
(231, 'Tattoo3Rein', '-2490.9953613281', '-38.87536239624', '25.6171875', 0, 0, '-204.34951782227', '-25.73882484436', '1002.2733764648', '0', 16, 3, 39),
(232, 'Tattoo3Raus', '-204.41191101074', '-27.34760093689', '1002.2734375', 16, 3, '-2492.9018554688', '-38.955230712891', '25.765625', '90', 0, 0, 0),
(233, 'Tattoo4Rein', '2094.7331542969', '2122.865234375', '10.8203125', 0, 0, '-204.34951782227', '-25.73882484436', '1002.2733764648', '0', 16, 4, 39),
(234, 'Tattoo4Raus', '-204.41191101074', '-27.34760093689', '1002.2734375', 16, 4, '2094.8481445313', '2120.7934570313', '10.820313453674', '180', 0, 0, 0),
(235, 'Zooladen1Rein', '1154.7310791016', '-1440.0743408203', '15.796875', 0, 0, '-2239.7758789063', '129.82789611816', '1035.4140625', '0', 6, 1, 47),
(236, 'Zooladen1Raus', '-2240.9641113281', '128.36962890625', '1035.4140625', 6, 1, '1153.3786621094', '-1440.3160400391', '15.796899795532', '0', 0, 0, 0),
(237, 'Bank1Rein', '-2057.1137695313', '454.57717895508', '35.171875', 0, 0, '388.84588623047', '173.73950195313', '1008.3828125', '90', 3, 98, 52),
(238, 'Bank1Raus', '390.7692565918', '173.82579040527', '1008.3828125', 3, 98, '-2055.1958007813', '456.36260986328', '35.171901702881', '310', 0, 0, 0),
(239, 'MatsraubRein', '-288.94421386719', '2689.7954101563', '62.8125', 0, 0, '296.8258972168', '-110.39939880371', '1001.515625', '0', 6, 98, 0),
(240, 'MatsraubRaus', '296.85159301758', '-112.07079315186', '1001.515625', 6, 98, '-289.05120849609', '2692.2878417969', '62.6875', '0', 0, 0, 0),
(241, 'Hotel1Rein', '2227.2670898438', '1840.2231445313', '10.8203125', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 1, 31),
(242, 'Hotel1Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 1, '2225.0122070313', '1840.1130371094', '10.820300102234', '90', 0, 0, 0),
(243, 'Hotel2Rein', '2016.9691162109', '1913.0145263672', '12.333923339844', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 2, 31),
(244, 'Hotel2Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 2, '2020.068359375', '1912.9849853516', '12.310700416565', '270', 0, 0, 0),
(245, 'Hotel3Rein', '2127.5102539063', '2379.5795898438', '10.8203125', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 3, 31),
(246, 'Hotel3Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 3, '2127.6127929688', '2376.9555664063', '10.820300102234', '180', 0, 0, 0),
(247, 'Hotel4Rein', '2628.1040039063', '2349.3647460938', '10.8203125', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 4, 31),
(248, 'Hotel4Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 4, '2629.0617675781', '2347.4436035156', '10.671899795532', '208', 0, 0, 0),
(249, 'Hotel5Rein', '2196.9670410156', '1677.1861572266', '12.3671875', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 5, 31),
(250, 'Hotel5Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 5, '2195.0769042969', '1677.0853271484', '12.367199897766', '90', 0, 0, 0),
(251, 'Hotel6Rein', '1310.16015625', '-1366.7956542969', '13.506429672241', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 6, 31),
(252, 'Hotel6Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 6, '1310.1741943359', '-1368.9453125', '13.555899620056', '180', 0, 0, 0),
(253, 'Hotel7Rein', '2176.9206542969', '-1770.4957275391', '13.5390625', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 7, 31),
(254, 'Hotel7Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 7, '2179.0561523438', '-1770.5029296875', '13.543800354004', '270', 0, 0, 0),
(255, 'Hotel8Rein', '325.50024414063', '-1514.8220214844', '36.032508850098', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 8, 31),
(256, 'Hotel8Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 8, '327.25720214844', '-1516.0178222656', '36.039100646973', '232', 0, 0, 0),
(257, 'Hotel9Rein', '-2426.2478027344', '338.02114868164', '36.9921875', 0, 0, '2216.2783203125', '-1150.5100097656', '1025.796875', '270', 15, 9, 31),
(258, 'Hotel9Raus', '2214.3852539063', '-1150.5047607422', '1025.796875', 15, 9, '-2423.4248046875', '336.26889038086', '36.595001220703', '242', 0, 0, 0),
(259, 'Bank2Rein', '1465.1403808594', '-1009.9213256836', '26.84375', 0, 0, '388.84588623047', '173.73950195313', '1008.3828125', '90', 3, 99, 52),
(260, 'Bank2Raus', '390.7692565918', '173.82579040527', '1008.3828125', 3, 99, '1465.3747558594', '-1013.1539916992', '26.843799591064', '180', 0, 0, 0),
(261, 'Bank3Rein', '2364.8967285156', '2377.6062011719', '10.8203125', 0, 0, '388.84588623047', '173.73950195313', '1008.3828125', '90', 3, 100, 52),
(262, 'Bank3Raus', '390.7692565918', '173.82579040527', '1008.3828125', 3, 100, '2362.4050292969', '2377.5329589844', '10.820300102234', '90', 0, 0, 0),
(263, 'Bank4Rein', '-1492.1317138672', '920.11810302734', '7.1875', 0, 0, '388.84588623047', '173.73950195313', '1008.3828125', '90', 3, 101, 52),
(264, 'Bank4Raus', '390.7692565918', '173.82579040527', '1008.3828125', 3, 101, '-1494.08203125', '919.97222900391', '7.1875', '90', 0, 0, 0),
(265, 'CasinoraubRein', '1658.4772949219', '2250.0444335938', '11.0625', 0, 0, '2147.884765625', '1602.1475830078', '1006.1677246094', '180', 1, 10, 0),
(266, 'CasinoraubRaus', '2147.8161621094', '1604.2347412109', '1006.1677246094', 1, 10, '1658.4669189453', '2252.5068359375', '11.0625', '0', 0, 0, 0),
(267, 'Puff1Rein', '2421.5688476563', '-1219.2426757813', '25.561553955078', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 1, 21),
(268, 'Puff1Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 1, '2421.541015625', '-1221.1938476563', '25.435600280762', '180', 0, 0, 0),
(269, 'Puff2Rein', '-2624.6411132813', '1412.7309570313', '7.09375', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 2, 21),
(270, 'Puff2Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 2, '-2624.041015625', '1410.7840576172', '7.0938000679016', '194', 0, 0, 0),
(271, 'Puff3Rein', '693.62176513672', '1967.6784667969', '5.5390625', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 3, 21),
(272, 'Puff3Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 3, '693.73651123047', '1965.4245605469', '5.5391001701355', '180', 0, 0, 0),
(273, 'Puff4Rein', '2506.8349609375', '2120.2939453125', '10.839809417725', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 4, 21),
(274, 'Puff4Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 4, '2506.8442382813', '2122.1101074219', '10.840299606323', '0', 0, 0, 0),
(275, 'Puff5Rein', '2353.3044433594', '-1463.4334716797', '24', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 5, 21),
(276, 'Puff5Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 5, '2350.6862792969', '-1463.7103271484', '24', '96', 0, 0, 0),
(277, 'Puff6Rein', '2543.2905273438', '1025.240234375', '10.8203125', 0, 0, '-2636.6882324219', '1403.8558349609', '906.46087646484', '0', 3, 6, 21),
(278, 'Puff6Raus', '-2636.6586914063', '1402.4660644531', '906.4609375', 3, 6, '2543.3193359375', '1023.4857177734', '10.820300102234', '0', 0, 0, 0),
(279, 'Sexshop1Rein', '1087.68359375', '-922.48034667969', '43.390625', 0, 0, '-100.33219909668', '-22.623899459839', '1000.7188110352', '0', 3, 1, 21),
(280, 'Sexshop1Raus', '-100.38702392578', '-25.038747787476', '1000.71875', 3, 1, '1087.7917480469', '-924.46960449219', '43.390598297119', '180', 0, 0, 0),
(281, 'Sexshop2Rein', '2515.314453125', '2297.3806152344', '10.8203125', 0, 0, '-100.33219909668', '-22.623899459839', '1000.7188110352', '0', 3, 2, 21),
(282, 'Sexshop2Raus', '-100.38702392578', '-25.038747787476', '1000.71875', 3, 2, '2516.767578125', '2297.3483886719', '10.820300102234', '270', 0, 0, 0),
(283, 'Sexshop3Rein', '2420.365234375', '2065.1870117188', '10.8203125', 0, 0, '-100.33219909668', '-22.623899459839', '1000.7188110352', '0', 3, 3, 21),
(284, 'Sexshop3Raus', '-100.38702392578', '-25.038747787476', '1000.71875', 3, 3, '2420.4299316406', '2063.9328613281', '10.820300102234', '180', 0, 0, 0),
(285, 'Sexshop4Rein', '2085.1203613281', '2074.0205078125', '11.0546875', 0, 0, '-100.33219909668', '-22.623899459839', '1000.7188110352', '0', 3, 4, 21),
(286, 'Sexshop4Raus', '-100.38702392578', '-25.038747787476', '1000.71875', 3, 4, '2086.5952148438', '2073.9990234375', '11.054699897766', '270', 0, 0, 0),
(287, 'Airport1Rein', '-1421.1424560547', '-287.00106811523', '14.1484375', 0, 0, '1725.6107177734', '-2242.3361816406', '39.380298614502', '0', 1, 1, 5),
(288, 'Airport1Raus', '1725.4200439453', '-2243.4477539063', '39.380271911621', 1, 1, '-1422.6868896484', '-288.78799438477', '14.148400306702', '136', 0, 0, 0),
(289, 'Airport2Rein', '1642.3043212891', '-2335.4982910156', '13.546875', 0, 0, '1725.6107177734', '-2242.3361816406', '39.380298614502', '0', 1, 2, 5),
(290, 'Airport2Raus', '1725.4200439453', '-2243.4477539063', '39.380271911621', 1, 2, '1642.2220458984', '-2332.9267578125', '13.546899795532', '0', 0, 0, 0),
(291, 'Airport3Rein', '1672.5363769531', '1447.8387451172', '10.788097381592', 0, 0, '1725.6107177734', '-2242.3361816406', '39.380298614502', '0', 1, 3, 5),
(292, 'Airport3Raus', '1725.4200439453', '-2243.4477539063', '39.380271911621', 1, 3, '1675.2386474609', '1447.7423095703', '10.788000106812', '266', 0, 0, 0),
(293, 'Gym1Rein', '-2270.6481933594', '-155.94403076172', '35.3203125', 0, 0, '772.34118652344', '-4.1896843910217', '1000.7291870117', '360', 5, 2, 54),
(294, 'Gym1Raus', '772.26684570313', '-5.5160279273987', '1000.7283935547', 5, 2, '-2268.2583007813', '-155.92300415039', '35.320301055908', '270', 0, 0, 0),
(295, 'Gym2Rein', '1968.7504882813', '2295.873046875', '16.455863952637', 0, 0, '772.34118652344', '-4.1896843910217', '1000.7291870117', '360', 5, 3, 54),
(296, 'Gym2Raus', '772.26684570313', '-5.5160279273987', '1000.7283935547', 5, 3, '1966.1645507813', '2294.7729492188', '16.455900192261', '90', 0, 0, 0),
(297, 'WettbueroRein', '-2664.2521972656', '-8.9410762786865', '6.1328125', 0, 0, '833.35687255859', '7.3659000396729', '1004.1796875', '90', 3, 1, 12),
(298, 'WettbueroRaus', '834.66784667969', '7.3488054275513', '1004.1870117188', 3, 1, '-2666.1906738281', '-9.0776996612549', '6.1328001022339', '90', 0, 0, 0),
(299, 'YakuzaHelipadRein', '-2171.3078613281', '645.38006591797', '1057.59375', 1, 0, '1971.4763183594', '2185.9985351563', '24.677400588989', '90', 0, 0, 0),
(300, 'YakuzaHelipadRaus', '1973.8093261719', '2185.9636230469', '24.770313262939', 0, 0, '-2170.2529296875', '643.78918457031', '1057.59375', '180', 1, 0, 0),
(301, 'FBIRein', '-1740.0185546875', '789.80798339844', '24.892105102539', 0, 0, '-1749.4158935547', '808.70501708984', '162.25540161133', '90', 0, 0, 0),
(302, 'FBIRaus', '-1747.7819824219', '808.80731201172', '162.25535583496', 0, 0, '-1737.4624023438', '789.73858642578', '24.890600204468', '270', 0, 0, 0),
(303, 'FBIHelipadRein', '-1764.3156738281', '808.49475097656', '162.25535583496', 0, 0, '-1752.6086425781', '791.83380126953', '167.65629577637', '270', 0, 0, 0),
(304, 'FBIHelipadRaus', '-1754.3149414063', '791.75592041016', '167.65625', 0, 0, '-1762.4285888672', '808.50689697266', '162.25540161133', '270', 0, 0, 0),
(305, 'Fabrik1Rein', '-2095.818359375', '-2299.107421875', '30.625', 0, 0, '2543.3781738281', '-1305.4521484375', '1025.0703125', '180', 2, 1, 0),
(306, 'Fabrik1Raus', '2541.544921875', '-1304.0124511719', '1025.0703125', 2, 1, '-2094.0712890625', '-2300.6760253906', '30.625', '230', 0, 0, 0),
(307, 'Fabrik2Rein', '-61.603935241699', '-1121.9046630859', '1.3902349472046', 0, 0, '2580.1633300781', '-1303.8432617188', '1037.7734375', '0', 2, 1, 0),
(308, 'Fabrik2Raus', '2578.7517089844', '-1305.626953125', '1037.7734375', 2, 1, '-63.801998138428', '-1121.2435302734', '1.0780999660492', '67', 0, 0, 0),
(309, 'Fabrik3Rein', '2371.9675292969', '2760.1467285156', '10.8203125', 0, 0, '2520.0288085938', '-1299.6231689453', '1048.2890625', '0', 2, 1, 0),
(310, 'Fabrik3Raus', '2521.6530761719', '-1301.9663085938', '1048.2890625', 2, 1, '2372.0324707031', '2756.9582519531', '10.820300102234', '180', 0, 0, 0),
(311, 'Fabrik4Rein', '207.84254455566', '-61.688583374023', '1.9765625', 0, 0, '963.10559082031', '2107.9116210938', '1011.0302734375', '90', 1, 1, 0),
(312, 'Fabrik4Raus', '965.380859375', '2107.8835449219', '1011.0302734375', 1, 1, '207.96560668945', '-65.135597229004', '1.5780999660492', '180', 0, 0, 0),
(313, 'PDFortCarsonRein', '-217.84478759766', '979.17004394531', '19.504098892212', 0, 0, '246.80000305176', '64.5', '1003.5999755859', '0', 6, 1, 30),
(314, 'PDFortCarsonRaus', '246.7957611084', '62.32385635376', '1003.640625', 6, 1, '-216.69999694824', '979.09997558594', '19.5', '270', 0, 0, 0),
(315, 'LSPDRein', '1555.5017089844', '-1675.5649414063', '16.1953125', 0, 0, '246.80000305176', '64.5', '1003.5999755859', '0', 6, 2, 30),
(316, 'LSPDRaus', '246.7957611084', '62.32385635376', '1003.640625', 6, 2, '1553.4000244141', '-1675.5999755859', '16.200000762939', '90', 0, 0, 0),
(317, 'LVPDRein', '2290.146484375', '2432.0866699219', '10.8203125', 0, 0, '238.80000305176', '141', '1003', '0', 3, 1, 30),
(318, 'LVPDRaus', '238.73838806152', '138.62467956543', '1003.0234375', 3, 1, '2290.1000976563', '2429.1000976563', '10.800000190735', '180', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trucker`
--

CREATE TABLE `trucker` (
  `ID` int NOT NULL,
  `Artikel` text NOT NULL,
  `Menge` int NOT NULL,
  `Name` text NOT NULL,
  `Kosten` int NOT NULL,
  `Lieferungstyp` text NOT NULL,
  `Gewinn` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unternehmenlager`
--

CREATE TABLE `unternehmenlager` (
  `ID` int NOT NULL,
  `Geld` int NOT NULL DEFAULT '0',
  `Rang` int NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unternehmenlager`
--

INSERT INTO `unternehmenlager` (`ID`, `Geld`, `Rang`) VALUES
(1, 50000, 5),
(2, 50000, 5),
(3, 50000, 5),
(4, 50000, 5),
(5, 50000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int NOT NULL,
  `Model` int NOT NULL,
  `Spawnx` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Spawny` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Spawnz` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Spawnrotz` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Benzin` int NOT NULL DEFAULT '100',
  `Kilometer` int NOT NULL DEFAULT '0',
  `Fraktion` int NOT NULL,
  `Unternehmen` int NOT NULL,
  `Rang` int NOT NULL,
  `Tunings` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `Color` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0|0|0',
  `Kennzeichen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Besitzer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Schluessel` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `Abgeschleppt` int NOT NULL DEFAULT '0',
  `Explos` int DEFAULT '0',
  `Firma` int NOT NULL DEFAULT '0',
  `VergebeneKeys` int NOT NULL DEFAULT '0',
  `Sportmotor` int NOT NULL DEFAULT '0',
  `Preis` int NOT NULL DEFAULT '0',
  `Kofferraum` varchar(50) NOT NULL DEFAULT '0|0|0|0',
  `LetzterFahrer` varchar(50) NOT NULL DEFAULT 'Niemand'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `vehicles`
--

INSERT INTO `vehicles` (`ID`, `Model`, `Spawnx`, `Spawny`, `Spawnz`, `Spawnrotz`, `Benzin`, `Kilometer`, `Fraktion`, `Unternehmen`, `Rang`, `Tunings`, `Color`, `Kennzeichen`, `Besitzer`, `Schluessel`, `Abgeschleppt`, `Explos`, `Firma`, `VergebeneKeys`, `Sportmotor`, `Preis`, `Kofferraum`, `LetzterFahrer`) VALUES
(0, 522, '-2285.923828125', '1047.6962890625', '55.578098297119', '270', 85, 60, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '55|187|154', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(1, 566, '707.562500', '-458.142578', '16.117752', '88.593750', 54, 165, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 1, 0, 0, 0, 0, '0|0|0|0', ''),
(2, 566, '-301.060547', '2693.984375', '62.463947', '270.747070', 90, 253, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 2, 0, 0, 0, 0, '0|0|0|0', ''),
(3, 566, '708.013672', '-461.210938', '16.092239', '90.109863', 0, 297, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 1, 0, 0, 0, 0, '0|0|0|0', ''),
(4, 413, '703.67498779297', '-439.18630981445', '16.483200073242', '90', 67, 105, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(5, 487, '686.74090576172', '-459.9169921875', '22.667699813843', '0', 83, 154, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 1, 0, 0, 0, 0, '0|0|0|0', ''),
(6, 463, '694.20031738281', '-472.50219726563', '15.950200080872', '270', 59, 83, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(7, 463, '694.20031738281', '-473.84008789063', '15.950200080872', '270', 79, 130, 8, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Dillimore Devils', 'Dillimore Devils', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(8, 567, '-1983.891602', '126.653320', '27.560247', '2.966309', 19, 412, 7, 0, 0, '0|0|0|0|0|0|0|0|1008|1087|0|0|0|0|0|0|0|', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(9, 567, '1646.0224609375', '1943.537109375', '10.798700332642', '270', 73, 185, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 1, 0, 0, 0, 0, '0|0|0|0', ''),
(10, 567, '1646.0224609375', '1946.400390625', '10.798700332642', '270', 61, 181, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(11, 534, '1668.4775390625', '1954.1328125', '10.643199920654', '180', 62, 251, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(12, 468, '1677.462890625', '1915.07421875', '10.580300331116', '0', 45, 159, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(13, 468, '1678.794921875', '1915.07421875', '10.580300331116', '0', 74, 16, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(14, 487, '1664.8671875', '1906.37890625', '17.330200195313', '0', 60, 72, 7, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Los Aztecas', 'Los Aztecas', '', 0, 1, 0, 0, 0, 0, '0|0|0|0', ''),
(15, 545, '-1455.5169677734', '2643.224609375', '55.785900115967', '270', 90, 51, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(16, 545, '-1455.5169677734', '2640.3505859375', '55.785900115967', '270', 89, 57, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(17, 439, '-1455.2370605469', '2635.537109375', '55.835899353027', '270', 96, 15, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(18, 439, '-1455.2370605469', '2632.6384277344', '55.835899353027', '270', 78, 102, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(19, 487, '-1446.4645996094', '2616.6008300781', '61.326599121094', '90', 76, 140, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 2, 0, 0, 0, 0, '0|0|0|0', ''),
(20, 521, '-1461.5729980469', '2659.275390625', '55.496299743652', '180', 17, 147, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(21, 521, '-1460.2406005859', '2659.275390625', '55.496299743652', '180', 81, 26, 9, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mafia', 'Mafia', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(22, 560, '2018.8421630859', '2127.4140625', '10.62530040741', '0', 100, 0, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(23, 560, '2015.0229492188', '2127.4140625', '10.62530040741', '0', 92, 13, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(24, 560, '2011.5063476563', '2127.4140625', '10.62530040741', '0', 99, 0, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(25, 418, '2007.6882324219', '2127.4106445313', '11.003299713135', '0', 100, 0, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(26, 461, '2046.6303710938', '2140.70703125', '10.494799613953', '0', 31, 247, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(27, 461, '2045.4272460938', '2140.70703125', '10.494799613953', '0', 63, 178, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(28, 487, '1950.1057128906', '2169.0461425781', '24.942399978638', '90', 88, 62, 6, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Yakuza', 'Yakuza', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(29, 597, '-1596.1162109375', '675.380859375', '-5.4949498176575', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(30, 597, '-1600.201171875', '675.380859375', '-5.4949498176575', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(31, 597, '-1600.205078125', '693.705078125', '-5.4949502944946', '180', 39, 202, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(32, 597, '-1604.2119140625', '693.705078125', '-5.4949502944946', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(33, 597, '-1608.2919921875', '693.705078125', '-5.4949502944946', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(34, 597, '-1612.44921875', '693.705078125', '-5.4949502944946', '180', 95, 7, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(35, 597, '-1616.607421875', '693.705078125', '-5.4949502944946', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(36, 597, '-1620.84375', '693.705078125', '-5.4949498176575', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(37, 597, '-1624.6884765625', '693.705078125', '-5.4949498176575', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(38, 597, '-1628.701171875', '693.705078125', '-5.4949498176575', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(39, 597, '-1632.73046875', '693.705078125', '-5.4949498176575', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(40, 597, '-1572.610352', '710.291992', '-5.474220', '89.620972', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(41, 597, '-1572.610352', '714.197266', '-5.473171', '90.373535', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(42, 597, '-1572.610352', '730.30908203125', '-5.451536', '88.088379', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(44, 597, '-1572.610352', '726.30310058594', '-5.445163', '89.879150', 98, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(45, 597, '-1572.610352', '721.98321533203', '-5.474197', '88.824463', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(47, 597, '-1572.610352', '742.898438', '-5.473053', '89.950562', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(48, 597, '-1572.610352', '717.74615478516', '-5.6181879043579', '90', 98, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(49, 597, '-1572.610352', '705.915039', '-5.474064', '90.983276', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(50, 427, '-1638.816406', '682.037109', '-5.110634', '268.516846', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(51, 427, '-1638.925781', '674.313477', '-5.110345', '267.209473', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(52, 427, '-1639.063477', '686.118164', '-5.109540', '271.054688', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(53, 427, '-1639.248047', '678.434570', '-5.110505', '269.912109', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(54, 427, '-1638.654297', '669.811523', '-5.110250', '268.692627', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(55, 427, '-1638.761719', '666.082031', '-5.110289', '269.187012', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(56, 427, '-1638.760742', '662.042969', '-5.110296', '269.895630', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(57, 427, '-1638.880859', '649.701172', '-5.110525', '268.472900', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(58, 427, '-1638.910156', '657.917969', '-5.110460', '271.021729', 99, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(59, 427, '-1638.871094', '653.916016', '-5.110283', '269.379272', 93, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(60, 601, '-1622.525390625', '649.5791015625', '-5.5533518791199', '90', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(61, 601, '-1622.525390625', '653.7431640625', '-5.5533518791199', '90', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(62, 599, '-1579.974609375', '750.3798828125', '-5.1449222564697', '180', 91, 24, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(63, 599, '-1583.9755859375', '750.3798828125', '-5.1449222564697', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(64, 599, '-1588.04296875', '750.37890625', '-5.14350938797', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(65, 597, '-1592.1689453125', '750.2373046875', '-5.4893350601196', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(66, 597, '-1596.271484375', '750.2373046875', '-5.4893350601196', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(67, 597, '-1600.3408203125', '750.2373046875', '-5.4893350601196', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(68, 597, '-1604.4189453125', '750.2373046875', '-5.4893350601196', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(69, 597, '-1608.6708984375', '750.2373046875', '-5.4893350601196', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(70, 597, '-713.612305', '1155.518555', '30.495167', '119.789429', 89, 43, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(71, 597, '-645.429688', '1180.948242', '27.517035', '100.640259', 78, 74, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(72, 523, '-1611.162109375', '730.337890625', '-5.5883479118347', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(73, 523, '-1612.49609375', '730.341796875', '-5.6774206161499', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(74, 523, '-1614.0654296875', '730.341796875', '-5.6774206161499', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(75, 523, '-1615.634765625', '730.341796875', '-5.6774206161499', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(76, 523, '-1617.2041015625', '730.341796875', '-5.6774206161499', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(77, 497, '-1680.3707275391', '705.16790771484', '31.166600036621', '0', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(78, 411, '-1728.373046875', '751.1689453125', '24.612928390503', '0', 97, 5, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(79, 411, '-1731.4296875', '751.1689453125', '24.612533569336', '0', 96, 14, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(80, 411, '-1734.3544921875', '751.1689453125', '24.612533569336', '0', 44, 250, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(81, 411, '-1737.298828125', '751.1689453125', '24.612533569336', '0', 0, 178, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(82, 490, '-1759.1396484375', '761.5185546875', '25.02236366272', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(83, 490, '-1762.591796875', '761.5185546875', '25.023071289063', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(84, 490, '-1766.009765625', '761.5185546875', '25.022338867188', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(85, 490, '-1769.6181640625', '761.5185546875', '25.015357971191', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(86, 490, '-1773.1484375', '761.5185546875', '25.015357971191', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(87, 490, '-1776.6005859375', '761.517578125', '25.014684677124', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(88, 490, '-1780.208984375', '761.517578125', '25.014684677124', '180', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(89, 528, '-1787.1865234375', '766.619140625', '24.898220062256', '90', 90, 24, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(90, 528, '-1787.1865234375', '769.8369140625', '24.898220062256', '90', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(91, 528, '-1787.1865234375', '773.3212890625', '24.896831512451', '90', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(92, 528, '-1787.1865234375', '776.59375', '24.896831512451', '90', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(93, 487, '-1746.44921875', '797.94982910156', '167.92129516602', '90', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(94, 487, '-1746.44921875', '784.583984375', '167.92129516602', '90', 100, 0, 2, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'F.B.I', 'F.B.I', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(95, 428, '-1611.9130859375', '674.25750732422', '7.4373002052307', '180', 44, 55, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(96, 428, '-1606.0317382813', '674.25750732422', '7.4373002052307', '180', 82, 36, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(97, 428, '-1600.1497802734', '674.25750732422', '7.4373002052307', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(98, 428, '-1594.1729736328', '674.25750732422', '7.4373002052307', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(99, 428, '-1588.0635986328', '674.25750732422', '7.4373002052307', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(100, 428, '-1582.2928466797', '674.25750732422', '7.4373002052307', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(101, 428, '-1576.255859375', '674.25750732422', '7.4373002052307', '180', 100, 0, 1, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'SAPD', 'SAPD', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(240, 525, '-2046.3115234375', '124.2919921875', '28.739854812622', '0.054931640625', 100, 0, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(241, 525, '-2050.0927734375', '124.3212890625', '28.685747146606', '0.4833984375', 100, 0, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(242, 525, '-2054.0244140625', '124.4248046875', '28.375017166138', '0.780029296875', 87, 4, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(243, 525, '-2046.3251953125', '146.1591796875', '28.69358253479', '180', 91, 5, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(244, 525, '-2050.0908203125', '146.1591796875', '28.693584442139', '180', 96, 3, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(245, 525, '-2053.9677734375', '146.1591796875', '28.693521499634', '180', 85, 37, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(246, 578, '-2037.71484375', '139.5478515625', '29.440406799316', '270', 98, 0, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(247, 586, '-2032.56640625', '157.8388671875', '28.551820755005', '0', 100, 0, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(248, 586, '-2032.56640625', '161.53451538086', '28.551820755005', '0', 87, 34, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(249, 586, '-2032.56640625', '151.79583740234', '28.559406280518', '359.3408203125', 87, 0, 0, 1, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Mechaniker', 'Mechaniker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(250, 487, '-2032.2802734375', '-106.7470703125', '39.115428924561', '269.99450683594', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(251, 405, '-2093.93359375', '-83.6064453125', '35.013870239258', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(252, 405, '-2089.5693359375', '-83.6064453125', '35.013870239258', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(253, 405, '-2085.33203125', '-83.6064453125', '35.012298583984', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(254, 531, '-2081.140625', '-83.5654296875', '35.138359069824', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(255, 531, '-2076.8232421875', '-83.5693359375', '35.127239227295', '179.99450683594', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(256, 403, '-2090.6923828125', '-100.341796875', '35.701248168945', '270', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(257, 521, '-2074.1630859375', '-81.619140625', '34.736442565918', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(258, 521, '-2071.2978515625', '-81.619140625', '34.736442565918', '180', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(259, 511, '-2023.1596679688', '-268.28530883789', '36.836200714111', '0', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(260, 593, '-2088.6137695313', '-273.70071411133', '35.870498657227', '0', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(261, 582, '-2535.5625', '-602.6396484375', '132.57052612305', '180', 100, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(262, 582, '-2531.7998046875', '-602.6396484375', '132.57052612305', '180', 100, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(263, 582, '-2528.146484375', '-602.6396484375', '132.57052612305', '180', 100, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(264, 582, '-2524.3017578125', '-602.6396484375', '132.57052612305', '180', 100, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(265, 582, '-2520.6923828125', '-602.6396484375', '132.57052612305', '180', 99, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(266, 582, '-2516.84765625', '-602.6396484375', '132.57052612305', '180', 86, 70, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(267, 480, '-2513.1611328125', '-601.5068359375', '132.31385803223', '180', 62, 88, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(268, 480, '-2509.738281', '-602.338867', '132.334076', '182.977295', 0, 89, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(269, 480, '-2505.6279296875', '-601.5068359375', '132.31385803223', '180', 50, 111, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(270, 480, '721.815430', '-463.361328', '16.071508', '351.210938', 27, 418, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(271, 586, '-2499.1640625', '-601.3251953125', '132.09873962402', '180', 100, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(272, 586, '-2497.2802734375', '-601.3251953125', '132.09873962402', '180', 90, 30, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(273, 409, '-2537.5703125', '-623.8779296875', '132.4592590332', '269.99450683594', 99, 0, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(274, 488, '-2522.16796875', '-640.33984375', '148.05352783203', '270', 95, 1, 0, 2, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Reporter', 'Reporter', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(275, 403, '-540.587890625', '-557.9169921875', '26.058898925781', '0', 90, 24, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(276, 403, '-536.5869140625', '-557.9169921875', '26.058898925781', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(277, 403, '-532.5068359375', '-557.9169921875', '26.058898925781', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(278, 403, '-528.26953125', '-557.9169921875', '26.058897018433', '0', 77, 32, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(279, 403, '-524.0341796875', '-557.9169921875', '26.058897018433', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(280, 403, '-519.640625', '-557.9169921875', '26.058897018433', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(281, 403, '-515.2470703125', '-557.9169921875', '26.060661315918', '0', 86, 60, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(282, 403, '-510.8544921875', '-557.9169921875', '26.060661315918', '0', 68, 16, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(283, 578, '-472.0458984375', '-527.546875', '26.062662124634', '90', 64, 162, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(284, 578, '-472.0458984375', '-531.251953125', '26.071781158447', '89.994506835938', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(285, 578, '-472.0458984375', '-534.7802734375', '26.081567764282', '90', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(286, 578, '-472.0458984375', '-538.380859375', '26.081567764282', '90', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(287, 578, '-472.0458984375', '-542.0595703125', '26.081567764282', '90', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(288, 578, '-472.0458984375', '-545.66015625', '26.081567764282', '90', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(289, 578, '-472.0458984375', '-549.181640625', '26.081567764282', '90', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(290, 578, '-472.046875', '-552.8486328125', '26.078702926636', '89.994506835938', 76, 124, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(291, 443, '-500.451171875', '-492.5693359375', '26.239053726196', '180', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(292, 443, '-495.2841796875', '-492.5693359375', '26.236356735229', '180', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(293, 443, '-490.2626953125', '-492.5693359375', '26.236356735229', '180', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(294, 443, '-485.1630859375', '-492.5693359375', '26.236356735229', '180', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(295, 609, '-575.2939453125', '-558.1943359375', '25.552726745605', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(296, 609, '-578.5439453125', '-558.1943359375', '25.552726745605', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(297, 609, '-581.7666015625', '-558.1953125', '25.557996749878', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(298, 609, '-585.0458984375', '-558.1953125', '25.557996749878', '0', 74, 110, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(299, 609, '-588.3125', '-558.1962890625', '25.565315246582', '0', 96, 1, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(300, 456, '-595.99609375', '-556.6943359375', '25.661050796509', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(301, 456, '-599.5263671875', '-556.6943359375', '25.661050796509', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(302, 456, '-603.0087890625', '-556.6943359375', '25.661050796509', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(303, 414, '-618.4814453125', '-557.8212890625', '25.57964515686', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(304, 414, '-615.42578125', '-557.8212890625', '25.579643249512', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(305, 414, '-612.2978515625', '-557.8212890625', '25.579643249512', '0', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Trucker', 'Trucker', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(306, 416, '-2628.138671875', '604.0751953125', '14.546310424805', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(307, 416, '-2631.6591796875', '604.0751953125', '14.546310424805', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(308, 416, '-2635.2265625', '604.0751953125', '14.546310424805', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(309, 416, '-2639.0390625', '604.0751953125', '14.546310424805', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(310, 416, '-2642.580078125', '604.0751953125', '14.546310424805', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(311, 416, '-2645.9765625', '604.0751953125', '14.54137802124', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(312, 416, '-2653.427734375', '604.0751953125', '14.54137802124', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(313, 416, '-2657.037109375', '604.0751953125', '14.54137802124', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(314, 416, '-2660.568359375', '604.0751953125', '14.54137802124', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(315, 416, '-2663.9560546875', '604.07647705078', '14.75269985199', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(316, 416, '-2667.6999511719', '604.07647705078', '14.75269985199', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(317, 416, '-2671.3095703125', '604.07647705078', '14.75269985199', '0', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(318, 560, '-2709.1279296875', '589.17327880859', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(319, 560, '-2709.1171875', '591.7626953125', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(320, 560, '-2709.1064453125', '594.45458984375', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(321, 560, '-2709.095703125', '597.15197753906', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(322, 560, '-2709.0849609375', '599.8984375', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(323, 560, '-2709.07421875', '602.64477539063', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(324, 560, '-2709.0632324219', '605.40991210938', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(325, 560, '-2709.0522460938', '608.23498535156', '14.258099555969', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(326, 407, '-2589.1142578125', '622.3564453125', '14.800990104675', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(327, 407, '-2589.1142578125', '627.66015625', '14.800990104675', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(328, 407, '-2589.1142578125', '632.6904296875', '14.797671318054', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(329, 407, '-2589.1142578125', '637.69921875', '14.797671318054', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(330, 407, '-2589.1142578125', '647.798828125', '14.797671318054', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(331, 407, '-2589.1142578125', '652.8876953125', '14.797671318054', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(332, 407, '-2589.119140625', '658.06640625', '14.653919219971', '270', 100, 0, 0, 3, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Rescue Team', 'Rescue Team', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(333, 452, '-1766.1875', '-194.93190002441', '0', '270', 100, 0, 0, 5, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(334, 584, '-618.34777832031', '-519.77038574219', '26.682800292969', '270', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(335, 584, '-618.34777832031', '-524.18481445313', '26.682800292969', '270', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(336, 584, '-618.34777832031', '-528.330078125', '26.682800292969', '270', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', ''),
(337, 584, '-618.34777832031', '-532.42199707031', '26.682800292969', '270', 100, 0, 0, 4, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', '0|0|0', 'Fahrschule', 'Fahrschule', '', 0, 0, 0, 0, 0, 0, '0|0|0|0', '');

-- --------------------------------------------------------

--
-- Table structure for table `waffenbox`
--

CREATE TABLE `waffenbox` (
  `ID` int NOT NULL,
  `Username` text NOT NULL,
  `Slot1Gun` int NOT NULL DEFAULT '1337',
  `Slot1Ammo` int NOT NULL DEFAULT '0',
  `Slot2Gun` int NOT NULL DEFAULT '1337',
  `Slot2Ammo` int NOT NULL DEFAULT '0',
  `Slot3Gun` int NOT NULL DEFAULT '1337',
  `Slot3Ammo` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waffenbox`
--

INSERT INTO `waffenbox` (`ID`, `Username`, `Slot1Gun`, `Slot1Ammo`, `Slot2Gun`, `Slot2Ammo`, `Slot3Gun`, `Slot3Ammo`) VALUES
(1, 'BEMYDRE4M', 1337, 0, 1337, 0, 1337, 0);

-- --------------------------------------------------------

--
-- Table structure for table `watervehicles`
--

CREATE TABLE `watervehicles` (
  `ID` int NOT NULL,
  `Model` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Rotz` varchar(50) NOT NULL,
  `Level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wohnwagen`
--

CREATE TABLE `wohnwagen` (
  `ID` int NOT NULL,
  `Spawnx` varchar(50) NOT NULL,
  `Spawny` varchar(50) NOT NULL,
  `Spawnz` varchar(50) NOT NULL,
  `Spawnrotz` varchar(50) NOT NULL,
  `Besitzer` text NOT NULL,
  `Schloss` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zahlungen`
--

CREATE TABLE `zahlungen` (
  `ID` int NOT NULL,
  `Summe` varchar(50) NOT NULL,
  `Type` text NOT NULL,
  `Name` text NOT NULL,
  `Empfaenger` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zoohandlung`
--

CREATE TABLE `zoohandlung` (
  `ID` int NOT NULL,
  `Huhn` int NOT NULL,
  `HuhnPreis` int NOT NULL,
  `Baer` int NOT NULL,
  `BaerPreis` int NOT NULL,
  `Name` text NOT NULL,
  `Futter` int NOT NULL DEFAULT '50',
  `FutterPreis` int NOT NULL DEFAULT '10',
  `Wasser` int NOT NULL DEFAULT '50',
  `WasserPreis` int NOT NULL DEFAULT '10',
  `Spielzeug` int NOT NULL DEFAULT '50',
  `SpielzeugPreis` int NOT NULL DEFAULT '100',
  `Medizin` int NOT NULL DEFAULT '50',
  `MedizinPreis` int NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zoohandlung`
--

INSERT INTO `zoohandlung` (`ID`, `Huhn`, `HuhnPreis`, `Baer`, `BaerPreis`, `Name`, `Futter`, `FutterPreis`, `Wasser`, `WasserPreis`, `Spielzeug`, `SpielzeugPreis`, `Medizin`, `MedizinPreis`) VALUES
(1, 5, 75000, 5, 135000, 'Zoohandlung1', 25, 50, 25, 25, 25, 850, 25, 2500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ammunation`
--
ALTER TABLE `ammunation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `angelladen`
--
ALTER TABLE `angelladen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aussichtspunkte`
--
ALTER TABLE `aussichtspunkte`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `autohaus`
--
ALTER TABLE `autohaus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bars`
--
ALTER TABLE `bars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bewertungen`
--
ALTER TABLE `bewertungen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `birthday`
--
ALTER TABLE `birthday`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bonuscodes`
--
ALTER TABLE `bonuscodes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `booksausgeliehen`
--
ALTER TABLE `booksausgeliehen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `burgershot`
--
ALTER TABLE `burgershot`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cluckinbell`
--
ALTER TABLE `cluckinbell`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `donutladen`
--
ALTER TABLE `donutladen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fabrikwars`
--
ALTER TABLE `fabrikwars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fahrschule`
--
ALTER TABLE `fahrschule`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fraktionslager`
--
ALTER TABLE `fraktionslager`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `friseur`
--
ALTER TABLE `friseur`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gangareas`
--
ALTER TABLE `gangareas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gangtags`
--
ALTER TABLE `gangtags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `garagen`
--
ALTER TABLE `garagen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gartenclub`
--
ALTER TABLE `gartenclub`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `graffitis`
--
ALTER TABLE `graffitis`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `haustiere`
--
ALTER TABLE `haustiere`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `logout`
--
ALTER TABLE `logout`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lotto`
--
ALTER TABLE `lotto`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `marktplatz`
--
ALTER TABLE `marktplatz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mautstellen`
--
ALTER TABLE `mautstellen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `moebel`
--
ALTER TABLE `moebel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `moebelhaus`
--
ALTER TABLE `moebelhaus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `moebelinventory`
--
ALTER TABLE `moebelinventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `nickchanges`
--
ALTER TABLE `nickchanges`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `offlinemessages`
--
ALTER TABLE `offlinemessages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `paynspray`
--
ALTER TABLE `paynspray`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `peds`
--
ALTER TABLE `peds`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pflanzen`
--
ALTER TABLE `pflanzen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pizzeria`
--
ALTER TABLE `pizzeria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `postfach`
--
ALTER TABLE `postfach`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prestige`
--
ALTER TABLE `prestige`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rechnungen`
--
ALTER TABLE `rechnungen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sammelobjekte`
--
ALTER TABLE `sammelobjekte`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `schmied`
--
ALTER TABLE `schmied`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `schwarzesbrett`
--
ALTER TABLE `schwarzesbrett`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sexshops`
--
ALTER TABLE `sexshops`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `skinshop`
--
ALTER TABLE `skinshop`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sprunkautomaten`
--
ALTER TABLE `sprunkautomaten`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `supermarkt`
--
ALTER TABLE `supermarkt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tankstellen`
--
ALTER TABLE `tankstellen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tankstellenshop`
--
ALTER TABLE `tankstellenshop`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tattoostudio`
--
ALTER TABLE `tattoostudio`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teleporter`
--
ALTER TABLE `teleporter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trucker`
--
ALTER TABLE `trucker`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `unternehmenlager`
--
ALTER TABLE `unternehmenlager`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `waffenbox`
--
ALTER TABLE `waffenbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `watervehicles`
--
ALTER TABLE `watervehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wohnwagen`
--
ALTER TABLE `wohnwagen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `zahlungen`
--
ALTER TABLE `zahlungen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `zoohandlung`
--
ALTER TABLE `zoohandlung`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ammunation`
--
ALTER TABLE `ammunation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `atms`
--
ALTER TABLE `atms`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `aussichtspunkte`
--
ALTER TABLE `aussichtspunkte`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `autohaus`
--
ALTER TABLE `autohaus`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bars`
--
ALTER TABLE `bars`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bewertungen`
--
ALTER TABLE `bewertungen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `birthday`
--
ALTER TABLE `birthday`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonuscodes`
--
ALTER TABLE `bonuscodes`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booksausgeliehen`
--
ALTER TABLE `booksausgeliehen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burgershot`
--
ALTER TABLE `burgershot`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `donutladen`
--
ALTER TABLE `donutladen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fabrikwars`
--
ALTER TABLE `fabrikwars`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fahrschule`
--
ALTER TABLE `fahrschule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `firma`
--
ALTER TABLE `firma`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friseur`
--
ALTER TABLE `friseur`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gangareas`
--
ALTER TABLE `gangareas`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `gangtags`
--
ALTER TABLE `gangtags`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `garagen`
--
ALTER TABLE `garagen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `gartenclub`
--
ALTER TABLE `gartenclub`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `graffitis`
--
ALTER TABLE `graffitis`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `haustiere`
--
ALTER TABLE `haustiere`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `logout`
--
ALTER TABLE `logout`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lotto`
--
ALTER TABLE `lotto`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marktplatz`
--
ALTER TABLE `marktplatz`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moebel`
--
ALTER TABLE `moebel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moebelhaus`
--
ALTER TABLE `moebelhaus`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moebelinventory`
--
ALTER TABLE `moebelinventory`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nickchanges`
--
ALTER TABLE `nickchanges`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offlinemessages`
--
ALTER TABLE `offlinemessages`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pflanzen`
--
ALTER TABLE `pflanzen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pizzeria`
--
ALTER TABLE `pizzeria`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `postfach`
--
ALTER TABLE `postfach`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prestige`
--
ALTER TABLE `prestige`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `quests`
--
ALTER TABLE `quests`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rechnungen`
--
ALTER TABLE `rechnungen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sammelobjekte`
--
ALTER TABLE `sammelobjekte`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schmied`
--
ALTER TABLE `schmied`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schwarzesbrett`
--
ALTER TABLE `schwarzesbrett`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sexshops`
--
ALTER TABLE `sexshops`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skinshop`
--
ALTER TABLE `skinshop`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sprunkautomaten`
--
ALTER TABLE `sprunkautomaten`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supermarkt`
--
ALTER TABLE `supermarkt`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tankstellen`
--
ALTER TABLE `tankstellen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tankstellenshop`
--
ALTER TABLE `tankstellenshop`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tattoostudio`
--
ALTER TABLE `tattoostudio`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trucker`
--
ALTER TABLE `trucker`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unternehmenlager`
--
ALTER TABLE `unternehmenlager`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waffenbox`
--
ALTER TABLE `waffenbox`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `watervehicles`
--
ALTER TABLE `watervehicles`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wohnwagen`
--
ALTER TABLE `wohnwagen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zahlungen`
--
ALTER TABLE `zahlungen`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zoohandlung`
--
ALTER TABLE `zoohandlung`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
