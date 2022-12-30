CREATE TABLE user_detail(
    userID int (10) AUTO_INCREMENT,
    profileImage VARCHAR (255),
    userType int (2),
    userDescription VARCHAR (750),
    userAddress VARCHAR (500),
    userTelNo int (10),
    userFirstName VARCHAR (50),
    userLastName VARCHAR (50),
    userName VARCHAR (50) UNIQUE NOT NULL,
    email VARCHAR (50) UNIQUE NOT NULL,
    password VARCHAR (255) NOT NULL,
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_USER PRIMARY KEY (userID)
);

CREATE TABLE post(
    postID int (10) AUTO_INCREMENT,
    image VARCHAR (255) UNIQUE,
    caption VARCHAR (500),
    location VARCHAR (200),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userID int (10),
    CONSTRAINT PK_POST PRIMARY KEY (postID),
    CONSTRAINT FK_POST FOREIGN KEY (userID) REFERENCES user_detail (userID)
);

CREATE TABLE comment(
    commentID int (10) AUTO_INCREMENT,
    comment VARCHAR (500),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    postID int (10),
    userID int (10),
    CONSTRAINT PK_COMMENT PRIMARY KEY (commentID),
    CONSTRAINT FK_COMMENT1 FOREIGN KEY (postID) REFERENCES post (postID),
    CONSTRAINT FK_COMMENT2 FOREIGN KEY (userID) REFERENCES user_detail (userID)
);

CREATE TABLE liked(
    likeID int (10) AUTO_INCREMENT,
    liked BOOLEAN,
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_COMMENT PRIMARY KEY (likeID)
);

CREATE TABLE like_user_post(
    likeID int (10),
    postID int (10),
    userID int (10),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_LIKE_POST PRIMARY KEY (likeID, postID, userID),
    CONSTRAINT FK_LIKE_POST1 FOREIGN KEY (likeID) REFERENCES like (likeID),
    CONSTRAINT FK_LIKE_POST2 FOREIGN KEY (postID) REFERENCES post (postID),
    CONSTRAINT FK_LIKE_POST3 FOREIGN KEY (userID) REFERENCES user_detail (userID)
);

CREATE TABLE hashtag(
    hashtagID int (10) AUTO_INCREMENT,
    hashtag VARCHAR (100),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_HASHTAG PRIMARY KEY (hashtagID)
);

CREATE TABLE hashtag_post(
    hashtagID int (10),
    postID int (10),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_LIKE_POST PRIMARY KEY (hashtagID, postID),
    CONSTRAINT FK_HASHTAG_POST1 FOREIGN KEY (hashtagID) REFERENCES hashtag (hashtagID),
    CONSTRAINT FK_HASHTAG_POST2 FOREIGN KEY (postID) REFERENCES post (postID)
);