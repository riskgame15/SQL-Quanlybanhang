
use QuanLyBanHang;

insert into customer (cName, cAge) values
                                       ('Minh Quan', 10),
                                       ('Ngoc Oanh', 20),
                                       ('Hong Ha', 50);

insert into orders (cID, oDate) values
                                    (1, '2006-3-21'),
                                    (2, '2006-3-23'),
                                    (1, '2006-3-16');

insert into product (pName, pPrice) values
                                        ('May Giat', 3),
                                        ('Tu Lanh', 5),
                                        ('Dieu Hoa', 7),
                                        ('Quat', 1),
                                        ('Bep Dien', 2);

insert into orderDetail values
                            (1,1,3),
                            (1,3,7),
                            (1,4,2),
                            (2,1,1),
                            (3,1,8),
                            (2,5,4),
                            (2,3,3);

select o.oID, o.oDate, p.pName, od.odQTY, p.pPrice
from orders o
         join orderDetail od on o.oID = od.oID
         join product p on od.pID = p.pID;

select distinct c.cName, p.pName
from customer c
         join orders o on c.cID = o.cID
         join orderDetail od on o.oID = od.oID
         join product p on od.pID = p.pID;

select * from customer
where cID not in
      (select cID from orders);

select * from orders;
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as oTotalPrice
from orders o
         join orderDetail od on o.oID = od.oID
         join product p on od.pID = p.pID
group by o.oID;
