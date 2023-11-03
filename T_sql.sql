-- PREFIXE T_SQL

-- Créez une vue pour afficher les informations pour chaque entrepôt
CREATE VIEW infos_entrepot AS
SELECT e.id AS entrepot_id, e.nom_entrepot, CONCAT(e.adresse, ', ', e.ville, ', ', e.pays) AS adresse_complete,
       COUNT(exp.id) AS nombre_expeditions_30_jours
FROM entrepots e
LEFT JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.id, e.nom_entrepot, adresse_complete;

    -- POUR AFFICHER LA VUE CREEE
    SELECT * FROM infos_entrepot;

-- Créez une procédure stockée pour renvoyer le nombre total d'expéditions envoyées par un entrepôt au cours du dernier mois
DELIMITER $$
CREATE PROCEDURE GetNombreExpeditionsMoisDernier(IN entrepotID INT, OUT totalExpeditions INT)
BEGIN
    SELECT COUNT(id) INTO totalExpeditions
    FROM expeditions
    WHERE id_entrepot_source = entrepotID
    AND date_expedition >= CURDATE() - INTERVAL 30 DAY;
END $$
DELIMITER ;

    -- UTILISATION DE LA PROCEDURE CREEE POUR L'ENTREPOT 2
    CALL transport_logistique.GetNombreExpeditionsMoisDernier(2, @totalExpeditions);

    -- AFFICHAGE DU RESULTAT DE LA PROCEDURE
    SELECT @totalExpeditions;
