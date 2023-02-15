-- One-time script to drop useless columns from the credit card file, after importing from merged CSV.
USE ashmad;
ALTER TABLE all_cc_trans
DROP account, DROP account_name, DROP auth_code, DROP avs,
DROP brand, DROP card_ending, DROP cvd, DROP merch_trans,
DROP option_code, DROP txn_id, DROP conf_no, DROP error_code,
DROP auth_type, DROP type, DROP ip_addr;
