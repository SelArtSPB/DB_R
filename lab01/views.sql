SET search_path = 'ofh';
CREATE VIEW view_purchase_storage AS
SELECT 
    p.idPurchase AS purchase_id,
    p.tipe_thing AS type_of_thing,
    p.supplier AS supplier,
    s.addres AS storage_address,
    s.quantity AS quantity_in_storage
FROM 
    purchase p
JOIN 
    storage s ON p.idPurchase = s.id_purchase;


CREATE VIEW view_current_deliveries AS
SELECT 
    d.idDelivery AS delivery_id,
    d.volume AS delivery_volume,
    d.status AS delivery_status,
    d.number_cars AS cars_used,
    d.delivery_date AS expected_delivery_date,
    s.addres AS storage_location
FROM 
    delivery d
JOIN 
    storage s ON d.id_storage = s.idStorage
WHERE 
    d.status <> 'Доставлен';

CREATE VIEW view_employee_details AS
SELECT 
    e.id_employee AS employee_id,
    e.full_name AS name,
    e.status AS employment_status,
    e.direction AS work_direction,
    e.job_title AS position
FROM 
    employees e
WHERE 
    e.status = 'Активен';


CREATE VIEW view_order_summary AS
SELECT 
    o.idOrder AS order_id,
    o.subject_matter AS subject,
    o.maximum_asmount AS max_amount,
    o.total_cost AS total_cost,
    o.delivery_date AS delivery_date,
    d.status AS delivery_status,
    a.addres AS area_address,
    e.full_name AS responsible_employee
FROM 
    "order" o
JOIN 
    delivery d ON o.id_delivery = d.idDelivery
JOIN 
    area a ON o.id_area = a.idArea
JOIN 
    employees e ON o.id_employees = e.id_employee;

