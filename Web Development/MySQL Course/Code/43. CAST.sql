-- CAST OPERATOR 
-- The CAST() function converts a value (of any type) into a specified datatype.

-- CAST(expression AS datatype(length))

/*
expression	Required. The value to convert

datatype	Required. The datatype to convert expression to. Can be one of the following: bigint, int, smallint, tinyint, bit, decimal, numeric, money, smallmoney, float, real, datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary, or image

(length)	Optional. The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary)
*/

SELECT CAST('09:00:00' AS TIME); -- STRING TO TIME
-- BY DEFAULT SQL HAS FACILITY OF TYPE CONVERISON BUT WE CAN DO EXPLICIT CONVERSION ALSO