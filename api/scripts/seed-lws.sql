-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: teint_dafrique
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@teintdafrique.com','$2y$10$FLOTXhvCotTXb15i6Y8kVuEnqU6LktVWgGP2EL.hJDA1/rdgKikD2','2026-09-21 20:36:36','2026-09-23 15:37:32');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_contact_messages_created` (`created_at` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gammes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gammes` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_light` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_dark` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int unsigned DEFAULT NULL,
  `has_pdf_label` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_gammes_image` (`image_id`),
  CONSTRAINT `fk_gammes_image` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gammes`
--

LOCK TABLES `gammes` WRITE;
/*!40000 ALTER TABLE `gammes` DISABLE KEYS */;
INSERT INTO `gammes` VALUES ('eclat','ÉCLAT','Révélez votre luminosité naturelle','Curcuma & Carotte','#C97B1A','#FEF3DC','#7A4800','La gamme ÉCLAT puise dans la puissance ancestrale du curcuma et de la carotte pour révéler l\'éclat naturel de votre peau. Ces actifs dorés, utilisés depuis des siècles dans nos traditions africaines, unifient le teint, atténuent les imperfections et offrent une luminosité incomparable — sans jamais altérer votre couleur naturelle.','Curcuma — puissant antioxydant, éclairant naturel reconnu depuis des siècles dans les traditions africaines et asiatiques. Carotte — riche en bêta-carotène, elle nourrit, unifie et illumine le teint en profondeur.',NULL,1,1,'2026-09-21 23:23:45'),('hydratation','HYDRATATION','Désaltérez votre peau en profondeur','Aloe Vera & Concombre','#2A7A4F','#E8F5EE','#1A4E33','La gamme HYDRATATION allie la légèreté rafraîchissante du concombre à la puissance hydratante de l\'aloe vera. Ensemble, ils forment un bouclier d\'hydratation qui retient l\'eau, apaise les irritations et laisse la peau fraîche, souple et lumineuse tout au long de la journée — quelle que soit la chaleur tropicale.','Aloe Vera — hydratation profonde, apaisement immédiat, propriétés cicatrisantes et anti-inflammatoires naturelles. Concombre — effet fraîcheur instantané, réduit les gonflements et illumine le teint sans agresser.',NULL,0,3,'2026-09-21 23:23:45'),('nutrition','NUTRITION','Nourrissez chaque cellule de votre peau','Beurre de Mangue & Huile d\'Avocat','#6B7C2A','#F2F5E0','#3E4A18','La gamme NUTRITION célèbre les trésors nourriciers de la nature tropicale : le beurre de mangue, riche en vitamines A et E, s\'allie à l\'huile d\'avocat pour pénétrer en profondeur et nourrir intensément les peaux les plus sèches. Un soin de fond qui transforme durablement la texture et l\'éclat de votre peau.','Beurre de Mangue — ultra-nourrissant, concentré en vitamines A et E, laisse la peau soyeuse et rayonnante. Huile d\'Avocat — pénètre en profondeur, régénère et assouplit durablement les peaux les plus sèches.',NULL,1,4,'2026-09-21 23:23:45'),('reparation','RÉPARATION','Régénérez et restaurez votre peau','Huile de Marula & Collagène Marin','#8B3A52','#FCF0F3','#5A1F32','La gamme RÉPARATION associe la précieuse huile de Marula — surnommée « l\'or liquide de l\'Afrique australe » — au collagène marin pour régénérer en profondeur les peaux abîmées, fatiguées ou agressées. Une alliance de luxe naturel et de science moderne, formulée exclusivement pour la beauté africaine.','Huile de Marula — pénètre sans résidu gras, régénère et protège contre les agressions extérieures. Collagène Marin — renforce l\'élasticité cutanée, réduit les ridules et améliore le rebond de la peau.',NULL,0,2,'2026-09-21 23:23:45');
/*!40000 ALTER TABLE `gammes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `attempted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_login_attempts_email_time` (`email`,`attempted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'admin@teintdafrique.com',1,'2026-09-21 20:44:26'),(2,'admin@teintdafrique.com',1,'2026-09-21 20:44:51'),(3,'admin@teintdafrique.com',1,'2026-09-21 20:51:52'),(4,'admin@teintdafrique.com',1,'2026-09-21 22:27:48'),(5,'admin@teintdafrique.com',1,'2026-09-21 22:47:50'),(6,'admin@teintdafrique.com',1,'2026-09-21 23:01:15'),(7,'admin@teintdafrique.com',1,'2026-09-21 23:01:30'),(8,'admin@teintdafrique.com',1,'2026-09-21 23:02:09'),(9,'admin@teintdafrique.com',1,'2026-09-21 23:18:52'),(10,'admin@teintdafrique.com',1,'2026-09-21 23:19:14'),(11,'admin@teintdafrique.com',1,'2026-09-23 15:37:32');
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_bytes` int unsigned NOT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'abb4749286775fd0375a0fb4715a27df.jpg','WhatsApp Image 2026-08-24 at 13.41.42.jpeg','image/jpeg',430527,'','2026-09-21 22:32:20'),(3,'faadf8c192e6a7ffc62ba3f51d43fbc8.jpg','WhatsApp Image 2026-08-24 at 13.41.42 (3).jpeg','image/jpeg',376031,'','2026-09-21 23:03:14');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_content`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_type` enum('text','richtext','image') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_page_block` (`page`,`block_key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_content`
--

LOCK TABLES `page_content` WRITE;
/*!40000 ALTER TABLE `page_content` DISABLE KEYS */;
INSERT INTO `page_content` VALUES (1,'accueil','hero_title','text','VOTRE PEAU VAUT DE L\'OR.','2026-09-21 21:55:48'),(2,'accueil','hero_subtitle','text','Des soins naturels pensés pour célébrer, nourrir et révéler la beauté authentique de la peau noire — sans jamais chercher à la changer.','2026-09-21 21:54:40'),(3,'accueil','intro_title','text','Une femme, une conviction, une marque.','2026-09-21 20:36:36'),(4,'accueil','intro_paragraph_1','richtext','<p>Créatrice de la marque <strong>#TeintdAfriqueCosmetiques</strong>, épouse et mère, <strong>Minette KAMDEM</strong> est une Femme Camerounaise qui rêve de restaurer l\'identité et l\'image de la femme africaine en s\'impliquant activement sur les sujets tels que l\'Acceptation de soi, la Dignité africaine et la Diversité Culturelle. </p>','2026-09-21 21:56:29'),(5,'accueil','intro_paragraph_2','text','Femme de caractère, fervente défenseur de la peau noire et farouche opposante à la dénaturation de la peau noire, Minette est, avant tout, une femme dévouée qui déborde d\'ambition pour la génération féminine actuelle et celles à venir.','2026-09-21 20:36:36'),(6,'presentation','fondatrice_nom','text','Minette KAMDEM','2026-09-21 20:36:36'),(7,'presentation','fondatrice_titre','text','Fondatrice & Créatrice — #TeintdAfriqueCosmetiques','2026-09-21 20:36:36'),(8,'presentation','bio_paragraph_1','richtext','<p>Créatrice de la marque <strong>#TeintdAfriqueCosmetiques</strong>, épouse et mère, <strong>Minette KAMDEM</strong> est une Femme Camerounaise qui rêve de restaurer l\'identité et l\'image de la femme africaine en s\'impliquant activement sur les sujets tels que l\'Acceptation de soi, la Dignité africaine et la Diversité Culturelle.</p>','2026-09-21 20:36:36'),(9,'presentation','bio_paragraph_2','text','Femme de caractère, fervente défenseur de la peau noire et farouche opposante à la dénaturation de la peau noire, Minette est, avant tout, une femme dévouée qui déborde d\'ambition pour la génération féminine actuelle et celles à venir.','2026-09-21 20:36:36'),(10,'presentation','bio_paragraph_3','text','Diplômée de l\'École Supérieure de Commerce de Paris (ISC Paris Business School) où elle a obtenu un Master avant de décrocher un MBA en Stratégie digitale à l\'Institut Européen du Digital, Minette a également acquis les fondamentaux en cosmétologie de façon à pouvoir collaborer efficacement avec différents laboratoires spécialisés en cosmétiques naturels.','2026-09-21 20:36:36'),(11,'presentation','bio_paragraph_4','richtext','<p>Aujourd\'hui, à travers <strong>#TeintdAfriqueCosmetiques</strong>, elle souhaite cristalliser son ambition, son rêve. Un rêve né d\'un constat, mieux d\'une frustration. Car elle a constaté que bon nombre de produits cosmétiques existants et destinés à la peau noire conduisent à l\'éclaircissement forcé de celle-ci et par ricochet, à sa dégradation.</p>','2026-09-21 20:36:36'),(12,'presentation','quote','text','« La blancheur a été érigée en norme universelle de progrès. »','2026-09-21 20:36:36'),(13,'presentation','bio_paragraph_5','richtext','<p>Pour Minette, nous devons conserver notre authenticité quelle que soit notre carnation comme le dit le slogan de la marque, <strong>« #VOTRE_PEAU_VAUT_DE_LOR »</strong>. Après maintes réflexions, elle décide, il y a 3 ans, d\'agir pour opérer une déconstruction. La mission de <strong>#Teint_dAfrique_Cosmétiques</strong> consiste justement à changer les mentalités et contribuer à la révolution en marche de la beauté noire.</p>','2026-09-21 20:36:36'),(14,'presentation','bio_paragraph_6','richtext','<p><strong>#Teint_dAfrique_Cosmétiques</strong>, est la marque de produits cosmétiques naturels qui s\'engage à respecter votre couleur de peau et à ennoblir votre beauté grâce à des ingrédients botaniques et végétaux de la plus haute qualité et à des prix défiants toute concurrence ! Ses produits naturels sont adaptés pour tous les types de peau.</p>','2026-09-21 20:36:36'),(15,'presentation','bio_paragraph_7','richtext','<p>Pour chaque produit, nous relevons le défi de créer des formules uniques et innovantes en utilisant exclusivement des options naturelles. En trois mots, <strong>#TeintdAfriqueCosmetiques</strong> se veut être une marque <strong>#AUTHENTIQUE</strong>, <strong>#PLURIELLE</strong> et <strong>#INCLUSIVE</strong>.</p>','2026-09-21 20:36:36'),(16,'histoire','intro_title','text','Teint d\'Afrique Cosmétiques est une marque camerounaise de cosmétiques naturels, née d\'une conviction simple et ferme : nous n\'avons pas besoin d\'éclaircir notre peau pour nous sentir belles.','2026-09-21 20:36:36'),(17,'histoire','paragraph_1','text','Tout est parti d\'un constat que nous ne pouvions plus ignorer. Trop de femmes abîment leur peau avec des produits éclaircissants, dans l\'espoir d\'un teint plus uniforme, plus lumineux — pour répondre à une idée de la beauté qui n\'est pas la nôtre. Nous avons décidé d\'ouvrir une autre voie.','2026-09-21 20:36:36'),(18,'histoire','paragraph_2','text','Une cosmétique pensée pour les peaux noires et métissées. Qui les soigne, les nourrit, les révèle — sans jamais chercher à changer leur couleur.','2026-09-21 20:36:36'),(19,'histoire','paragraph_3','text','Nous formulons nos soins à partir d\'ingrédients naturels, puisés dans les richesses de notre terre : aloe vera, curcuma, carotte, citron, miel, beurre de karité. Chaque produit répond à un besoin réel de la peau : nettoyer, nourrir, hydrater, unifier le teint et révéler l\'éclat naturel.','2026-09-21 20:36:36'),(20,'histoire','paragraph_4','text','Nous avons commencé avec des moyens modestes et une exigence intacte. Cette exigence n\'a jamais baissé. De là est née une marque qui grandit, portée par une ambition qui dépasse la cosmétique.','2026-09-21 20:36:36'),(21,'histoire','paragraph_5','text','Car notre projet est aussi un projet de dignité : changer le regard porté sur la peau noire, encourager les femmes à prendre soin d\'elles sans se dépigmenter, et prouver qu\'on peut créer, en Afrique, des produits d\'excellence inspirés de nos ressources, de nos besoins et de notre identité.','2026-09-21 20:36:36'),(22,'histoire','closing_line_1','text','Notre peau n\'a pas besoin de devenir plus claire pour être belle.','2026-09-21 20:36:36'),(23,'histoire','closing_line_2','text','Elle a besoin d\'être comprise, respectée et bien entretenue.','2026-09-21 20:36:36'),(24,'histoire','closing_signature','text','C\'est la vision que nous défendons, chaque jour, à travers Teint d\'Afrique Cosmétiques.','2026-09-21 20:36:36'),(25,'contact','intro_text','text','Nous sommes à votre écoute. Écrivez-nous, appelez-nous ou retrouvez-nous sur les réseaux sociaux.','2026-09-21 20:36:36'),(26,'contact','form_title','text','Envoyez-nous un message','2026-09-21 20:36:36'),(27,'contact','form_success_message','text','Merci de nous avoir contactés. Nous vous répondrons dans les plus brefs délais.','2026-09-21 20:36:36'),(56,'accueil','hero_image','image','','2026-09-23 15:39:23'),(57,'accueil','fondatrice_image','image','','2026-09-21 23:15:44');
/*!40000 ALTER TABLE `page_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gamme_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poids` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_produits_gamme` (`gamme_id`),
  KEY `fk_produits_image` (`image_id`),
  CONSTRAINT `fk_produits_gamme` FOREIGN KEY (`gamme_id`) REFERENCES `gammes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_produits_image` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'eclat','Savon','180 g','◼',NULL,'Savon purifiant enrichi aux extraits de curcuma et de carotte. Nettoie en douceur tout en déposant les actifs éclairants dès le premier contact. Unifie progressivement le teint et laisse la peau lumineuse.',1),(2,'eclat','Lotion Visage','100 ml','◻',NULL,'TEINT UNIFIÉ. Lotion légère aux extraits de carotte et curcuma. S\'absorbe rapidement pour illuminer et unifier le teint au quotidien. À utiliser après le savon pour une synergie éclat optimale.',2),(3,'eclat','Crème de Visage','100 ml','◇',NULL,'Crème éclat concentrée au curcuma. Formule ciblée qui atténue les taches, unifie le teint et révèle la luminosité naturelle de la peau. Texture fondante, non grasse, idéale pour l\'usage quotidien matin et soir.',3),(4,'eclat','Lait Corps','500 ml','○',NULL,'Lait corps éclat enrichi aux extraits de carotte et curcuma. S\'absorbe rapidement pour nourrir et illuminer la peau du corps tout en l\'unifiant progressivement. Le geste beauté incontournable pour une peau rayonnante.',4),(5,'reparation','Savon','180 g','◼',NULL,'Savon réparateur à l\'huile de Marula. Élimine les impuretés tout en déposant les actifs régénérants dès le nettoyage. Idéal pour les peaux abîmées, il initie le processus de restauration cutanée dès la première utilisation.',1),(6,'reparation','Lotion','100 ml','◻',NULL,'Lotion régénérante post-soin à l\'huile de Marula. Légère et pénétrante, elle restaure la barrière cutanée et prépare la peau à recevoir les soins suivants. Utiliser après le savon pour une synergie réparatrice optimale.',2),(7,'reparation','Crème de Visage','100 ml','◇',NULL,'Crème régénérante au Marula et Collagène Marin. Formule concentrée qui comble les ridules, raffermit les contours et restitue l\'éclat naturel des peaux fatiguées ou stressées. Résultats visibles dès 4 semaines.',3),(8,'reparation','Lait Corps','500 ml','○',NULL,'Lait corps réparateur onctueux à l\'huile de Marula. Restaure durablement le film hydrolipidique, améliore l\'élasticité et renforce la résistance de la peau. Une sensation de confort immédiat et de peau régénérée.',4),(9,'hydratation','Savon','180 g','◼',NULL,'Savon fraîcheur à l\'aloe vera et au concombre. Nettoie en douceur et laisse une sensation de fraîcheur immédiate. Idéal pour les peaux sensibles ou les climats chauds, il prépare la peau à absorber les soins hydratants suivants.',1),(10,'hydratation','Lotion','100 ml','◻',NULL,'Lotion hydratante légère à l\'aloe vera. Formule aquatique qui sature la peau en eau et lui apporte tonus et légèreté. À utiliser matin et soir pour maintenir le niveau d\'hydratation optimal de la peau.',2),(11,'hydratation','Crème de Visage','100 ml','◇',NULL,'Crème hydratante au concombre. Texture gel-crème fraîche qui fond sur la peau pour une hydratation intense de 24h sans effet gras. Apaise les rougeurs, resserre les pores et illumine le teint progressivement.',3),(12,'hydratation','Lait Corps','500 ml','○',NULL,'Lait corps hydratant non gras enrichi en aloe vera et concombre. Formule légère et fraîche qui s\'absorbe rapidement pour une peau douce, désaltérée et lumineuse. Parfait pour les peaux mixtes en climat chaud.',4),(13,'nutrition','Savon','180 g','◼',NULL,'Savon nourrissant au beurre de mangue. Transforme le moment du soin en une expérience sensorielle riche tout en enveloppant la peau d\'une douceur incomparable. Idéal pour les peaux sèches qui ont besoin de nutrition dès le nettoyage.',1),(14,'nutrition','Lotion','100 ml','◻',NULL,'Lotion nutritive corps au beurre de mangue et huile d\'avocat. Légère mais intensément nourrissante, elle prépare et complète l\'action de la crème pour une nutrition continue et un éclat durable tout au long de la journée.',2),(15,'nutrition','Crème de Visage','100 ml','◇',NULL,'PEAU NOURRIE. Crème visage au beurre de mangue et miel. Nourrit en profondeur, régénère les cellules et laisse la peau souple, lisse et rayonnante. Formule riche idéale pour les peaux sèches à très sèches.',3),(16,'nutrition','Lait Corps','500 ml','○',NULL,'Lait corps nutrition fondant et généreux au beurre de mangue. Enveloppe la peau d\'une couche nourrissante et protectrice qui agit en profondeur pour une douceur durable. Texture onctueuse qui s\'absorbe sans laisser de film.',4);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('contact_address','Douala, Cameroun'),('contact_email','contact@teintdafrique.com'),('contact_phone',''),('facebook_url',''),('instagram_url',''),('whatsapp_number','https://wa.me/237000000000');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 17:50:19
