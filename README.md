# ashley_madison_data_mining_helper
This project contains source code and information useful in analyzing the contents of
the infamous Ashley Madison (am) 2015 data dump.  Ashley Madison was primarily aimed at users
who wanted to discretely find romantic partners, often outside of their current relationship.
## ** This project does not contain any data, only tools to assist in data mining. **

### Why would anyone use this?
- It's a good database to learn or refresh SQL database coding and administration skills.
- Maybe you're wondering if you know someone who has been 'expanding their horizons'.
- This is a great resource for recreational social sciences data mining,
in particular exploring patterns of naughtiness by geography.

### Setup
#### New database and main tables
1. This assumes you have the aforementioned data dump from somewhere on the Internet.
1. Install MySQL on your computer of choice.  This project used a Linux PC but you can also use Windows or Mac.
There are a lot of good online resources to assist you in doing this.  When you're done this step, you
should have a secure database environment that you can access from the MySQL command line interface.
2. Install an IDE, such as MySQL Workbench.  This will make running scripts interactively much easier.
3. Create a new empty database schema for storing the am data.
4. Unpack / unzip the am scripts that you found somewhere on the Internet.  Most of these are database dump
files, each for a table to be restored into your am database.
5. Using your SQL IDE, restore / import each unpiacked dump file into your am database.  On MySQL Workbench,
this is done from the main menu: Server / Data Import, and then the Import from self-contained file option.
6. There are several SQL scripts called 'util_....'.sql that you should run once, mainly to create translation
functions for code values.
#### Credit card transactions table
1. This is not stored as a database dump file in the collection.  Instead, it is a folder of daily CC transaction
CSV files.  To load this into your am database, do the following steps.
2. Once you have downloaded these into their own folder, run the Python program 'merge_cc_csvs.py'.  You will need to tell it
your CC folder location, and the path / file to house a single CSV file of all merged input files.
3. Then import this CSV file into a new database table called 'all_cc_trans' using your IDE's import tools.
In MySQL Workbench, right-click on the target database and select Table Data Import Wizard.  Follow the prompts.
4. Because the CSV contains so many useless columns, you can delete the ones you don't need by running the
included sql_script called 'cc_trans_drop_useless_columns.sql'.
5.  Note that there are no actual credit card numbers stored in the files.
### Usage Notes
- There are a lot of SQL scripts included in this project.  The purpose of these should be obvious
from their names and the brief comments in each.
- Modify these scripts to zoom in on your locations / people of interest.  Note that string comparisons
are not case-sensitive in the default MySQL collating configuration, so you don't have to search for
specific cases.
- There is a lot of missing and fake data in the database.  People did not have to provide real details, and
many would understandably stay anonymous.  The email addresses were valid in order to communicate with potential swing-partners.  The data in the CC table might be a bit more accurate, since real
names and locations are often needed to authorize transactions.
- The meaning of most code table values used in the database can be found in the 2 documents found 
in the project folder.  These are not perfect or complete but are the best available found on the Internet at the time.
- The '...abstract' fields contain long-winded narratives that don't display well within the SQL Workbench results window.
One of the best ways to view these is to do an Export --> to HTML on the results, and then view the results in a browser.
- Most of the scripts include placeholders for actual search criteria.  None of the scripts will produce any results
until you include your own criteria.  Note that in MySQL, commented-out code is preceded by '--'.
#### Happy data mining!


