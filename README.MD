# OracleEmailTable

Generate ***html*** table in ***Oracle Package*** using ***GLOBAL TEMPORARY TABLE***.\
Returning **CLOB**.\
The main function is to add this table to email but you can use it for other purposes.

## Install

Execute PL/SQL scripts from\
**1. EMAIL_TABLE.sql**\
**2. PKG$EMAIL_TABLE_(SPECIFICATION).sql**\
**3. PKG$EMAIL_TABLE_(BODY).sql**

## How to use

| Type | Name  | Description |
| ------------- | ------------- | ------------- |
|PROCEDURE | pINIT_TABLE  | init table  |
|PROCEDURE | pADD_VALUE(P_cVALUE CLOB)  | add value  |
|PROCEDURE | pNEXT_ROW | to next row |
|PROCEDURE | pPREV_ROW | to next row |
|FUNCTION| fGET_TABLE | get clob table |

## Example

```
DECLARE 
	cMAIL_TEXT CLOB;
BEGIN
  	PKG$EMAIL_TABLE.pINIT_TABLE;	
	PKG$EMAIL_TABLE.pADD_VALUE('Test First column 1');
	PKG$EMAIL_TABLE.pADD_VALUE('Test value 1');
	
	PKG$EMAIL_TABLE.pNEXT_ROW;
	PKG$EMAIL_TABLE.pADD_VALUE('Test First column 2');
	PKG$EMAIL_TABLE.pADD_VALUE('Test value 2');
								
	cMAIL_TEXT:=PKG$EMAIL_UTIL.f$GET_TABLE;

	-- Add your send to email here
	
END;
```

<table>
  <tr>
    <td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logo_mini.gif" title="logo"></td>
    <td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logoRS_FULL.png" title="RuslanShevyrev"></td>
  </tr>
</table>