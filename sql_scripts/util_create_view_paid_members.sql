-- This is a one-time script to create a view of only those members who have made a credit card transaction.
USE ashmad;
DROP VIEW IF EXISTS vw_paid_members;
CREATE VIEW vw_paid_members AS
  SELECT *
  FROM am_am_member m
  WHERE EXISTS
    (SELECT * FROM all_cc_trans cc
      WHERE m.id = cc.pnum);
