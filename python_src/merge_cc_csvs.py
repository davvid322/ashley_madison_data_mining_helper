# --------------------------------------------------------------------------
# merge_cc_csvs.py (Python3; developed and tested on Ubuntu Linux 22.04)
#
# The Ashley Madison database hack in 2015 was posted on the Internet (torrent sites).  Most of the dump
# was in the form of MySQL database dumps, but one archive contained daily credit card transaction files
# in .csv format.  Each CSV has the same format, but it's a bit messed up.  This program processes all of 
# this folder from a specified directory, merging the data rows and a proper header row into a single CSV file.
# That CSV file can then be imported into a MySQL table and queries along with the other MySQL tables.
#
# --------------------------------------------------------------------------

import os

# Initialize
in_csv_path_name = input('Enter the path name for the folder containing credit card transaction CSVs: ')
out_csv_file_name = input('Enter the path and file name for the output merged CSV file: ')
out_csv_file = open(out_csv_file_name, 'w')
dircount = 0
filecount = 0
all_rowcount = 0

print ('Starting...')
      
def process_one_file(myfilename: str):
    # Open one CSV file, and skip the first 3 lines (2 blank lines and a messed-up header line)
    # Then, copy each remaining row to the merged output csv file.
    
    global all_rowcount
    in_file = open(myfilename)
    one_rowcount = 0
    for in_row in in_file:
        one_rowcount += 1;
        if one_rowcount > 3:
            fixed_row = in_row[0:-2] + '\n'   # get rid of bad trailing ','
            print(fixed_row, end = '', file = out_csv_file)
            all_rowcount += 1
    in_file.close()
    print ('\nProcessed : ', myfilename, ' = ', one_rowcount, ' rows')
# End - process_one_file
        
# Main program

print('Processing : ', in_csv_path_name, ' --> ', out_csv_file_name)

# Create the CSV header row string and write it to the file
csv_header = 'account,account_name,amount,auth_code,avs,brand,card_ending,cvd,pnum,' + \
             'name,merch_trans,option_code, trans_date,txn_id,conf_no,error_code,' + \
             'auth_type,type,city,country,email,phone,state,addr1,addr2,zip,ip_addr'
print(csv_header, file = out_csv_file)
 
# Recusively walk through the top-level folder and all subfolders, and files therein in sorted order
for dirName, subdirList, fileList in os.walk(in_csv_path_name):
    dircount += 1
    print('Processing directory: %s' % dirName)
    for fname in sorted(fileList):
        filecount += 1
        fullfname = os.path.join(dirName, fname)
        process_one_file(fullfname)
        
# Print the report's summary statistics and show on-screen as well
print('\nDirectories : ', dircount, '\t Files : ', filecount, '\t Total Row Count : ', all_rowcount)
out_csv_file.close()
print ('\n*** Done ***')
