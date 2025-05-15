-- a. Consultar las tablas por separado
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;

-- b. Crear los JOINS necesarios para obtener las órdenes completas por cliente
SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.orderDate,
    o.status,
    od.productCode,
    p.productName,
    od.quantityOrdered,
    od.priceEach,
    (od.quantityOrdered * od.priceEach) AS totalLinea
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
ORDER BY c.customerNumber, o.orderNumber;

-- c. Crear la vista con la consulta anterior
CREATE OR REPLACE VIEW vista_ordenes_completas_por_cliente AS
SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.orderDate,
    o.status,
    od.productCode,
    p.productName,
    od.quantityOrdered,
    od.priceEach,
    (od.quantityOrdered * od.priceEach) AS totalLinea
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;