/* function turnsmeon_text
This function takes the Ashley Madison members' pref_turnsmeon column's list of
codes, and returns the English language descriptions as a single varchar field.
*/
USE ashmad;
DROP FUNCTION IF EXISTS turnsmeon_text;
DELIMITER //
CREATE FUNCTION turnsmeon_text (turnsmeon_codes VARCHAR(164))
    RETURNS VARCHAR(1000) DETERMINISTIC
BEGIN
  DECLARE to_text VARCHAR(1000); 
  SET to_text = turnsmeon_codes;
  IF to_text IS NULL THEN
    RETURN to_text;
  END IF;
  SET to_text = REPLACE(to_text, '|1|', '|A Don Juan|');
  SET to_text = REPLACE(to_text, '|4|', '|Sense of Humor|');
  SET to_text = REPLACE(to_text, '|6|', '|Aggressive / Take Charge Nature|');
  SET to_text = REPLACE(to_text, '|9|', '|Average Sex Drive|');
  SET to_text = REPLACE(to_text, '|10|', '|Confidence|');
  SET to_text = REPLACE(to_text, '|11|', '|Discretion / Secrecy|');
  SET to_text = REPLACE(to_text, '|12|', '|Dislikes Routine|');
  SET to_text = REPLACE(to_text, '|14|', '|Good Personal Hygiene|');
  SET to_text = REPLACE(to_text, '|16|', '|Has a Secret Love Nest|');
  SET to_text = REPLACE(to_text, '|17|', '|High Sex Drive|');
  SET to_text = REPLACE(to_text, '|18|', '|Imagination|');
  SET to_text = REPLACE(to_text, '|19|', '|Likes Routine|');
  SET to_text = REPLACE(to_text, '|30|', '|A Professional / Well Groomed|');
  SET to_text = REPLACE(to_text, '|31|', '|Stylish / Classy|');
  SET to_text = REPLACE(to_text, '|32|', '|Casual Jeans / T-Shirt Type|');
  SET to_text = REPLACE(to_text, '|33|', '|Tatoos|');
  SET to_text = REPLACE(to_text, '|34|', '|Body Piercing|');
  SET to_text = REPLACE(to_text, '|35|', '|BBW|');
  SET to_text = REPLACE(to_text, '|36|', '|Full Size Body|');
  SET to_text = REPLACE(to_text, '|37|', '|Muscular / Fit Body|');
  SET to_text = REPLACE(to_text, '|38|', '|Petite Figure|');
  SET to_text = REPLACE(to_text, '|39|', '|Slim to Average Body|');
  SET to_text = REPLACE(to_text, '|40|', '|Tall Height|');
  SET to_text = REPLACE(to_text, '|41|', '|Short Height|');
  SET to_text = REPLACE(to_text, '|42|', '|Long Hair|');
  SET to_text = REPLACE(to_text, '|43|', '|Short Hair|');
  SET to_text = REPLACE(to_text, '|44|', '|Girl Next Door|');
  SET to_text = REPLACE(to_text, '|45|', '|Naughty Girl|');
  SET to_text = REPLACE(to_text, '|46|', '|Bad Boy|');
  SET to_text = REPLACE(to_text, '|47|', '|Boy Next Door|');
  SET to_text = REPLACE(to_text, '|48|', '|Creative and Adventurous|');
  SET to_text = REPLACE(to_text, '|49|', '|Relaxed and Easy Going|');
  SET to_text = REPLACE(to_text, '|50|', '|Hopeless Romantic|');
  SET to_text = REPLACE(to_text, '|51|', '|A Father Figure|');
  SET to_text = REPLACE(to_text, '|52|', '|Not Possessive|');
  SET to_text = REPLACE(to_text, '|53|', '|A Good Listener|');
  SET to_text = REPLACE(to_text, '|54|', '|Good Communicator|');
  SET to_text = REPLACE(to_text, '|55|', '|Disease Free|');
  SET to_text = REPLACE(to_text, '|56|', '|Drug Free|');
  SET to_text = REPLACE(to_text, '|57|', '|Casual / Social Drinker|');
  SET to_text = REPLACE(to_text, '|58|', '|Seeking a Sugar Baby|');
  SET to_text = REPLACE(to_text, '|59|', '|Seeking a Sugar Daddy|');
  SET to_text = REPLACE(to_text, '|60|', '|Natural Breasts|');
  SET to_text = REPLACE(to_text, '|61|', '|Facial Hair|');
  SET to_text = REPLACE(to_text, '|62|', '|Tall, Dark, and Handsome|');
  RETURN to_text;
END
//
DELIMITER ;




