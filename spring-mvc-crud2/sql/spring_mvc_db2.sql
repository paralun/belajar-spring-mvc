

--
-- Database: `spring_mvc_db2`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `framework` varchar(500) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `COUNTRY` varchar(10) DEFAULT NULL,
  `SKILL` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `users` (`id`, `name`, `email`, `address`, `password`, `newsletter`, `framework`, `sex`, `NUMBER`, `COUNTRY`, `SKILL`) VALUES
(1, 'Maman', 'maman@gmail.com', 'Cianjur', '23456', 0, 'Spring MVC,Struts 2', 'M', 1, 'US', 'Spring,Struts,Groovy'),
(2, 'alex', 'alex@yahoo.com', NULL, NULL, NULL, 'Spring MVC, PLAY', NULL, NULL, NULL, NULL),
(5, 'Bambang', 'bambang@gmail.com', 'Bandung', '12345', 1, 'Spring MVC,Struts 2,JSF 2,Play', 'M', 2, 'US', 'Hibernate,Spring,Struts');

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
