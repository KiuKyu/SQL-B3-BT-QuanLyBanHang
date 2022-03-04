USE quanlybanhang;
# Thêm dữ liệu vào trong 4 bảng
INSERT INTO customer (cID, cName, cAge) VALUES (1, 'Minh Quan', 10),
                                               (2, 'Ngoc Oanh', 20),
                                               (3, 'Hong Ha', 50);

SELECT * FROM customer;

INSERT INTO orders (oID, cID, oDate, oTotalPrice) VALUES (1, 1, '2006/3/21',  NULL),
                                                         (2, 2, '2006/3/23', NULL),
                                                         (3, 1, '2006/3/16', NULL);

SELECT * FROM orders;

INSERT INTO product (pID, pName, pPrice) VALUES (1, 'May Giat', 3),
                                                (2, 'Tu Lanh', 5),
                                                (3, 'Dieu Hoa', 7),
                                                (4, 'Quat', 1),
                                                (5, 'Bep Dien', 2);

SELECT * FROM product;

INSERT INTO orderdetails (oID, pID, odQTY) VALUES (1, 1, 3),
                                                  (1, 3, 7),
                                                  (1, 4, 2),
                                                  (2, 1, 1),
                                                  (3, 1, 8),
                                                  (2, 5, 4),
                                                  (2, 3, 3);

SELECT * FROM orderdetails;
# Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice FROM orders;
# Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT cName, pName, odQTY
FROM customer JOIN orders ON customer.cID = orders.cID
    JOIN orderdetails o on orders.oID = o.oID
    JOIN product p on p.pID = o.pID;
# Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT DISTINCT cName FROM customer JOIN orders o on customer.cID = o.cID
WHERE o.oTotalPrice IS NULL;
# Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
# (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
# Giá bán của từng loại được tính = odQTY*pPrice)
SELECT * FROM orders JOIN orderdetails o on orders.oID = o.oID
GROUP BY orders.oID, orders.oDate;