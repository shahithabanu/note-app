-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: notes_app
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` varchar(36) NOT NULL,
  `note_title` varchar(255) NOT NULL,
  `note_content` text NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES ('1943c69b-48d2-4d5e-97cd-09ec2c24a1d5','33','<p>33</p>','2025-03-11 17:49:41','2025-03-11 17:49:41','f62f0ade-1d51-44c3-98a0-889d9bc1cebd'),('28185b22-701f-464e-9f3c-a50796170c01','1','<p>1</p>','2025-03-10 13:45:45','2025-03-10 13:45:45','undefined'),('2a29aecd-4cab-4176-8d4f-aac9f65b38c6','1','<p>1</p>','2025-03-11 18:09:20','2025-03-11 18:09:20','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('377bbfde-37c4-4181-aecd-fa46e74092ed','2','<p>2</p>','2025-03-11 17:53:57','2025-03-11 17:53:57','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('3cb86770-2cd0-4a8f-83ed-d2fea8bd3554','22','<p>22</p>','2025-03-11 17:38:52','2025-03-11 17:38:52','f62f0ade-1d51-44c3-98a0-889d9bc1cebd'),('4ba59de4-230c-4d85-bd64-588ab394e8ef','2','<p>2</p>','2025-03-12 10:47:34','2025-03-12 10:47:34','7c4a2576-d203-4e3c-8c53-c2116f94372f'),('6b488dea-0eee-455c-868c-4382bf390d6d','1','<p>1</p>','2025-03-11 17:51:49','2025-03-11 17:51:49','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('6ef82b3f-e175-4f84-8a46-8f19392b9bc3','3','<p>3</p>','2025-03-11 17:54:02','2025-03-11 17:54:02','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('766897d4-a25b-4e86-827b-be53b5e27f32','1','<p>1</p>','2025-03-11 17:49:57','2025-03-11 17:49:57','f62f0ade-1d51-44c3-98a0-889d9bc1cebd'),('7f916486-30cd-4a8d-8b92-c34b5bcf8d80','1','<p>1</p>','2025-03-11 18:09:38','2025-03-11 18:09:38','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('842cb79f-311f-4c66-9232-b666db066af3','1','<p>1</p>','2025-03-11 18:09:10','2025-03-11 18:09:10','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('868e8aab-cd6c-45ec-9d0e-8bc23b7953ab','morning routine','<p>Doing Exersice,Be healthy</p>','2025-03-10 07:04:07','2025-03-10 07:04:07',NULL),('9a5c0b11-a2e2-4166-a699-f4d5d310208f','Afterternoon ','<p><strong>2Hours Study</strong></p><p><br></p><ul><li>books</li><li>About Games</li></ul>','2025-03-10 08:04:22','2025-03-10 08:06:44',NULL),('9f6c3e7b-fea4-4f78-a694-46fa4a993bd7','1','<p>1</p>','2025-03-11 08:23:26','2025-03-11 08:23:26','e18720e7-ab13-4377-9df4-63e81a3e9a3a'),('a682d776-9c71-48c1-aa7d-a9b7d5e186b0','My First Note','This is the content of my first note!','2025-03-09 17:53:43','2025-03-09 17:53:43',NULL),('aa52dc7f-08a7-44f9-9c6b-bf90d3b5f02f','My second Note','This is the content of my first note!','2025-03-09 18:41:34','2025-03-09 18:41:34',NULL),('ae69889e-b8b6-471e-a1da-ed98ee447eab','gm','<p>gm1</p>','2025-03-10 13:33:34','2025-03-10 13:33:34',NULL),('b34bc838-7496-49e8-85ce-68afe303eec2','1','<p>1</p>','2025-03-12 10:28:04','2025-03-12 10:28:04','41df400f-1192-40bd-8e63-c4a4eb6e010d'),('c44f20bb-b644-4964-91b3-083a5f37683b','My First Note','This is the content of my first note!','2025-03-09 17:52:27','2025-03-09 17:52:27',NULL),('d2f99f01-5dd3-4973-afba-e3f4f75815b9','1','<p>1</p>','2025-03-11 18:09:16','2025-03-11 18:09:16','76170ad1-fc11-47d5-8eb3-4cb8f50693cf'),('db783cea-c843-4d7c-92f1-9f24d0719ec7','wqwwertyu','<p>wqw12wsed</p>','2025-03-10 06:22:33','2025-03-10 06:28:00',NULL),('e1235711-e2f6-4a54-9fbb-b702d9082442','Gm message','<p>Good morning , Have a Greate day</p>','2025-03-09 19:41:40','2025-03-10 07:02:25',NULL),('ef73241e-2005-470c-8561-42fa87d195d5','gm','<p>12</p>','2025-03-10 14:06:27','2025-03-10 14:06:27','5aaf9ae3-ad34-4035-9a23-9122bda698cc'),('f1e18a75-e69e-49bc-9b89-a9ce8d206f96','my 3rd note','<p>third</p>','2025-03-10 05:18:22','2025-03-10 05:18:22',NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(36) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('02513337-b262-47bf-8230-6b1e6598da1d','rrrr','r@gmail.com','$2b$12$Ry8.k0DmNyovYx8vRvR4UOw6hX8dgTc9tdqCNlyUyvyxeS0nqmHI2','2025-03-12 09:24:00','2025-03-12 09:24:00'),('0de506f0-504e-45c9-ac03-0b0ba5de090b','shahitha','shahitha11@gmail.com','$2b$12$RR4/u.qKCtSRZv22NkTulOM4Y./T20K2VtlxCz.nKOgC5LtK.B7Em','2025-03-12 09:58:34','2025-03-12 09:58:34'),('29adc957-9246-46eb-ae03-c0c0af904618','shahitha','shahithaaa@gmail.com','$2b$12$JkVlgl.pNuov2mIaaIebJOhoxb6YAZxDE3RSg5wjPBZZEFRqWYY6u','2025-03-10 13:59:09','2025-03-10 13:59:09'),('3086c4c2-faf5-4ec4-a233-10e04963ca16','sahitha','sa@gmail.com','$2b$12$Xxht7znUaJR4uV8tIJjtj.oJBul44.2RTkgCQ7xjUJ..tr3LIuEnW','2025-03-10 11:05:17','2025-03-10 11:05:17'),('3a433051-ddf0-475f-bb54-6ebcd551995f','sahitha','saa@gmail.com','$2b$12$U3nrO9wi1B1MBZcWcyka.eYjcYAFVUIqdtk.II4nR0ATf7DzjEMjS','2025-03-10 13:58:03','2025-03-10 13:58:03'),('3a49d308-7355-422f-a453-3caf848e2e23','sahi','sahi@gmail.com','$2b$12$k0O9pCWqr/L9WS7fuIJbr.SthcIq7/baw4qaAn3a6.WuUDbgt87h6','2025-03-10 11:39:57','2025-03-10 11:39:57'),('41df400f-1192-40bd-8e63-c4a4eb6e010d','qqqw','qq@gmail.com','$2b$12$taninPIEHZP7NDtuPFn7p.AYtGkXTjptJqxadNWagrXiqYBKBOhMS','2025-03-12 10:27:28','2025-03-12 10:27:28'),('4aaef0f7-6a80-4faf-8722-4262a44197da','aaaa','aaa@gmail.com','$2b$12$dO5sDPGh2Z.9Hp3mkiq4reO3J3J8rgw8Tye403KBh1cMxJ8P8qWFm','2025-03-11 11:17:51','2025-03-11 11:17:51'),('4b14a83c-5645-40f0-abc0-33901ec868c5','sahitha','sa1@gmail.com','$2b$12$nbaJkJYXmSPFGMPGfjxhX.AZ.4Cym1loFjjOS11exv7mFrb8ry01S','2025-03-10 11:05:51','2025-03-10 11:05:51'),('4f55ca95-7559-42a1-a121-c697061d5808','wwwww','w@gmail.com','$2b$12$/0cVTpqTOj.3tNeYxk3CN.tjM.6hCVkGI69V/ZFsmyJWmZhqX6MfK','2025-03-12 09:44:48','2025-03-12 09:44:48'),('4f9400c3-5807-4024-8bfe-47c9b3cb366a','sahitha','sahithabanu@gmail.com','$2b$12$TYyWcpBmsK3mY1hXjX8PkONJFADiTAVKghszd6W8otGwnwerdD/JK','2025-03-10 13:20:35','2025-03-10 13:20:35'),('5aaf9ae3-ad34-4035-9a23-9122bda698cc','baaa','baaa@gmail.com','$2b$12$ONDDrnjnEAfZp7hGrIdsN.3NwUjT2KSV.w/d4TtYOnoXeMrL1J1xm','2025-03-10 14:04:08','2025-03-10 14:04:08'),('70056f36-857f-460b-967f-8fce98ee9905','dddd','d@gmail.com','$2b$12$jNeo5HQNuRgTibGqicI0res2HSQD9ZeOKeGis4CgN.xP2VQswsBMC','2025-03-11 10:34:36','2025-03-11 10:34:36'),('76170ad1-fc11-47d5-8eb3-4cb8f50693cf','1111','n@gmail.com','$2b$12$ySqOMa2w/r48umBFwJ7tcudE.KjHZQKMQNdWq0lR25ttjw28wCC5.','2025-03-11 17:51:20','2025-03-11 17:51:20'),('7c4a2576-d203-4e3c-8c53-c2116f94372f','wwww','i@gmail.com','$2b$12$knXoMFrdb5xK1jI8zMbceubYQi.BWU64Jy21iCONokziUVd/d5VtG','2025-03-12 10:47:02','2025-03-12 10:47:02'),('7d0065bd-b729-4903-bc78-a219b0ebbbc7','aaaa','aa@gmail.com','$2b$12$3bCKSSM3Ufo7KyvT6q.GV.KrrTu1SN3xs0aHz4hmlRvn7t81sNBSy','2025-03-11 11:13:03','2025-03-11 11:13:03'),('8aef814a-b8c7-4f72-ae76-18a840e12a5e','aaaa','e@gmail.com','$2b$12$AtnNKyHbVVlcnzfEwSqRwuaogyUbqnIgqNFelrGObWK9Bd0z3e0bG','2025-03-11 11:05:57','2025-03-11 11:05:57'),('a3739a7a-6834-4cb5-af99-7662844efae8','sade','1@gmail.com','$2b$12$seAjbDjJglSfCPggFMN.vekpy0BJV5uFhMK8FF9TtXYGxMRtzcJ4i','2025-03-10 14:00:20','2025-03-10 14:00:20'),('a7d83866-f795-4bb1-93af-9de5cd4e2c5b','bbbb','b@gmail.com','$2b$12$.1PlFoq/cjAiKoTEamflaOK5KNxSAou07cC/1flEuBRlbwBaefrAC','2025-03-11 09:44:56','2025-03-11 09:44:56'),('a9861a4b-a21d-437d-9e15-f4624b60f828','shahitha','shahitha@gmail.com','$2b$12$EYgMREtOEaJDiOMt4OZ8L.7TxCb7AF6L9pezhKNg8.JAF0iRdKzJu','2025-03-10 13:01:59','2025-03-10 13:01:59'),('ba39f1db-0ce7-44cd-beb5-62a79cf4dbe8','sharuk','sharuk@gmail.com','$2b$12$WyLdx4cJIfm5qQUE6jy.auYyQmHdsreBtdNVGBgFeT4H1LUAIpyYO','2025-03-10 11:33:14','2025-03-10 11:33:14'),('ba750a9d-a57e-44a4-8dbf-8470f76e572b','sahitha','c@gmail.com','$2b$12$gdAG0f9YH/7.boAatWEcSOiQXHjMzt1LCHisPYWBjd8Pl9v7Krml2','2025-03-11 10:13:01','2025-03-11 10:13:01'),('e18720e7-ab13-4377-9df4-63e81a3e9a3a','aaaa','a@gmail.com','$2b$12$UQi6iyHVlp7QFWQIGhykEONyyUe0STrCnjOWe6j65bR4sk2g9tVCe','2025-03-11 08:21:51','2025-03-11 08:21:51'),('e24db045-118e-451a-b3b9-37f0ea797eab','banu','banu@gmail.com','$2b$12$/2/1FG0yIdqDeP70i.f50uyExFTTejNz1yLh.et.x8/ql5qnN0La.','2025-03-10 12:35:43','2025-03-10 12:35:43'),('f62f0ade-1d51-44c3-98a0-889d9bc1cebd','bbbb','bb@gmail.com','$2b$12$iUfhP2.L..Z49yMaIbUffuw9Orr/ibPUxDLAX/kpFleIsD3X6rOUa','2025-03-11 17:37:04','2025-03-11 17:37:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-12  7:01:35
