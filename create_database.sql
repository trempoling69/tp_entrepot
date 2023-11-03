-- créer la base de donnée
create database transport_logistique;

--créer la table entrepot 
CREATE TABLE entrepots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_entrepot VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(50),
    pays VARCHAR(50),
    continent VARCHAR(50)
);

-- Créer la table expeditions
CREATE TABLE expeditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_expedition DATE,
    date_livraison DATE,
    id_entrepot_source INT,
    id_entrepot_destination INT,
    poids DECIMAL(10, 2),
    statut VARCHAR(255),
    FOREIGN KEY (id_entrepot_source) REFERENCES entrepots(id),
    FOREIGN KEY (id_entrepot_destination) REFERENCES entrepots(id)
);


