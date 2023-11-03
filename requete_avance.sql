-- PREFIX RA sur les photos

-- Affichez les entrepôts qui ont envoyé au moins une expédition en transit
SELECT entrepots.id, nom_entrepot
FROM entrepots
INNER JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
WHERE expeditions.statut = 'En transit';

-- Affichez les entrepôts qui ont reçu au moins une expédition en transit
SELECT DISTINCT entrepots.id, nom_entrepot
FROM entrepots
INNER JOIN expeditions on entrepots.id = expeditions.id_entrepot_destination
WHERE expeditions.statut = 'En transit';

-- Affichez les expéditions qui ont un poids supérieur à 100 kg et qui sont en transit.
SELECT * FROM expeditions
WHERE statut = 'En transit' AND poids > 100;

-- Affichez le nombre d'expéditions envoyées par chaque entrepôt.
SELECT entrepots.id, nom_entrepot, COUNT(expeditions.id)
FROM entrepots
LEFT JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
GROUP BY entrepots.id, nom_entrepot;

-- Affichez le nombre total d'expéditions en transit.
SELECT COUNT(*) FROM expeditions
WHERE statut = 'En transit'

-- Affichez le nombre total d'expéditions livrées.
SELECT COUNT(*) FROM expeditions
WHERE statut = 'Livré'

-- Affichez le nombre total d'expéditions pour chaque mois de l'année en cours.
SELECT DATE_FORMAT(date_expedition, '%Y-%m') AS mois, COUNT(*)
FROM expeditions GROUP BY mois

-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours.
SELECT entrepots.id, nom_entrepot
FROM entrepots
INNER JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
WHERE expeditions.date_expedition >= CURDATE() - INTERVAL 30 DAY;

-- Affichez les entrepôts qui ont reçu des expéditions au cours des 30 derniers jours.
SELECT entrepots.id, nom_entrepot
FROM entrepots
INNER JOIN expeditions ON entrepots.id = expeditions.id_entrepot_destination
WHERE expeditions.date_expedition >= CURDATE() - INTERVAL 30 DAY;


-- Ajout colonne date_livraison
ALTER TABLE expeditions
ADD date_livraison date

-- Affichez les expéditions qui ont été livrées dans un délai de moins de 5 jours ouvrables.
SELECT * FROM expeditions
WHERE statut = 'Livré' AND DATEDIFF(date_livraison, date_expedition) <= 5
