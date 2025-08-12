-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 26 2025 г., 11:27
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `SportProduct`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Bookings`
--

CREATE TABLE `Bookings` (
  `id_booking` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `booking_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('в ожидании','подтверждено','отменено') COLLATE utf8mb4_unicode_ci DEFAULT 'в ожидании'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Bookings`
--

INSERT INTO `Bookings` (`id_booking`, `id_product`, `id_user`, `quantity`, `booking_date`, `status`) VALUES
(28, 1, 4, 1, '2025-04-28 15:26:01', 'в ожидании'),
(30, 9, 6, 1, '2025-05-07 12:34:45', 'в ожидании'),
(32, 17, 6, 1, '2025-05-07 12:41:09', 'в ожидании'),
(35, 17, 15, 1, '2025-05-12 13:38:39', 'в ожидании'),
(36, 7, 4, 1, '2025-05-21 09:09:09', 'в ожидании');

-- --------------------------------------------------------

--
-- Структура таблицы `Brand`
--

CREATE TABLE `Brand` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Brand`
--

INSERT INTO `Brand` (`id_brand`, `name`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Reebok'),
(4, 'Demix'),
(5, 'Puma'),
(6, 'Stern'),
(7, 'Outventure');

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE `Categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id_category`, `name`, `description`) VALUES
(1, 'Аксессуары', 'Кепки и бутылки'),
(2, 'Велоспорт', 'Разновидности велосипедов'),
(3, 'Инвентарь', 'Инвентарь для занятий в зале, дома'),
(4, 'Кемпинг', 'Все для кемпинга: палатки');

-- --------------------------------------------------------

--
-- Структура таблицы `Color`
--

CREATE TABLE `Color` (
  `id_color` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Color`
--

INSERT INTO `Color` (`id_color`, `name`) VALUES
(1, 'Черный'),
(2, 'Оранжевый'),
(3, 'Белый'),
(4, 'Красный'),
(5, 'Зеленый'),
(6, 'Коричневый'),
(7, 'Синий');

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `id_product` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_color` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` (`id_product`, `id_brand`, `id_category`, `name`, `price`, `id_color`, `image_url`, `stock`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 'Велосипед Stern Energy 1.0 26', '26399.00', 1, 'http://localhost/spsh/img/image%2035.png\n', 5, '2025-04-24 17:29:33', '2025-05-12 12:35:17'),
(2, 6, 2, 'Велосипед Stern Angel 1.0 26', '23499.00', 3, 'http://localhost/spsh/img/white.png\n', 5, '2025-04-24 17:31:01', '2025-04-24 19:53:28'),
(3, 6, 2, 'Велосипед горный Stern Energy 2.0', '31199.00', 2, 'http://localhost/spsh/img/orange.png', 10, '2025-04-24 17:34:34', '2025-04-24 19:53:53'),
(4, 6, 2, 'Велосипед горный Stern Energy 1.0', '29999.00', 4, 'http://localhost/spsh/img/red.png', 12, '2025-04-24 17:34:34', '2025-04-24 19:54:15'),
(5, 6, 2, 'Велосипед Stern Energy 1.0 26', '31999.00', 1, 'http://localhost/spsh/img/black.png\n', 11, '2025-04-24 18:31:54', '2025-04-24 19:54:44'),
(6, 6, 2, 'Велосипед горный Stern Energy 1.0 Sport 26\" 2024', '29999.00', 7, 'http://localhost/spsh/img/blue.png', 14, '2025-04-24 18:31:54', '2025-04-24 19:55:05'),
(7, 7, 4, 'Палатка 4-местная Outventure Trenton 4', '13499.00', 6, 'http://localhost/spsh/img/tent.png', 20, '2025-04-24 18:35:42', '2025-04-24 19:55:24'),
(8, 7, 4, 'Тент Outventure Royal House', '21499.00', 6, 'http://localhost/spsh/img/tent2.png\n', 17, '2025-04-24 18:35:42', '2025-04-24 19:55:53'),
(9, 7, 4, 'Компрессионный мешок Northland 45 л', '1499.00', 1, 'http://localhost/spsh/img/bagBl.png\n', 30, '2025-04-24 18:39:00', '2025-05-07 12:34:45'),
(10, 7, 4, 'Компрессионный мешок 18 л', '2799.00', 7, 'http://localhost/spsh/img/bagBlue.png\n', 19, '2025-04-24 18:39:00', '2025-04-24 19:56:56'),
(11, 7, 4, 'Матрас надувной Outventure 203х152х22 см', '3999.00', 7, 'http://localhost/spsh/img/mattressBl.png', 6, '2025-04-24 18:50:26', '2025-04-24 19:57:52'),
(12, 7, 4, 'Матрас надувной Outventure 116x193x22 см', '2399.00', 5, 'http://localhost/spsh/img/mattressGr.png', 13, '2025-04-24 18:50:26', '2025-04-24 19:58:18'),
(13, 4, 3, 'Гантель Demix, 5 кг', '899.00', 1, 'http://localhost/spsh/img/dumbbellsBl.png\n', 50, '2025-04-24 18:53:37', '2025-04-24 19:59:34'),
(14, 4, 3, 'Гантель Demix, 4 кг', '1799.00', 7, 'http://localhost/spsh/img/dumbbellsBlack.png', 23, '2025-04-24 18:53:37', '2025-04-24 19:59:55'),
(15, 4, 3, 'Гантель Demix, 3 кг', '1499.00', 2, 'http://localhost/spsh/img/dumbbellsOr.png\n', 10, '2025-04-24 18:56:33', '2025-04-24 20:00:15'),
(16, 4, 3, 'Гантель Demix, 3 кг', '1499.00', 4, 'http://localhost/spsh/img/dumbbellsRed.png\n', 28, '2025-04-24 18:56:33', '2025-04-24 20:00:38'),
(17, 2, 1, 'Бейсболка adidas', '2199.00', 1, 'http://localhost/spsh/img/capAdd.png\n', 7, '2025-04-24 18:59:40', '2025-05-12 13:38:39'),
(18, 5, 1, 'Бейсболка PUMA Ess Metal Cat', '2499.00', 1, 'http://localhost/spsh/img/capPuma.png\n', 34, '2025-04-24 18:59:40', '2025-04-28 15:26:37'),
(19, 3, 1, 'Бейсболка Reebok Badge', '3999.00', 1, 'http://localhost/spsh/img/capRee.png\n', 18, '2025-04-24 19:02:49', '2025-04-28 15:24:28'),
(20, 1, 1, 'Бутылка для воды NIKE TR HYPERCHARGE CHUG', '1099.00', 5, 'http://localhost/spsh/img/nikebott.png\n', 50, '2025-04-24 19:02:49', '2025-04-24 20:02:19');

--
-- Триггеры `Products`
--
DELIMITER $$
CREATE TRIGGER `update_product_updated_at` BEFORE UPDATE ON `Products` FOR EACH ROW BEGIN
  SET NEW.updated_at = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `id_user` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `two_factor_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`id_user`, `name`, `surname`, `password`, `email`, `phone`, `role`, `created_at`, `updated_at`, `two_factor_secret`) VALUES
