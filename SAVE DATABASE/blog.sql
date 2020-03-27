-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 25 Février 2019 à 17:09
-- Version du serveur :  5.7.25-0ubuntu0.16.04.2
-- Version de PHP :  7.0.33-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id` tinyint(4) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `author`
--

INSERT INTO `author` (`id`, `lastName`, `firstName`, `email`, `password`) VALUES
(2, 'Siré', 'Romain', 'romain.sire@gmx.com', '$2y$10$cEsWE/Z7i5v/KEmlOujolO5JN3wNGEVL5SbTW9SpxQTMehSsamc7C'),
(3, 'Zarella', 'Maude', 'maude.zarella@gmail.com', '$2y$10$fFMf08DP4fMQFHxQAtdun.Mrjses3W5dYx/ZCcdlSTvYI207rIua6'),
(4, 'Touille', 'Sasha', 'sasha.touille@gmail.com', '$2y$10$SWgvsnZ0wOqcnDlLSUzhF.mL1kwoyEM5i4alY6Gjtu7Vi4w76K7bG');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(8, 'Europe'),
(9, 'Asie'),
(10, 'Océanie'),
(11, 'Amérique Latine');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` mediumint(9) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publicationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `nickname`, `content`, `publicationDate`, `post_id`) VALUES
(3, 'Marc', 'Woooooooow ! super intéressant !', '2019-02-25 10:48:00', 4),
(4, 'Pauline', 'Ça casse pas trois pattes à un canard quand même...', '2019-02-25 10:52:19', 4),
(5, 'Julie', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-02-25 11:23:39', 7),
(6, 'Jeanne', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-02-25 11:23:48', 7),
(7, 'Paul', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-02-25 11:23:53', 7);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publicationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author_id` tinyint(4) DEFAULT NULL,
  `category_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `publicationDate`, `author_id`, `category_id`) VALUES
(1, 'Lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-02-18 15:37:24', 2, 8),
(2, 'Laos', 'Le Laos, en forme longue la République démocratique populaire lao, également traduit par République démocratique populaire du Laos, en lao Lao, ປະເທດລາວ et Sathalanalat Passathipatai Passasson lao, ສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ, est un pays sans accès à la mer d\'Asie du Sud-est, entouré par la Birmanie (ou Myanmar), la Thaïlande, le Cambodge, le Viêt Nam et la Chine.\r\n\r\nLa ville de Vientiane est sa capitale, la langue officielle le lao, la monnaie officielle le kip. La devise du Laos est « Paix, Indépendance, Démocratie, Unité et Prospérité », et son drapeau est constitué de trois bandes horizontales, les bandes supérieure et inférieure de couleur rouge et celle du milieu de couleur bleue, avec en son centre un disque blanc. L\'hymne national est Pheng Xat Lao. Les habitants du Laos sont nommés Laotiens.\r\n\r\nJe modifie le truc pour tester\r\n', '2019-02-18 15:45:35', 3, 9),
(3, 'Pérou', 'Le Pérou, en forme longue la république du Pérou, en espagnol Perú et República del Perú (Speaker Icon.svg audio), en quechua Piruw et Piruw Republika et en aymara Piruw et Piruw Suyu, est un pays situé dans l\'Ouest de l\'Amérique du Sud. Entouré par l\'Équateur, la Colombie, le Brésil, la Bolivie, le Chili et l\'océan Pacifique, il est le troisième plus grand pays du sous-continent par sa superficie : 1 285 220 km2. Lima, une vaste aire urbaine de 9 millions d\'habitants, est la capitale et la plus grande ville du pays. Sa capitale historique est Cuzco6, ancienne capitale de l\'empire inca.\r\n\r\nLe système politique actuel repose sur la Constitution de 1993. Depuis 2002, le Pérou a été divisé en 24 départements et un important processus de décentralisation a été mis en place. Parmi ses trois langues officielles, la plus parlée est l\'espagnol, suivie du quechua et de l\'aymara. Le nombre d\'habitants est de 31 826 018 en 2017. Les peuples descendant des Incas, principalement Quechuas et Aymaras, représentent le groupe le plus important (45 % de la population), suivis par les métis Européens/Amérindiens (37 % de la population7) et les descendants d\'Européens (15 % de la population).\r\n\r\nIl est membre du Forum de Coopération économique pour l\'Asie-Pacifique (APEC) et de la Communauté andine des nations (CAN). Le sol est la monnaie nationale péruvienne depuis 1991, en remplacement de l’inti', '2019-02-18 15:46:43', 4, 11),
(4, 'Lorem Ipsum assez long', 'Alii nullo quaerente vultus severitate adsimulata patrimonia sua in inmensum extollunt, cultorum ut puta feracium multiplicantes annuos fructus, quae a primo ad ultimum solem se abunde iactitant possidere, ignorantes profecto maiores suos, per quos ita magnitudo Romana porrigitur, non divitiis eluxisse sed per bella saevissima, nec opibus nec victu nec indumentorum vilitate gregariis militibus discrepantes opposita cuncta superasse virtute.\r\n\r\nCyprum itidem insulam procul a continenti discretam et portuosam inter municipia crebra urbes duae faciunt claram Salamis et Paphus, altera Iovis delubris altera Veneris templo insignis. tanta autem tamque multiplici fertilitate abundat rerum omnium eadem Cyprus ut nullius externi indigens adminiculi indigenis viribus a fundamento ipso carinae ad supremos usque carbasos aedificet onerariam navem omnibusque armamentis instructam mari committat.\r\n\r\nArdeo, mihi credite, Patres conscripti (id quod vosmet de me existimatis et facitis ipsi) incredibili quodam amore patriae, qui me amor et subvenire olim impendentibus periculis maximis cum dimicatione capitis, et rursum, cum omnia tela undique esse intenta in patriam viderem, subire coegit atque excipere unum pro universis. Hic me meus in rem publicam animus pristinus ac perennis cum C. Caesare reducit, reconciliat, restituit in gratiam.\r\n\r\nEtenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.\r\n\r\nCum autem commodis intervallata temporibus convivia longa et noxia coeperint apparari vel distributio sollemnium sportularum, anxia deliberatione tractatur an exceptis his quibus vicissitudo debetur, peregrinum invitari conveniet, et si digesto plene consilio id placuerit fieri, is adhibetur qui pro domibus excubat aurigarum aut artem tesserariam profitetur aut secretiora quaedam se nosse confingit.\r\n\r\nHaec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus, ne exspectemus quidem, dum rogemur; studium semper adsit, cunctatio absit; consilium vero dare audeamus libere. Plurimum in amicitia amicorum bene suadentium valeat auctoritas, eaque et adhibeatur ad monendum non modo aperte sed etiam acriter, si res postulabit, et adhibitae pareatur.\r\n\r\nEminuit autem inter humilia supergressa iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina; cuius socrus cum misceri sibi generum, flagrans eius amore, non impetraret, ut ferebatur, per palatii pseudothyrum introducta, oblato pretioso reginae monili id adsecuta est, ut ad Honoratum tum comitem orientis formula missa letali omnino scelere nullo contactus idem Clematius nec hiscere nec loqui permissus occideretur.\r\n\r\nVita est illis semper in fuga uxoresque mercenariae conductae ad tempus ex pacto atque, ut sit species matrimonii, dotis nomine futura coniunx hastam et tabernaculum offert marito, post statum diem si id elegerit discessura, et incredibile est quo ardore apud eos in venerem uterque solvitur sexus.\r\n\r\nCyprum itidem insulam procul a continenti discretam et portuosam inter municipia crebra urbes duae faciunt claram Salamis et Paphus, altera Iovis delubris altera Veneris templo insignis. tanta autem tamque multiplici fertilitate abundat rerum omnium eadem Cyprus ut nullius externi indigens adminiculi indigenis viribus a fundamento ipso carinae ad supremos usque carbasos aedificet onerariam navem omnibusque armamentis instructam mari committat.\r\n\r\nQuanta autem vis amicitiae sit, ex hoc intellegi maxime potest, quod ex infinita societate generis humani, quam conciliavit ipsa natura, ita contracta res est et adducta in angustum ut omnis caritas aut inter duos aut inter paucos iungeretur.\r\n\r\nSed si ille hac tam eximia fortuna propter utilitatem rei publicae frui non properat, ut omnia illa conficiat, quid ego, senator, facere debeo, quem, etiamsi ille aliud vellet, rei publicae consulere oporteret?\r\n\r\nPrincipium autem unde latius se funditabat, emersit ex negotio tali. Chilo ex vicario et coniux eius Maxima nomine, questi apud Olybrium ea tempestate urbi praefectum, vitamque suam venenis petitam adseverantes inpetrarunt ut hi, quos suspectati sunt, ilico rapti conpingerentur in vincula, organarius Sericus et Asbolius palaestrita et aruspex Campensis.\r\n\r\nEodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.\r\n\r\nSuperatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\r\n\r\nApud has gentes, quarum exordiens initium ab Assyriis ad Nili cataractas porrigitur et confinia Blemmyarum, omnes pari sorte sunt bellatores seminudi coloratis sagulis pube tenus amicti, equorum adiumento pernicium graciliumque camelorum per diversa se raptantes, in tranquillis vel turbidis rebus: nec eorum quisquam aliquando stivam adprehendit vel arborem colit aut arva subigendo quaeritat victum, sed errant semper per spatia longe lateque distenta sine lare sine sedibus fixis aut legibus: nec idem perferunt diutius caelum aut tractus unius soli illis umquam placet.\r\n\r\nMontius nos tumore inusitato quodam et novo ut rebellis et maiestati recalcitrantes Augustae per haec quae strepit incusat iratus nimirum quod contumacem praefectum, quid rerum ordo postulat ignorare dissimulantem formidine tenus iusserim custodiri.\r\n\r\nAbusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.\r\n\r\nHaec subinde Constantius audiens et quaedam referente Thalassio doctus, quem eum odisse iam conpererat lege communi, scribens ad Caesarem blandius adiumenta paulatim illi subtraxit, sollicitari se simulans ne, uti est militare otium fere tumultuosum, in eius perniciem conspiraret, solisque scholis iussit esse contentum palatinis et protectorum cum Scutariis et Gentilibus, et mandabat Domitiano, ex comite largitionum, praefecto ut cum in Syriam venerit, Gallum, quem crebro acciverat, ad Italiam properare blande hortaretur et verecunde.\r\n\r\nEt quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ad quos vel sedandos omnis professio medendi torpescit, excogitatum est adminiculum sospitale nequi amicum perferentem similia videat, additumque est cautionibus paucis remedium aliud satis validum, ut famulos percontatum missos quem ad modum valeant noti hac aegritudine colligati, non ante recipiant domum quam lavacro purgaverint corpus. ita etiam alienis oculis visa metuitur labes.\r\n\r\nPost haec indumentum regale quaerebatur et ministris fucandae purpurae tortis confessisque pectoralem tuniculam sine manicis textam, Maras nomine quidam inductus est ut appellant Christiani diaconus, cuius prolatae litterae scriptae Graeco sermone ad Tyrii textrini praepositum celerari speciem perurgebant quam autem non indicabant denique etiam idem ad usque discrimen vitae vexatus nihil fateri conpulsus est.', '2019-02-18 15:51:56', 3, 10),
(7, 'Île de Pâques', 'L\'île de Pâques, en rapanui Rapa Nui (« la grande Rapa » en référence à Rapa iti « la petite Rapa »)1, en espagnol Isla de Pascua, est une île du Chili isolée dans le sud-est de l’océan Pacifique, particulièrement connue pour ses statues monumentales (les moaï) et son écriture océanienne unique (le rongorongo).\r\n\r\nL’île de Pâques se trouve à 2 078 kilomètres à l’est de l\'île Pitcairn, l’île habitée la plus proche. Cet éloignement lui vaut d’être le lieu habité le plus isolé du monde au même titre que l’archipel Tristan da Cunha. D’autre part l’île est située à 2 829 km à l’ouest de l’île Alejandro Selkirk, dans les îles Juan Fernandez, à 3 525 kilomètres à l’ouest-nord-ouest des côtes chiliennes de la région du Biobío (Concepción) et à 4 256 kilomètres à l\'est-sud-est de Tahiti.\r\n\r\nL’île de forme triangulaire, d\'environ 24 kilomètres dans sa plus grande dimension, couvre 161,8 km22. La population était estimée à 6 370 habitants en 20153. Son chef-lieu est Hanga Roa.\r\n\r\nElle fut visitée par le premier Européen, le navigateur néerlandais Jakob Roggeveen, le jour de Pâques, le 6 avril 1722, et comptait alors près de 4 000 habitants. Elle fut annexée par l’Espagne en 1770 sous le nom d\'isla San Carlos, mais l\'Espagne s\'en désintéressa par la suite ; des Français s\'y installèrent après 1864 et l\'île devint une possession chilienne en 1888.\r\n\r\nDepuis 1995, le patrimoine exceptionnel de l’île est protégé et inscrit au Patrimoine mondial par l’UNESCO. Des parcs ou réserves naturelles, parfois surveillés, enserrent les zones des vestiges. La communauté rapanui veille précieusement sur les traces de ce patrimoine et constitue localement un pouvoir parallèle aux autorités chiliennes.\r\n\r\nCette île, la plus à l’est de toute l’Océanie, est célèbre pour ses vestiges mégalithiques de la civilisation autochtone Haumaka également appelée Matamua (soit « les premiers » en rapanui). Le patrimoine archéologique comprend 1 042 statues de basalte, les moaï, de 4 m de hauteur moyenne et près de 300 terrasses empierrées au pied de ces statues, les ahû. ', '2019-02-18 16:51:27', 2, 10),
(8, 'article 1', 'coucou', '2019-02-19 09:50:13', 2, 8),
(9, 'article 2', 'hey', '2019-02-19 09:50:31', 3, 9),
(10, 'article 3', 'du texte intéressant', '2019-02-19 09:50:48', 4, 10),
(11, 'article 4', 'il me faut des articles !', '2019-02-19 09:51:16', 2, 11),
(12, 'article 5', 'C\'est un peu lourd...', '2019-02-19 09:51:32', 4, 9),
(13, 'article 6', 'Mais bon...', '2019-02-19 09:51:49', 4, 8);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
