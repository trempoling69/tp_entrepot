INSERT INTO entrepots (nom_entrepot, adresse, ville, pays, continent) VALUES 
('Entrepot A', '123 Rue de la République', 'Paris', 'France', 'EUROPE'),
('Entrepot B', '456 Main Street', 'New York', 'USA', 'AMERIQUE'),
('Entrepot C', '789 High Street', 'London', 'UK', 'EUROPE'),
('Entrepot D', '101 First Avenue', 'Tokyo', 'Japan', 'ASIE'),
('Entrepot E', '202 Elm Street', 'Los Angeles', 'USA', 'AMERIQUE'),
('Entrepot F', '303 Maple Avenue', 'Toronto', 'Canada', 'AMERIQUE'),
('Entrepot G', '404 Oak Street', 'Sydney', 'Australia', 'AUTRALIE'),
('Entrepot H', '505 Pine Street', 'Berlin', 'Germany', 'EUROPE');


INSERT INTO expeditions (date_expedition, id_entrepot_source, id_entrepot_destination, poids, statut, date_livraison) VALUES
('2023-10-15', 1, 2, 500.75, 'En cours', '2023-10-19'),
('2023-10-16', 2, 3, 300.50, 'Livré', '2023-10-30'),
('2023-10-17', 3, 1, 700.25, 'En cours', '2023-10-19'),
('2023-11-18', 4, 2, 200.00, 'En transit', '2023-10-29'),
('2023-10-19', 5, 4, 450.20, 'En cours', '2023-11-02'),
('2023-12-20', 6, 3, 600.75, 'Livré', '2023-12-23'),
('2023-10-21', 7, 1, 350.40, 'En cours', '2023-10-29'),
('2023-10-22', 8, 2, 800.00, 'En transit', '2023-11-10'),
('2023-11-22', 2, 5, 100.00, 'Livré', '2023-11-23'),
('2023-10-22', 1, 4, 800.00, 'En transit', '2023-11-10');