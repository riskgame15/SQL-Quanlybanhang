create database QuanLyBanHang;

use QuanLyBanHang;

CREATE TABLE Customer (
                          cID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          cName VARCHAR(50) NOT NULL,
                          cAge INT,
                          CHECK (cAge < 150 AND cAge > 0)
);

CREATE TABLE Orders (
                        oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        cID INT NOT NULL,
                        oDate DATE,
                        oTotalPrice DOUBLE NOT NULL,
                        FOREIGN KEY (cID)
                            REFERENCES Customer (cID)
);

CREATE TABLE Product (
                         pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         pName VARCHAR(30) NOT NULL,
                         pPrice DOUBLE NOT NULL
);

CREATE TABLE OrderDetail (
                             oID INT NOT NULL,
                             pID INT NOT NULL,
                             odQTY INT,
                             PRIMARY KEY (oID , pID),
                             FOREIGN KEY (oID)
                                 REFERENCES Orders (oID),
                             FOREIGN KEY (pID)
                                 REFERENCES Product (pID)
);

select * from Product;