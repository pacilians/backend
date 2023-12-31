INSERT INTO `user` (`id`, `email`, `password`, `name`, `npp`, `role`, `description`)
VALUES  ('5c5e4a62-b4eb-45e0-b3b1-1089445c4c7b', 'admin@system.com', 'admin', 'Admin System', '001', 'ADMIN', 'Admin System');

CREATE TABLE `user` (
  `id` varchar(255) PRIMARY KEY,
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `name` varchar(255),
  `photo` longblob DEFAULT null,
  `npp` varchar(255),
  `role` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `customer` (
  `id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255),
  `email` varchar(255),
  `telephone` varchar(255),
  `expiry_date` datetime,
  `birth_date` datetime,
  `business_category` varchar(255),
  `service` varchar(255),
  `key_person_name` varchar(255),
  `key_person_dob` datetime,
  `key_person_hp` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `board_of_director` (
  `id` varchar(255) PRIMARY KEY,
  `id_customer` varchar(255),
  `name` varchar(255),
  `photo` longblob DEFAULT null,
  `npp` varchar(255),
  `role` varchar(255),
  `birth_date` datetime,
  `description` varchar(255)
);

CREATE TABLE `bank_account` (
  `id` varchar(255) PRIMARY KEY,
  `id_customer` varchar(255),
  `number` varchar(255),
  `name` varchar(255) DEFAULT ""
);

CREATE TABLE `category_mandatory` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  PRIMARY KEY (`id`, `name`)
);

CREATE TABLE `category_service` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  PRIMARY KEY (`id`, `name`)
);

CREATE TABLE `category_business` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  PRIMARY KEY (`id`, `name`)
);

CREATE TABLE `log` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_customer` varchar(255),
  `id_file` int,
  `created_at` timestamp,
  `message` text
);

CREATE TABLE `customer_file` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_customer` varchar(255),
  `name` varchar(255),
  `type` varchar(255),
  `file` longblob DEFAULT null,
  `created_at` timestamp,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `notification` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_customer` varchar(255),
  `type` varchar(255),
  `id_person` varchar(255),
  `name_person` varchar(255),
  `created_at` timestamp,
  `message` text,
  `is_read` int DEFAULT 0,
  `read_by` varchar(255) DEFAULT ""
);

CREATE TABLE `announcement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_user` varchar(255),
  `title` text,
  `content` text,
  `is_pinned` int DEFAULT 0,
  `created_at` timestamp,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `securities_account` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_customer` varchar(255),
  `kode_bk` varchar(255),
  `no_rekening_investor` varchar(255),
  `nama` varchar(255),
  `nama_tengah` varchar(255),
  `nama_belakang` varchar(255),
  `ktp` varchar(255),
  `npwp` varchar(255),
  `no_paspor` varchar(255),
  `no_pendaftaran_usaha` varchar(255),
  `tanggal_pendirian` datetime,
  `tempat_pendirian` varchar(255),
  `domisili` varchar(255),
  `tipe_investor` varchar(255),
  `jenis_kelamin` varchar(255),
  `jenis_pekerjaan` varchar(255),
  `alamat_identitas_1` varchar(255),
  `alamat_identitas_2` varchar(255),
  `kode_kota` varchar(255),
  `kode_provinsi` varchar(255),
  `kode_negara` varchar(255),
  `no_telepon` varchar(255),
  `no_hp` varchar(255),
  `email` varchar(255),
  `created_at` datetime,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `asset` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `month` int,
  `year` int,
  `total` int
);

CREATE TABLE `asset_item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_asset` int,
  `name` varchar(255),
  `auc` int,
  `type` varchar(255) DEFAULT ""
);

ALTER TABLE `log` ADD FOREIGN KEY (`id`) REFERENCES `user` (`id`);

ALTER TABLE `announcement` ADD FOREIGN KEY (`id`) REFERENCES `user` (`id`);

ALTER TABLE `board_of_director` ADD FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

ALTER TABLE `notification` ADD FOREIGN KEY (`id`) REFERENCES `customer` (`id`);

ALTER TABLE `customer_file` ADD FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

ALTER TABLE `bank_account` ADD FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

ALTER TABLE `log` ADD FOREIGN KEY (`id`) REFERENCES `customer_file` (`id`);

ALTER TABLE `securities_account` ADD FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);
