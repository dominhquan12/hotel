
DROP DATABASE hotel;

CREATE DATABASE hotel;

use hotel;

CREATE TABLE tblHotel (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    address varchar(255),
    star int,
    des varchar(255),
    PRIMARY KEY (id)
);


CREATE TABLE tblUser (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255),
    name varchar(255),
    position varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE tblRoom (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    type varchar(255),
    price float,
    des varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE tblClient (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    idCard varchar(255),
    address varchar(255),
    tel varchar(255),
    email varchar(255),
    note varchar(255),	
    PRIMARY KEY (id)
);

CREATE TABLE tblService (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    unity varchar(255),
    price float,
    des varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE tblUsedService (
    id int NOT NULL AUTO_INCREMENT,
    idservice int,
    price float,
    quantity float,
    saleoff float,
    PRIMARY KEY (id),
    FOREIGN KEY (idservice) REFERENCES tblService(id)
);

CREATE TABLE tblBooking (
    id int NOT NULL AUTO_INCREMENT,
    idcreator int,
    idclient int,
    bookingdate datetime,
    saleoff float,
    note varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (idcreator) REFERENCES tblUser(id),
    FOREIGN KEY (idclient) REFERENCES tblClient(id)
);

CREATE TABLE tblBookedRoom (
    id int NOT NULL AUTO_INCREMENT,
    idbooking int,
    idroom int,
    checkin datetime,
    checkout datetime,
    price float,
    saleoff float,
    ischeckin boolean,
    PRIMARY KEY (id),
	FOREIGN KEY (idbooking) REFERENCES tblBooking(id),
    FOREIGN KEY (idroom) REFERENCES tblRoom(id)
);

CREATE TABLE tblBill (
    id int NOT NULL AUTO_INCREMENT,
    idclient int,
    idbooking int,
    paymentDate datetime,
    amount float,
    paymentType varchar(255),
    note varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (idclient) REFERENCES tblClient(id),
    FOREIGN KEY (idbooking) REFERENCES tblBooking(id)
);

INSERT INTO tblHotel (name, address, star, des) VALUES 
('hoa nam', 'ung hoa', 5, '8 tang'),
('hoa xa', 'ung hoa', 6, '10 tang');

-- select * from tblHotel;

INSERT INTO tblRoom (name, type, price, des) VALUES 
('101', 'don', 100000, 'mot'),
('201', 'doi', 200000, 'hai'),
('301', 'ba', 300000, 'ba'),
('401', 'tu', 200000, 'bon'),
('501', 'nam', 300000, 'nam');

-- select * from tblRoom;

-- delete from tblUser;


INSERT INTO tblUser (username, password, name, position) VALUES 
('hoa123', '123', 'hoa', 'manager'),
('moc123', '123', 'hoa', 'seller'),
('lan123', '123', 'hoa', 'seller');

-- select * from tblUser;

INSERT INTO tblService (name, unity, price, des) VALUES 
('nau an', 'unity 1', 10000, 'nau an'),
('tam rua', 'unity 2', 20000, 'tam rua'),
('boi loi', 'unity 3', 30000, 'boi loi');

-- select * from tblService;

INSERT INTO tblClient(name, idCard, address, tel, email, note) VALUES 
('moc', '3124234', 'ha noi', 'c8373847', 'moc@gmail.com', '' ),
('que', '7384755', 'ha dong', 'c7439843', 'que@gmail.com', '' ),
('anh', '4837443', 'ha nam', 'c538475', 'anh@gmail.com', '' ),
('hoa', '6345664', 'nam dinh', 'd543253', 'hoa@gmail.com', '' ),
('loa', '4234755', 'thanh hoa', 'e4235843', 'loa@gmail.com', '' ),
('ken', '4534643', 'quang ninh', 't5345475', 'ken@gmail.com', '' );

-- select * from tblClient;

INSERT INTO tblBooking (idcreator, idclient, bookingdate, saleoff, note) VALUES 
(1, 1, '2022-10-10', 10000, 'co khuyen mai'),
(1, 2, '2022-10-11', 0, 'k khuyen mai'),
(2, 3, '2022-11-12', 10000, 'co khuyen mai'),
(2, 4, '2022-11-13', 0, 'k khuyen mai'),
(3, 5, '2022-12-14', 20000, 'co khuyen mai');

-- select * from tblBooking;

INSERT INTO tblBookedRoom (idbooking, idroom, checkin, checkout, price, saleoff, ischeckin) VALUES 
(1, 1, '2022-10-10', '2022-10-11', 100000, 10000, 1),
(2, 2, '2022-10-11', '2022-10-13', 200000, 30000, 0),
(3, 3, '2022-11-15', '2022-10-19', 300000, 20000, 1),
(4, 2, '2022-11-22', '2022-11-29', 400000, 40000, 0),
(5, 1, '2022-12-15', '2022-10-19', 500000, 10000, 1);

-- select * from tblBookedRoom;