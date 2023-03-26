-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
CREATE TABLE `favoriler`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ilan_id` BIGINT NOT NULL,
    `kullanici_id` BIGINT NOT NULL
);
ALTER TABLE
    `favoriler` ADD PRIMARY KEY `favoriler_id_primary`(`id`);
CREATE TABLE `kişiselBilgiler`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `ev_telefonu` INT NOT NULL,
    `is_telefonu` INT NOT NULL,
    `kullanici_id` BIGINT NOT NULL
);
ALTER TABLE
    `kişiselBilgiler` ADD PRIMARY KEY `kişiselbilgiler_id_primary`(`id`);
CREATE TABLE `ilanlar`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kategori_id` BIGINT NOT NULL,
    `kullanci_id` BIGINT NOT NULL,
    `ilanTarihi` DATETIME NOT NULL,
    `Model` TEXT NOT NULL,
    `Marka` TEXT NOT NULL
);
ALTER TABLE
    `ilanlar` ADD PRIMARY KEY `ilanlar_id_primary`(`id`);
CREATE TABLE `kullanicilar`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kullaniciAdi` TEXT NOT NULL,
    `sifre` TEXT NOT NULL
);
ALTER TABLE
    `kullanicilar` ADD PRIMARY KEY `kullanicilar_id_primary`(`id`);
CREATE TABLE `ilan_kategoriler`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kategoriAd` TEXT NOT NULL
);
ALTER TABLE
    `ilan_kategoriler` ADD PRIMARY KEY `ilan_kategoriler_id_primary`(`id`);
CREATE TABLE `Model`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kategori_id` BIGINT NOT NULL,
    `model` TEXT NOT NULL,
    `marka` TEXT NOT NULL,
    `yıl` BIGINT NOT NULL
);
ALTER TABLE
    `Model` ADD PRIMARY KEY `model_id_primary`(`id`);
ALTER TABLE
    `favoriler` ADD CONSTRAINT `favoriler_kullanici_id_foreign` FOREIGN KEY(`kullanici_id`) REFERENCES `kullanicilar`(`id`);
ALTER TABLE
    `ilanlar` ADD CONSTRAINT `ilanlar_kategori_id_foreign` FOREIGN KEY(`kategori_id`) REFERENCES `ilan_kategoriler`(`id`);
ALTER TABLE
    `kişiselBilgiler` ADD CONSTRAINT `kişiselbilgiler_kullanici_id_foreign` FOREIGN KEY(`kullanici_id`) REFERENCES `kullanicilar`(`id`);
ALTER TABLE
    `Model` ADD CONSTRAINT `model_kategori_id_foreign` FOREIGN KEY(`kategori_id`) REFERENCES `ilan_kategoriler`(`id`);
ALTER TABLE
    `favoriler` ADD CONSTRAINT `favoriler_ilan_id_foreign` FOREIGN KEY(`ilan_id`) REFERENCES `ilanlar`(`id`);
ALTER TABLE
    `ilanlar` ADD CONSTRAINT `ilanlar_kullanci_id_foreign` FOREIGN KEY(`kullanci_id`) REFERENCES `kullanicilar`(`id`);