/* function opento_text
This function takes the Ashley Madison members' pref_opento column's list of
codes, and returns the English language descriptions as a single varchar field.
*/
USE ashmad;
DROP FUNCTION IF EXISTS opento_text;
DELIMITER //
CREATE FUNCTION opento_text (opento_codes VARCHAR(164))
    RETURNS VARCHAR(1000) DETERMINISTIC
BEGIN
  DECLARE to_text VARCHAR(1000); 
  SET to_text = opento_codes;
  IF to_text IS NULL THEN
    RETURN to_text;
  END IF;
  SET to_text = REPLACE(to_text, '|1|', '|Threesome|');
  SET to_text = REPLACE(to_text, '|3|', '|Being Dominant / Master|');
  SET to_text = REPLACE(to_text, '|4|', '|Being Submissive / Slave|');
  SET to_text = REPLACE(to_text, '|6|', '|Bondage|');
  SET to_text = REPLACE(to_text, '|7|', '|Conventional Sex|');
  SET to_text = REPLACE(to_text, '|11|', '|Fetishes|');
  SET to_text = REPLACE(to_text, '|14|', '|Nothing Kinky|');
  SET to_text = REPLACE(to_text, '|15|', '|One-Night Stands|');
  SET to_text = REPLACE(to_text, '|17|', '|Role Playing|');
  SET to_text = REPLACE(to_text, '|18|', '|Sex Talk|');
  SET to_text = REPLACE(to_text, '|19|', '|Spanking|');
  SET to_text = REPLACE(to_text, '|21|', '|Experimenting with Tantric Sex|');
  SET to_text = REPLACE(to_text, '|22|', '|Transvestitism|');
  SET to_text = REPLACE(to_text, '|23|', '|Experimenting with Sex Toys|');
  SET to_text = REPLACE(to_text, '|26|', '|Aggressiveness|');
  SET to_text = REPLACE(to_text, '|27|', '|Blindfolding|');
  SET to_text = REPLACE(to_text, '|28|', '|Bubble Batch for 2|');
  SET to_text = REPLACE(to_text, '|29|', '|Cuddling & Hugging|');
  SET to_text = REPLACE(to_text, '|30|', '|Curious - Domination|');
  SET to_text = REPLACE(to_text, '|31|', '|Curious - Submission|');
  SET to_text = REPLACE(to_text, '|32|', '|Dressing Up / Lingerie|');
  SET to_text = REPLACE(to_text, '|33|', '|Erotic Movies|');
  SET to_text = REPLACE(to_text, '|34|', '|Erotic Tickling|');
  SET to_text = REPLACE(to_text, '|36|', '|Extended Foreplay / Teasing|');
  SET to_text = REPLACE(to_text, '|37|', '|Gentlenness|');
  SET to_text = REPLACE(to_text, '|38|', '|Good with your Hands|');
  SET to_text = REPLACE(to_text, '|39|', '|Kissing|');
  SET to_text = REPLACE(to_text, '|40|', '|Light Kinky Fun|');
  SET to_text = REPLACE(to_text, '|41|', '|Likes to be Watched / Exhibitionism|');
  SET to_text = REPLACE(to_text, '|42|', '|Likes to Give Oral Sex|');
  SET to_text = REPLACE(to_text, '|43|', '|Likes to Receive Oral Sex|');
  SET to_text = REPLACE(to_text, '|44|', '|Likes to Go Slow|');
  SET to_text = REPLACE(to_text, '|45|', '|Lots of Stamina|');
  SET to_text = REPLACE(to_text, '|46|', '|Open to Experimentation|');
  SET to_text = REPLACE(to_text, '|48|', '|Sensual Massage|');
  SET to_text = REPLACE(to_text, '|49|', '|Sharing Fantasies|');
  SET to_text = REPLACE(to_text, '|50|', '|Someone I Can Teach|');
  SET to_text = REPLACE(to_text, '|51|', '|Someone Who Can Teach Me|');
  SET to_text = REPLACE(to_text, '|53|', '|Likes to Cross Dress|');
  SET to_text = REPLACE(to_text, '|52|', '|You Like to Cross Dress|');
  RETURN to_text;
END
//
DELIMITER ;




