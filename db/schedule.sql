-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 01 2020 г., 09:42
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schedule`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_classroom`
--

CREATE TABLE `gromov_classroom` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_day`
--

CREATE TABLE `gromov_day` (
  `day_id` tinyint(4) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_day`
--

INSERT INTO `gromov_day` (`day_id`, `name`) VALUES
(1, 'понедельник'),
(2, 'вторник'),
(3, 'среда'),
(4, 'четверг'),
(5, 'пятница'),
(6, 'суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_gender`
--

CREATE TABLE `gromov_gender` (
  `gender_id` tinyint(4) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_gruppa`
--

CREATE TABLE `gromov_gruppa` (
  `gruppa_id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_lesson_num`
--

CREATE TABLE `gromov_lesson_num` (
  `lesson_num_id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_lesson` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_lesson_num`
--

INSERT INTO `gromov_lesson_num` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_lesson_plan`
--

CREATE TABLE `gromov_lesson_plan` (
  `lesson_plan_id` int(11) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_otdel`
--

CREATE TABLE `gromov_otdel` (
  `otdel_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_otdel`
--

INSERT INTO `gromov_otdel` (`otdel_id`, `name`, `active`) VALUES
(1, 'программирование', 1),
(2, 'общеобразовательные дисциплины', 1),
(3, 'строительство', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_role`
--

CREATE TABLE `gromov_role` (
  `role_id` tinyint(4) NOT NULL,
  `sys_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_role`
--

INSERT INTO `gromov_role` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_schedule`
--

CREATE TABLE `gromov_schedule` (
  `schedule_id` int(11) NOT NULL,
  `lesson_plan_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL,
  `lesson_num_id` int(11) NOT NULL,
  `calssroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_special`
--

CREATE TABLE `gromov_special` (
  `special_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gromov_special`
--

INSERT INTO `gromov_special` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'информационные системы', 1, 1),
(2, 'нефтегазовое дело', 2, 1),
(3, 'строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'электроснабжение', 3, 1),
(5, 'вычислительная техника и\r\nпрограммное обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_student`
--

CREATE TABLE `gromov_student` (
  `user_id` bigint(20) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `num_zach` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_subject`
--

CREATE TABLE `gromov_subject` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint(6) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_teacher`
--

CREATE TABLE `gromov_teacher` (
  `user_id` bigint(20) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gromov_user`
--

CREATE TABLE `gromov_user` (
  `user_id` bigint(20) NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronomic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender_id` tinyint(4) NOT NULL,
  `birthday` date DEFAULT NULL,
  `role_id` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gromov_classroom`
--
ALTER TABLE `gromov_classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `gromov_day`
--
ALTER TABLE `gromov_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gromov_gender`
--
ALTER TABLE `gromov_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `FK_gromov_gruppa_gromov_special_special_id` (`special_id`);

--
-- Индексы таблицы `gromov_lesson_num`
--
ALTER TABLE `gromov_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `gromov_lesson_plan`
--
ALTER TABLE `gromov_lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `FK_gromov_lesson_plan_gromov_gruppa_gruppa_id` (`gruppa_id`),
  ADD KEY `p` (`user_id`),
  ADD KEY `FK_gromov_lesson_plan_gromov_subject_subject_id` (`subject_id`);

--
-- Индексы таблицы `gromov_otdel`
--
ALTER TABLE `gromov_otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `gromov_role`
--
ALTER TABLE `gromov_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `gromov_schedule`
--
ALTER TABLE `gromov_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `FK_gromov_schedule_gromov_lesson_plan_lesson_plan_id` (`lesson_plan_id`),
  ADD KEY `FK_gromov_schedule_gromov_lesson_num_lesson_num_id` (`lesson_num_id`),
  ADD KEY `FK_gromov_schedule_gromov_day_day_id` (`day_id`),
  ADD KEY `FK_gromov_schedule_gromov_classroom_classroom_id` (`calssroom_id`);

--
-- Индексы таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `FK_gromov_special_gromov_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gromov_student`
--
ALTER TABLE `gromov_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_student_gromov_gruppa_gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `gromov_subject`
--
ALTER TABLE `gromov_subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `FK_gromov_subject_gromov_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gromov_teacher`
--
ALTER TABLE `gromov_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_teacher_gromov_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gromov_user_gromov_gender_gender_id` (`gender_id`),
  ADD KEY `FK_gromov_user_gromov_role_role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gromov_classroom`
--
ALTER TABLE `gromov_classroom`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_day`
--
ALTER TABLE `gromov_day`
  MODIFY `day_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gromov_gender`
--
ALTER TABLE `gromov_gender`
  MODIFY `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  MODIFY `gruppa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_lesson_num`
--
ALTER TABLE `gromov_lesson_num`
  MODIFY `lesson_num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gromov_lesson_plan`
--
ALTER TABLE `gromov_lesson_plan`
  MODIFY `lesson_plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_otdel`
--
ALTER TABLE `gromov_otdel`
  MODIFY `otdel_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gromov_role`
--
ALTER TABLE `gromov_role`
  MODIFY `role_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gromov_schedule`
--
ALTER TABLE `gromov_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gromov_subject`
--
ALTER TABLE `gromov_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gromov_gruppa`
--
ALTER TABLE `gromov_gruppa`
  ADD CONSTRAINT `FK_gromov_gruppa_gromov_special_special_id` FOREIGN KEY (`special_id`) REFERENCES `gromov_special` (`special_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_lesson_plan`
--
ALTER TABLE `gromov_lesson_plan`
  ADD CONSTRAINT `FK_gromov_lesson_plan_gromov_gruppa_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gromov_gruppa` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_lesson_plan_gromov_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `gromov_subject` (`subject_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `p` FOREIGN KEY (`user_id`) REFERENCES `gromov_teacher` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_schedule`
--
ALTER TABLE `gromov_schedule`
  ADD CONSTRAINT `FK_gromov_schedule_gromov_classroom_classroom_id` FOREIGN KEY (`calssroom_id`) REFERENCES `gromov_classroom` (`classroom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_schedule_gromov_day_day_id` FOREIGN KEY (`day_id`) REFERENCES `gromov_day` (`day_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_schedule_gromov_lesson_num_lesson_num_id` FOREIGN KEY (`lesson_num_id`) REFERENCES `gromov_lesson_num` (`lesson_num_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_schedule_gromov_lesson_plan_lesson_plan_id` FOREIGN KEY (`lesson_plan_id`) REFERENCES `gromov_lesson_plan` (`lesson_plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_special`
--
ALTER TABLE `gromov_special`
  ADD CONSTRAINT `FK_gromov_special_gromov_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `gromov_otdel` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_student`
--
ALTER TABLE `gromov_student`
  ADD CONSTRAINT `FK_gromov_student_gromov_gruppa_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gromov_gruppa` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_student_gromov_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `gromov_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_subject`
--
ALTER TABLE `gromov_subject`
  ADD CONSTRAINT `FK_gromov_subject_gromov_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `gromov_otdel` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_teacher`
--
ALTER TABLE `gromov_teacher`
  ADD CONSTRAINT `FK_gromov_teacher_gromov_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `gromov_otdel` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_teacher_gromov_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `gromov_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gromov_user`
--
ALTER TABLE `gromov_user`
  ADD CONSTRAINT `FK_gromov_user_gromov_gender_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gromov_gender` (`gender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gromov_user_gromov_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `gromov_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
