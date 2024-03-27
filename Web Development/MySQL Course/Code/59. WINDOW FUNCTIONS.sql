-- WINDOW FUNCTIONS

-- WINDOW FUNCTION PERFORM THE AGGREGATION ON EACH ROW


/*
Window functions applies aggregate and ranking functions over a particular window (set of rows). 
OVER clause is used with window functions to define that window. OVER clause does two things : 

Partitions rows into form set of rows. (PARTITION BY clause is used) 
Orders rows within those partitions into a particular order. (ORDER BY clause is used) 
Note: If partitions aren’t done, then ORDER BY orders all rows of TABLE. 
*/



/*
Ranking Window Functions : 
Ranking functions are, RANK(), DENSE_RANK(), ROW_NUMBER() 

RANK() – 
As the name suggests, the rank function assigns rank to all the rows within every partition. 
Rank is assigned such that rank 1 given to the first row and rows having same value are assigned 
same rank. For the next rank after two same rank values, one rank value will be skipped. 

 
DENSE_RANK() – 
It assigns rank to each row within partition. Just like rank function first row is assigned
 rank 1 and rows having same value have same rank. 
 The difference between RANK() and DENSE_RANK() is that in DENSE_RANK(), 
 for the next rank after two same rank, consecutive integer is used, no rank is skipped. 

 
ROW_NUMBER() – 
It assigns consecutive integers to all the rows within partition. 
Within a partition, no two rows can have same row number. 

 
Note – 
ORDER BY() should be specified compulsorily while using rank window functions. 

*/

-- OTHER REFERENCE -  https://www.geeksforgeeks.org/window-functions-in-sql/