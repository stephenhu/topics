drop table if exists users;

create table users (

  userid VARCHAR(128) NOT NULL,
  name VARCHAR(255) NOT NULL,
  icon VARCHAR(255) DEFAULT 'glyphicons_003_user.png',
  karma INT DEFAULT 0,
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(userid)
  
) engine=InnoDB;


drop table if exists topics;

create table topics (

  topicid INT AUTO_INCREMENT,
  userid VARCHAR(128),
  name VARCHAR(64) NOT NULL,
  summary VARCHAR(255) NOT NULL,
  image VARCHAR(255),
  url VARCHAR(255),
  votes INT DEFAULT 0,
  attachment VARCHAR(255),
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  finished TIMESTAMP,
  PRIMARY KEY(topicid),
  FOREIGN KEY(userid) REFERENCES users(userid),
  UNIQUE KEY(name),
  UNIQUE KEY(summary),
  UNIQUE KEY(url)
  
) engine=InnoDB;


drop table if exists tags;

create table tags (

  tagid INT AUTO_INCREMENT,
  tag VARCHAR(128),
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(tagid),
  UNIQUE KEY(tag)

) engine=InnoDB;


drop table if exists topictags;

create table topictags (

  topictagid INT AUTO_INCREMENT,
  topicid VARCHAR(128),
  tagid INT,
  PRIMARY KEY(topictagid),
  FOREIGN KEY(topicid) REFERENCES topics(topicid)

) engine=InnoDB;


drop table if exists comments;

create table comments (

  commentid INT AUTO_INCREMENT,
  userid VARCHAR(128),
  topicid INT,
  comment VARCHAR(1024) NOT NULL,
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(commentid),
  FOREIGN KEY(userid) REFERENCES users(userid),
  FOREIGN KEY(topicid) REFERENCES topics(topicid)

) engine=InnoDB;
