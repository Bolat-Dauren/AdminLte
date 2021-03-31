-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 31 2021 г., 12:25
-- Версия сервера: 8.0.19
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
-- Структура таблицы `bolat_classroom`
--

CREATE TABLE `bolat_classroom` (
  `classroom_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(20) NOT NULL COMMENT 'Название аудитории',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_day`
--

CREATE TABLE `bolat_day` (
  `day_id` tinyint NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(20) NOT NULL COMMENT 'Название дня недели'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_day`
--

INSERT INTO `bolat_day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_gender`
--

CREATE TABLE `bolat_gender` (
  `gender_id` tinyint NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Название пола'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_gender`
--

INSERT INTO `bolat_gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_gruppa`
--

CREATE TABLE `bolat_gruppa` (
  `gruppa_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(10) NOT NULL COMMENT 'Название группы',
  `special_id` int NOT NULL COMMENT 'Внешний ключ\r\n\r\nссылающийся на таблицу со\r\nспециальностями колледжа',
  `date_begin` date NOT NULL COMMENT 'Дата образования группы',
  `date_end` date DEFAULT NULL COMMENT 'Дата окончания группы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_lesson_num`
--

CREATE TABLE `bolat_lesson_num` (
  `lesson_num_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(10) NOT NULL COMMENT 'Название пары',
  `time_lesson` time NOT NULL COMMENT 'Время начала пары'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_lesson_num`
--

INSERT INTO `bolat_lesson_num` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_lesson_plan`
--

CREATE TABLE `bolat_lesson_plan` (
  `lesson_plan_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `gruppa_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с группами\r\nколледжа',
  `subject_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с дисциплинами\r\nколледжа',
  `user_id` bigint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с преподавателями\r\nколледжа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_otdel`
--

CREATE TABLE `bolat_otdel` (
  `otdel_id` smallint NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(50) NOT NULL COMMENT 'Название отделения',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_otdel`
--

INSERT INTO `bolat_otdel` (`otdel_id`, `name`, `active`) VALUES
(1, 'Программирование', 1),
(2, 'Общеобразовательные дисциплины', 1),
(3, 'Строительство', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_role`
--

CREATE TABLE `bolat_role` (
  `role_id` tinyint NOT NULL COMMENT 'Первичный ключ таблицы',
  `sys_name` varchar(20) NOT NULL COMMENT 'Системное имя роли,\r\nиспользуется в приложении',
  `name` varchar(20) NOT NULL COMMENT 'Имя роли, используется для\r\nвывода',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_role`
--

INSERT INTO `bolat_role` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_schedule`
--

CREATE TABLE `bolat_schedule` (
  `schedule_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `lesson_plan_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с планом занятий',
  `day_id` tinyint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с днями недели',
  `lesson_num_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с номерами пар',
  `classroom_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с аудиториями\r\nколледжа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_special`
--

CREATE TABLE `bolat_special` (
  `special_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(250) NOT NULL COMMENT 'Название специальности',
  `otdel_id` smallint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с отделениями',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bolat_special`
--

INSERT INTO `bolat_special` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'Информационные системы', 1, 1),
(2, 'Нефтегазовое дело', 2, 1),
(3, 'Строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'Электроснабжение', 3, 1),
(5, 'Вычислительная техника и программное обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_student`
--

CREATE TABLE `bolat_student` (
  `user_id` bigint NOT NULL COMMENT 'Первичный ключ таблицы (Не\r\nавтоинкремент), ссылается на\r\nтаблицу user',
  `gruppa_id` int NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с группами\r\nколледжа',
  `num_zach` varchar(10) NOT NULL COMMENT 'Номер зачетной книги студента'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_subject`
--

CREATE TABLE `bolat_subject` (
  `subject_id` int NOT NULL COMMENT 'Первичный ключ таблицы',
  `name` varchar(50) NOT NULL COMMENT 'Название дисциплины',
  `otdel_id` smallint NOT NULL COMMENT 'Внешний ключ\r\n\r\nссылающийся на таблицу с\r\nотделениями колледжа',
  `hours` smallint NOT NULL COMMENT 'Количество часов\r\nдисциплины',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_teacher`
--

CREATE TABLE `bolat_teacher` (
  `user_id` bigint NOT NULL COMMENT 'Первичный ключ таблицы (Не\r\nавтоинкремент), ссылается на\r\nтаблицу user',
  `otdel_id` smallint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\nна таблицу с отделениями\r\nколледжа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bolat_user`
--

CREATE TABLE `bolat_user` (
  `user_id` bigint NOT NULL COMMENT 'Первичный ключ таблицы',
  `lastname` varchar(50) NOT NULL COMMENT 'Фамилия пользователя',
  `firstname` varchar(50) NOT NULL COMMENT 'Имя пользователя',
  `patronymic` varchar(50) DEFAULT NULL COMMENT 'Отчество пользователя',
  `login` varchar(50) DEFAULT NULL COMMENT 'Логин пользователя',
  `pass` varchar(255) DEFAULT NULL COMMENT 'Пароль пользователя',
  `gender_id` tinyint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\n\r\nна таблицу с полами\r\nпользователей.',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения пользователя',
  `role_id` tinyint NOT NULL COMMENT 'Внешний ключ ссылающийся\r\n\r\nна таблицу с ролями\r\nпользователей в приложении.',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Флаг активности записи (1 –\r\nактивна, 0- не активна)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bolat_classroom`
--
ALTER TABLE `bolat_classroom`
  ADD PRIMARY KEY (`classroom_id`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Индексы таблицы `bolat_day`
--
ALTER TABLE `bolat_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `bolat_gender`
--
ALTER TABLE `bolat_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `bolat_gruppa`
--
ALTER TABLE `bolat_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `bolat_lesson_num`
--
ALTER TABLE `bolat_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `bolat_lesson_plan`
--
ALTER TABLE `bolat_lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `bolat_otdel`
--
ALTER TABLE `bolat_otdel`
  ADD PRIMARY KEY (`otdel_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `bolat_role`
--
ALTER TABLE `bolat_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `bolat_schedule`
--
ALTER TABLE `bolat_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `lesson_plan_id` (`lesson_plan_id`,`day_id`,`lesson_num_id`),
  ADD KEY `lesson_plan_id_2` (`lesson_plan_id`,`day_id`,`lesson_num_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `lesson_num_id` (`lesson_num_id`);

--
-- Индексы таблицы `bolat_special`
--
ALTER TABLE `bolat_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `otdel_id` (`otdel_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `bolat_student`
--
ALTER TABLE `bolat_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `bolat_subject`
--
ALTER TABLE `bolat_subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `bolat_teacher`
--
ALTER TABLE `bolat_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `bolat_user`
--
ALTER TABLE `bolat_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bolat_classroom`
--
ALTER TABLE `bolat_classroom`
  MODIFY `classroom_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- AUTO_INCREMENT для таблицы `bolat_day`
--
ALTER TABLE `bolat_day`
  MODIFY `day_id` tinyint NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `bolat_gender`
--
ALTER TABLE `bolat_gender`
  MODIFY `gender_id` tinyint NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bolat_gruppa`
--
ALTER TABLE `bolat_gruppa`
  MODIFY `gruppa_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- AUTO_INCREMENT для таблицы `bolat_lesson_num`
--
ALTER TABLE `bolat_lesson_num`
  MODIFY `lesson_num_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `bolat_lesson_plan`
--
ALTER TABLE `bolat_lesson_plan`
  MODIFY `lesson_plan_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- AUTO_INCREMENT для таблицы `bolat_otdel`
--
ALTER TABLE `bolat_otdel`
  MODIFY `otdel_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `bolat_role`
--
ALTER TABLE `bolat_role`
  MODIFY `role_id` tinyint NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bolat_schedule`
--
ALTER TABLE `bolat_schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- AUTO_INCREMENT для таблицы `bolat_special`
--
ALTER TABLE `bolat_special`
  MODIFY `special_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `bolat_subject`
--
ALTER TABLE `bolat_subject`
  MODIFY `subject_id` int NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- AUTO_INCREMENT для таблицы `bolat_user`
--
ALTER TABLE `bolat_user`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ таблицы';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bolat_classroom`
--
ALTER TABLE `bolat_classroom`
  ADD CONSTRAINT `bolat_classroom_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `bolat_schedule` (`classroom_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_gruppa`
--
ALTER TABLE `bolat_gruppa`
  ADD CONSTRAINT `bolat_gruppa_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `bolat_student` (`gruppa_id`),
  ADD CONSTRAINT `bolat_gruppa_ibfk_2` FOREIGN KEY (`special_id`) REFERENCES `bolat_special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_lesson_plan`
--
ALTER TABLE `bolat_lesson_plan`
  ADD CONSTRAINT `bolat_lesson_plan_ibfk_1` FOREIGN KEY (`lesson_plan_id`) REFERENCES `bolat_schedule` (`lesson_plan_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_otdel`
--
ALTER TABLE `bolat_otdel`
  ADD CONSTRAINT `bolat_otdel_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `bolat_special` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_schedule`
--
ALTER TABLE `bolat_schedule`
  ADD CONSTRAINT `bolat_schedule_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `bolat_day` (`day_id`),
  ADD CONSTRAINT `bolat_schedule_ibfk_2` FOREIGN KEY (`lesson_num_id`) REFERENCES `bolat_lesson_num` (`lesson_num_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_student`
--
ALTER TABLE `bolat_student`
  ADD CONSTRAINT `bolat_student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bolat_user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_subject`
--
ALTER TABLE `bolat_subject`
  ADD CONSTRAINT `bolat_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `bolat_lesson_plan` (`subject_id`),
  ADD CONSTRAINT `bolat_subject_ibfk_2` FOREIGN KEY (`otdel_id`) REFERENCES `bolat_otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_teacher`
--
ALTER TABLE `bolat_teacher`
  ADD CONSTRAINT `bolat_teacher_ibfk_2` FOREIGN KEY (`otdel_id`) REFERENCES `bolat_otdel` (`otdel_id`),
  ADD CONSTRAINT `bolat_teacher_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `bolat_lesson_plan` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `bolat_user`
--
ALTER TABLE `bolat_user`
  ADD CONSTRAINT `bolat_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bolat_teacher` (`user_id`),
  ADD CONSTRAINT `bolat_user_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `bolat_gender` (`gender_id`),
  ADD CONSTRAINT `bolat_user_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `bolat_role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
