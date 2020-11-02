DROP TABLE IF EXISTS `single`;
CREATE TABLE single
SELECT itemid, MIN(price) as AHPrice 
FROM auction_house a
WHERE seller_name = 'IVALICE' AND stack = 0
AND NOT EXISTS(SELECT 1 FROM item_basic b WHERE a.itemid = b.itemid AND b.itemid BETWEEN 8805 AND 8916)
GROUP BY itemid;

DROP TABLE IF EXISTS `item_pricing`;
create table item_pricing (
	item_id int,
    price int,
	hqBonus int
);
INSERT INTO item_pricing
SELECT itemid, AHPrice, 1 FROM single;

delimiter //
DROP PROCEDURE determine_item_pricing;
CREATE PROCEDURE determine_item_pricing(IN pItemId INT, OUT pPrice INT)
start_label: BEGIN
	DECLARE totalPrice INT DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE vID, vIngredient1, vIngredient2, vIngredient3, vIngredient4, vIngredient5, vIngredient6, vIngredient7, vIngredient8, vResult, vResultHQ1, vResultHQ2, vResultHQ3, vResultQty, vResultHQ1Qty, vResultHQ2Qty, vResultHQ3Qty, vRecipePrice, vitemPrice, vhqBonus INT;
    DECLARE vIsFound BOOL;
	DECLARE cur1 CURSOR FOR SELECT ID, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Result, ResultHQ1, ResultHQ2, ResultHQ3, ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty 
								FROM synth_recipes WHERE pItemId IN (Result,ResultHQ1,ResultHQ2,ResultHQ3) AND Desynth = 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	-- Set maximum recursion depth (max is 255)
	SET @@SESSION.max_sp_recursion_depth = 255;

    IF(NOT EXISTS(SELECT 1 FROM item_pricing WHERE item_id = pItemId)) THEN
		IF(EXISTS(SELECT 1 FROM synth_recipes WHERE pItemId IN (Result,ResultHQ1,ResultHQ2,ResultHQ3))) THEN
			
			OPEN cur1;
	  
			read_loop: LOOP
				FETCH cur1 INTO vID, vIngredient1, vIngredient2, vIngredient3, vIngredient4, vIngredient5, vIngredient6, vIngredient7, vIngredient8, vResult, vResultHQ1, vResultHQ2, vResultHQ3, vResultQty, vResultHQ1Qty, vResultHQ2Qty, vResultHQ3Qty;
				IF done THEN
					LEAVE read_loop;
				END IF;
                
                SET vRecipePrice = 0;
                SET vIsFound = TRUE;
                SET vitemPrice = NULL;

				IF (vIngredient1 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient1)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient1);
					ELSE
						CALL determine_item_pricing(vIngredient1, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
						ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient2 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient2)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient2);
					ELSE
						CALL determine_item_pricing(vIngredient2, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient3 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient3)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient3);
					ELSE
						CALL determine_item_pricing(vIngredient3, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient4 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient4)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient4);
					ELSE
						CALL determine_item_pricing(vIngredient4, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient5 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient5)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient5);
					ELSE
						CALL determine_item_pricing(vIngredient5, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient6 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient6)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient6);
					ELSE
						CALL determine_item_pricing(vIngredient6, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient7 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient7)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient7);
					ELSE
						CALL determine_item_pricing(vIngredient7, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
				
				IF (vIngredient8 != 0) THEN
					IF(EXISTS(SELECT 1 FROM item_pricing WHERE item_id = vIngredient8)) THEN
						SET vRecipePrice = (SELECT price + vRecipePrice FROM item_pricing WHERE item_id = vIngredient8);
					ELSE
						CALL determine_item_pricing(vIngredient8, vitemPrice);
                        IF (vitemPrice IS NULL) THEN
							SET vIsFound = FALSE;
                        ELSE
							SET vRecipePrice = vRecipePrice + vitemPrice;
                        END IF;
					END IF;
				END IF;
                
                IF(vIsFound != FALSE AND (pPrice IS NULL OR vRecipePrice < pPrice)) THEN
					IF (pItemId = vResult) THEN
						SET pPrice = vRecipePrice DIV vResultQty;
						SET vhqBonus = 1;
                    ELSEIF (pItemId = vResultHQ1) THEN
						SET pPrice = vRecipePrice DIV vResultHQ1Qty;
						SET vhqBonus = 5;
                    ELSEIF (pItemId = vResultHQ2) THEN
						SET pPrice = vRecipePrice DIV vResultHQ2Qty;
						SET vhqBonus = 10;
                    ELSEIF (pItemId = vResultHQ3) THEN
						SET pPrice = vRecipePrice DIV vResultHQ3Qty;
						SET vhqBonus = 20;
                    END IF;
                END IF;
                
			END LOOP read_loop;
			CLOSE cur1;  
            
            IF pPrice > 0 THEN
				INSERT INTO item_pricing VALUES (pItemId, pPrice, vhqBonus);
			ELSEIF (EXISTS(SELECT 1 FROM vendor_prices WHERE item_id = pItemId)) THEN
				SET pPrice = (SELECT price FROM vendor_prices WHERE item_id = pItemId);
			END IF;
        END IF;
    END IF;
END//

DROP PROCEDURE determine_equipment_pricing;
CREATE PROCEDURE determine_equipment_pricing()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE vitemid INT;
  DECLARE vPrice INT;
  DECLARE cur1 CURSOR FOR SELECT itemid FROM item_equipment;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  
  read_loop: LOOP
    FETCH cur1 INTO vitemid;
    IF done THEN
      LEAVE read_loop;
    END IF;

	CALL determine_item_pricing(vitemid,vPrice);

  END LOOP read_loop;

  CLOSE cur1;
END//
delimiter ;

call determine_equipment_pricing();

UPDATE item_basic ib
INNER JOIN item_equipment ie
	ON ib.itemid = ie.itemid
INNER JOIN item_pricing ip
	ON ib.itemid = ip.item_id
LEFT OUTER JOIN vendor_prices vp
	ON ib.itemid = vp.item_id
SET ib.BaseSell = FLOOR(IF(vp.item_id IS NULL OR ip.price * 5 * ip.hqBonus < vp.price, ip.price * 5 * ip.hqBonus , vp.price))
WHERE aH NOT IN (15, 35, 36, 49);

DROP TABLE item_pricing;
DROP TABLE single;