(1, 'Карина', 'Гриднева', '12345', 'gridnevakk@mail.ru', '89687824989', 1, '2024-10-23 21:29:16', '2024-10-23 21:31:23', NULL),
(2, 'София', 'Назарова', '12345', 'nazarova@mail.com', '89678265851', 0, '2024-10-23 21:29:16', '2024-10-23 21:29:16', NULL),
(4, 'karisska', 'грибок', '$2y$10$uxtM5xHB6NYgwKUdNck9cupz2s1eOzQR0HM.UWrW.6gaGwcAHaCcW', 'isipok@mail.com', '89687824989', 0, '2025-04-21 12:15:41', '2025-04-21 12:15:41', NULL),
(5, 'karisska', 'Гриднева', '$2y$10$EFPJ6gUDwfMBO8kAfpxnte4trVAKgDWtUuDEL0uD4.LKqaJ0FytjW', 'isip_k.k.grid@mpt.ru', '76666666666', 0, '2025-04-22 12:42:41', '2025-04-22 12:42:41', NULL),
(6, 'Каришкаа', 'гридневаская', '$2y$10$1BkkTglnbv1qH9YY2/Vwou34RYrpYsv58pMINm7jAbAwm4Zr8y/ZG', 'gridnevakk05@gmail.com', '89017924546', 1, '2025-04-30 12:21:15', '2025-04-30 12:21:15', 'VEOMVRD6YIJ4WSUQ'),
(7, 'rfhbirf', 'gjraurigviqa', '$2y$10$f8hcZ56ef9mWPHSoLL67QOwVeLJTKUooMQE646V7A.AKHie4f6zra', 'isp_gggggg@gmail.com', '89629786025', 0, '2025-05-07 12:07:49', '2025-05-07 12:07:49', NULL),
(8, 'СЕРЕЖКА', 'грибок', '$2y$10$oIvW/EHaSbIHwLo8ozZNYeYEAcFGK2WOQeYgjxi5jyjzHS1Yf6w9G', 'gribbbbbor@gmail.com', '89629776020', 0, '2025-05-07 12:35:38', '2025-05-07 12:35:38', NULL),
(9, 'бижуха', 'хз', '$2y$10$sZKF1YtO2u0.EnBxLeM1QO1w56.4AbBWm9vGDy3ObesDo.Z8tNV1G', 'null@gmail.com', '89687824984', 0, '2025-05-07 13:18:08', '2025-05-07 13:18:08', NULL),
(10, 'урео', 'мцкуерно', '$2y$10$sjXtqRooP25LIjQH0bmw/.6MV6m6zSZNWKAKFqCwhUHqG/tvUCAaC', 'nari@gmail.com', '89687824981', 0, '2025-05-07 15:46:27', '2025-05-07 15:46:27', NULL),
(11, 'cvdWFBNY', 'CQVRFQTN4Y', '$2y$10$s/xvgX5TUA3Uy2etm8XP0OkjFdPobTZhNZXJpEpxmKndTflcwuNSW', 'narine@mail.com', '89687824987', 0, '2025-05-07 15:47:18', '2025-05-07 15:47:18', NULL),
(12, 'СЕРЕЖКА', 'грибок', '$2y$10$rk.9PVB3B4yfHJsMLNVlJ.roR1.QqjyJUo8QwkruOzdg3PVtqcJRG', 'na@gmail.com', '89687824988', 0, '2025-05-07 16:06:15', '2025-05-07 16:06:15', NULL),
(15, 'анастасия', 'фролова', '$2y$10$FGI40mcOJ42F87YbBUBKCu2OwcjvLFRQyv8WH5WnlmjVXmY2r7b36', 'isip_k.k.gridneva@mpt.ru', '8929786030', 0, '2025-05-12 12:17:10', '2025-05-12 12:17:10', '4BCGSNKH27FXFXRV');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Индексы таблицы `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `Color`
--
ALTER TABLE `Color`
  ADD PRIMARY KEY (`id_color`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_brand` (`id_brand`),
  ADD KEY `id_color` (`id_color`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `Brand`
--
ALTER TABLE `Brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Color`
--
ALTER TABLE `Color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `Products` (`id_product`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Categories` (`id_category`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `Brand` (`id_brand`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `Color` (`id_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
