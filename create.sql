-- 出版社
CREATE TABLE IF NOT EXISTS publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(50) NOT NULL
);

-- 书单
CREATE TABLE IF NOT EXISTS booklist (
    booklist_id INT PRIMARY KEY AUTO_INCREMENT,
    brief_intro VARCHAR(100),
    booklist_name VARCHAR(50) NOT NULL
);

-- 图书类型
CREATE TABLE IF NOT EXISTS book_type (
    book_type_id INT PRIMARY KEY AUTO_INCREMENT,
    book_type_name VARCHAR(50) NOT NULL,
    book_count INT NOT NULL
);

-- 图书
CREATE TABLE IF NOT EXISTS book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_id INT NOT NULL,
    book_type_id INT NOT NULL,
    book_name VARCHAR(50) NOT NULL,
    author VARCHAR(20) NOT NULL,
    price NUMERIC(8, 2) NOT NULL,
    pages INT NOT NULL,
    publish_time DATETIME,
    download_count INT DEFAULT 0,
    file_size INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    brief_intro VARCHAR(400),
    FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY(book_type_id) REFERENCES book_type(book_type_id)
);


-- 读者
CREATE TABLE IF NOT EXISTS reader (
    reader_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    gender CHAR(10) CHECK (gender IN ('male', 'female')),
    birth_date DATETIME NOT NULL,
    age INT NOT NULL,
    avatar VARCHAR(100),
    email VARCHAR(50),
    balance NUMERIC(8, 2),
    phone VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
);


-- 管理员
CREATE TABLE IF NOT EXISTS admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_account VARCHAR(20) NOT NULL,
    account_password VARCHAR(20) NOT NULL
);

-- 图书格式
CREATE TABLE IF NOT EXISTS book_format (
    book_format_id INT PRIMARY KEY AUTO_INCREMENT,
    format_name VARCHAR(20) NOT NULL
);


-- 图书评论
CREATE TABLE IF NOT EXISTS comment (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    comment_content VARCHAR(200) NOT NULL,
    comment_time DATETIME NOT NULL,
    like_count INT DEFAULT 0,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    FOREIGN KEY(reader_id) REFERENCES reader(reader_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

-- 图书收藏关系
CREATE TABLE IF NOT EXISTS book_collection (
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    FOREIGN KEY(reader_id) REFERENCES reader(reader_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

-- 书单创建
CREATE TABLE IF NOT EXISTS booklist_create (
    booklist_id INT PRIMARY KEY AUTO_INCREMENT,
    booklist_name VARCHAR(20) NOT NULL,
    brief_intro VARCHAR(100),
    reader_id INT NOT NULL,
    FOREIGN KEY(reader_id) REFERENCES reader(reader_id)
);

-- 图书购买
CREATE TABLE IF NOT EXISTS book_purchase (
    order_time DATETIME NOT NULL,
    order_id INT,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    FOREIGN KEY(reader_id) REFERENCES reader(reader_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

-- 书单包含
CREATE TABLE IF NOT EXISTS booklist_include (
    book_id INT NOT NULL,
    booklist_id INT NOT NULL,
    FOREIGN KEY(booklist_id) REFERENCES booklist(booklist_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

-- 书单收藏
CREATE TABLE IF NOT EXISTS booklist_collection (
    reader_id INT NOT NULL,
    booklist_id INT NOT NULL,
    FOREIGN KEY(booklist_id) REFERENCES booklist(booklist_id),
    FOREIGN KEY(reader_id) REFERENCES reader(reader_id)
);

-- 图书格式
CREATE TABLE IF NOT EXISTS book_format (
    book_id INT NOT NULL,
    book_type_id INT NOT NULL,
    download_url VARCHAR(100),
    FOREIGN KEY(book_id) REFERENCES book(book_id),
    FOREIGN KEY(book_format_id) REFERENCES book_format(book_format_id)
);