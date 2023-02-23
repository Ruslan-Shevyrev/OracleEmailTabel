<p align="center">
  <img src="https://github.com/Ruslan-Shevyrev/MediaFilesToGitHub/blob/master/OracleEmailTable/media/OracleEmailTable.gif" width="350" title="OracleEmailTabel">
</p>

# Email-Table

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
|PROCEDURE | pINIT_TABLE  | Table initialization. Deletes all data from the temporary table and moves the current position to the first row of the first column. It is recommended to always call this procedure before creating each new table. |
|PROCEDURE | pADD_VALUE(P_cVALUE CLOB)  | Add a value to the current cell and move the current position to the next column in that row. In parameter is cell value. |
|PROCEDURE | pNEXT_ROW | Move the current position to the next line, first column. |
|PROCEDURE | pPREV_ROW | Move the current position to the previous line, first column. |
|FUNCTION| fGET_TABLE | Get xml table. The function returns a CLOB. |

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
								
	cMAIL_TEXT:=PKG$EMAIL_TABLE.fGET_TABLE;

	-- DBMS_OUTPUT.PUT_LINE(cMAIL_TEXT); -- for test only
	-- Add your send to email here
	
END;
```

HTML Table looks like:

```
<table style="width: 100%;margin: 0 auto 0 auto;"><tbody><tr><td><table style="width: 100%;"><tbody><tr><td style="background: #ebebeb;height: 40px;padding-left: 10px;padding-right: 10px;width: auto;white-space: nowrap;font-weight: bold;min-width: 160px;">Test First column 1</td><td style="background: #ebebeb;
                        			height: 40px;
                        			padding-left: 10px;
                        			padding-right: 10px;
                        			width: 100%;">Test value 1</td></tr><tr><td style="background: #ebebeb;height: 40px;padding-left: 10px;padding-right: 10px;width: auto;white-space: nowrap;font-weight: bold;min-width: 160px;">Test First column 2</td><td style="background: #ebebeb;
                        			height: 40px;
                        			padding-left: 10px;
                        			padding-right: 10px;
                        			width: 100%;">Test value 2</td></tr></tbody></table></td></tr></tbody></table>

```

In Email it looks like:

<p align="center">
  <img src="https://github.com/Ruslan-Shevyrev/MediaFilesToGitHub/blob/master/OracleEmailTable/media/OracleEmailTable1.png" width="1000" title="Table Example">
</p>

<table>
  <tr>
    <td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logo_mini.gif" title="logo"></td>
    <td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logoRS_FULL.png" title="RuslanShevyrev"></td>
  </tr>
</table>
