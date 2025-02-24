INSERT INTO `article` (`title`, `content`, `writer`, `regip`, `wdate`)
SELECT `title`, `content`, `writer`, `regip`, `wdate` FROM `article`;