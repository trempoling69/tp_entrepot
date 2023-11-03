-- PREFIXE RC SUR LES PHOTOS

-- Ajout colonne continent
ALTER TABLE entrepots
ADD continent VARCHAR(50)

-- Affichez les expéditions en transit initiées par un entrepôt en Europe et à destination d'un entrepôt en Asie.
SELECT exp.*
FROM expeditions exp
INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE source.continent = 'EUROPE'
  AND destination.continent = 'ASIE'
  AND exp.statut = 'En transit';

-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans le même pays.
SELECT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE e.pays = destination.pays;

-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans un pays différent.
SELECT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE e.pays != destination.pays;

-- Affichez les expéditions en transit initiées par un entrepôt situé dans un pays dont le nom commence par la lettre "F" et qui pèsent plus de 500 kg.
SELECT exp.*
FROM expeditions exp
INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
WHERE LEFT(source.pays, 1) = 'F' AND exp.poids > 500 AND exp.statut = 'En transit';

-- Affichez le nombre total d'expéditions pour chaque combinaison de pays d'origine et de destination.
SELECT source.pays AS pays_origine, destination.pays AS pays_destination, COUNT(*)
FROM expeditions exp
INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
GROUP BY source.pays, destination.pays;

-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours et dont le poids total des expéditions est supérieur à 1000 kg.
SELECT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.id, e.nom_entrepot
HAVING SUM(exp.poids) > 1000;

-- Affichez les expéditions qui ont été livrées avec un retard de plus de 2 jours ouvrables

-- Affichez le nombre total d'expéditions pour chaque jour du mois en cours, trié par ordre décroissant.
SELECT DATE_FORMAT(date_expedition, '%Y-%m-%d') AS jour, COUNT(*) AS nombre_expeditions
FROM expeditions
WHERE MONTH(date_expedition) = MONTH(CURDATE())
GROUP BY jour
ORDER BY jour DESC;