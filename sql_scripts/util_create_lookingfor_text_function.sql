/* function lookingfor_text
This function takes the Ashley Madison members' pref_lookingfor column's list of
codes, and returns the English language descriptions as a single varchar field.
*/
USE ashmad;
DROP FUNCTION IF EXISTS lookingfor_text;
DELIMITER //
CREATE FUNCTION lookingfor_text (lookingfor_codes VARCHAR(164))
    RETURNS VARCHAR(1000) DETERMINISTIC
BEGIN
  DECLARE to_text VARCHAR(1000); 
  SET to_text = lookingfor_codes;
  IF to_text IS NULL THEN
    RETURN to_text;
  END IF;
  SET to_text = REPLACE(to_text, '|47|', '|Fine Dining / Candle Lit  Dinners|');
  SET to_text = REPLACE(to_text, '|48|', '|Travel|');
  SET to_text = REPLACE(to_text, '|49|', '|Picnics|');
  SET to_text = REPLACE(to_text, '|53|', '|Shopping for Sexy Clothes / Lingerie|');
  SET to_text = REPLACE(to_text, '|54|', '|I Enjoy Being a Father Figure|');
  SET to_text = REPLACE(to_text, '|55|', '|Cooking / Barbequing|');
  SET to_text = REPLACE(to_text, '|56|', '|Music Lover|');
  SET to_text = REPLACE(to_text, '|57|', '|Dancing|');
  SET to_text = REPLACE(to_text, '|58|', '|Theatre|');
  SET to_text = REPLACE(to_text, '|59|', '|Opera|');
  SET to_text = REPLACE(to_text, '|60|', '|Politics|');
  SET to_text = REPLACE(to_text, '|61|', '|Motorcycles|');
  SET to_text = REPLACE(to_text, '|62|', '|Cards|');
  SET to_text = REPLACE(to_text, '|63|', '|Strip Poker / Adult Games|');
  SET to_text = REPLACE(to_text, '|64|', '|Board Games|');
  SET to_text = REPLACE(to_text, '|65|', '|On-Line Games|');
  SET to_text = REPLACE(to_text, '|66|', '|Visiting Adult Swing Clubs|');
  SET to_text = REPLACE(to_text, '|67|', '|Daring Rendezvous|');
  SET to_text = REPLACE(to_text, '|68|', '|Playing Sports|');
  SET to_text = REPLACE(to_text, '|69|', '|Erotic Literature|');
  SET to_text = REPLACE(to_text, '|70|', '|Physical Fitness|');
  SET to_text = REPLACE(to_text, '|71|', '|Karaoke|');
  SET to_text = REPLACE(to_text, '|72|', '|Cottage Country|');
  SET to_text = REPLACE(to_text, '|73|', '|Boating|');
  SET to_text = REPLACE(to_text, '|74|', '|The Outdoors / Nature|');
  SET to_text = REPLACE(to_text, '|75|', '|Photography|');
  SET to_text = REPLACE(to_text, '|76|', '|Skinny Dipping|');
  SET to_text = REPLACE(to_text, '|77|', '|Romantic Walks|');
  SET to_text = REPLACE(to_text, '|78|', '|Wine Tasting|');
  SET to_text = REPLACE(to_text, '|79|', '|I Do Not Drink|');
  SET to_text = REPLACE(to_text, '|80|', '|I am a Social Drinker|');
  SET to_text = REPLACE(to_text, '|81|', '|Watching Sports|');
  RETURN to_text;
END
//
DELIMITER ;




