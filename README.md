# Alliance Builder

## To Access App

This is an old Shiny App I built years ago.  This version has been redesigned to run on Amazon Web Services using a Shiny App.  It can be found at:

http://34.213.126.123:3838/Jap_Elections_w_Leaflet/

# Explanation

The Alliance Builder is a tool designed to help analyze Japanese electoral results between 1996 and 2017 for single-member districts.  The alliance builder uses real electoral data from these elections, and is built to answer the hypothetical question, "How would party X perform if it were allied with party Y".  

The app works by constructing a ternary plot between three alliances.  By default, the first and second are built around the top two parties and their allies.  The third alliance on the other hand defaults to the best candidate outside of this alliance--often an independent; however, one can still specify the members of this third alliance.

When creating an alliance, the party that performed worse in each district is assumed to step down in favor of the stronger, and all wins for the coalition are summed.  However, three is a question of efficiency.  However, when a party steps down, his votes do not automatically go to the allied party.  Voters, and sometimes even the candidate asked to step down, do not always cooperate.  This is where alliance efficiency comes in.  Alliance efficiency represented on net how many votes go to the allied party in each district on net.  If it is set to 0%, that could mean perhaps that 50% backed the allied party, and 50% backed their cheif competitor--resulting in a net of 0%; whereas 100% means a total shift of support from one party to another.

To allow for more convenient comparisons, the app also supports a "save" function, which copies the current ternary plot and puts it to the side.
