-- Configuration database Cloud SQL --
gcloud sql connect name-instance -u root
CREATE DATABASE bioface_db;
USE bioface_db;

-- Create Table prediction_history --
CREATE TABLE `prediction_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `top_prediction` varchar(50) DEFAULT NULL,
  `top_prediction_accuracy` float DEFAULT NULL,
  `prediction_details_accuracy` text,
  `filename` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Check Database --
SHOW DATABASES;
SHOW TABLES;
DESCRIBE prediction_history;
SELECT * FROM prediction_history LIMIT 5;
