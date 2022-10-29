CREATE OR REPLACE PACKAGE BODY PKG$EMAIL_TABLE
AS

nROW_LAST 		NUMBER := 1;
nCOLUMN_PREV	NUMBER := 1;
nCOLUMN_LAST 	NUMBER := 1;

-- init table
PROCEDURE pINIT_TABLE
AS
BEGIN
	DELETE FROM EMAIL_TABLE;
	nROW_LAST 		:=1;
	nCOLUMN_LAST	:=1;
	nCOLUMN_PREV	:=1;
END pINIT_TABLE;

-- add value
PROCEDURE pADD_VALUE(P_cVALUE CLOB)
AS
BEGIN 
	INSERT INTO EMAIL_TABLE
				(ROW_NUMB,
				COLUMN_NUMB,
				VALUE)
		VALUES(nROW_LAST,
				nCOLUMN_LAST,
				P_cVALUE);
	nCOLUMN_LAST:=n$COLUMN_LAST+1;
END pADD_VALUE;

-- to next row
PROCEDURE pNEXT_ROW
AS
BEGIN 
	nROW_LAST		:=nROW_LAST+1;
	nCOLUMN_PREV	:=nCOLUMN_LAST;
	nCOLUMN_LAST	:=1;
END pNEXT_ROW;

-- to previous row
PROCEDURE pPREV_ROW
AS
BEGIN 
	nROW_LAST		:=nROW_LAST-1;
	nCOLUMN_LAST	:=nCOLUMN_PREV;
END pPREV_ROW;

-- get clob table
FUNCTION fGET_TABLE RETURN CLOB
AS 
	vTABLE		CLOB;
BEGIN 
	
	vTABLE:='<table style="width: 100%;margin: 0 auto 0 auto;">'||
    				'<tbody>'||
        				'<tr>'||
            				'<td>'||
            			     	'<table style="width: 100%;">'||
                    				'<tbody>';
                
	FOR nROW IN 1..nROW_LAST
	LOOP
		vTABLE:=vTABLE||'<tr>';
		FOR c_row IN (SELECT COLUMN_NUMB,
							 VALUE
						FROM EMAIL_TABLE
						WHERE ROW_NUMB = nROW
						ORDER BY COLUMN_NUMB)
		LOOP
			IF c_row.COLUMN_NUMB = 1 THEN 
				vTABLE:=vTABLE||'<td style="background: #ebebeb;'||
									'height: 40px;'||
									'padding-left: 10px;'||
									'padding-right: 10px;'||
									'width: auto;'||
									'white-space: nowrap;'||
									'font-weight: bold;'||
									'min-width: 160px;">'||
										c_row.VALUE||
									 '</td>';
			ELSE
				vTABLE:=vTABLE||'<td style="background: #ebebeb;
                        			height: 40px;
                        			padding-left: 10px;
                        			padding-right: 10px;
                        			width: 100%;">'||
										c_row.VALUE||
									 '</td>';
			END IF;
		END LOOP;
		vTABLE:=vTABLE||'</tr>';
	END LOOP;
	VTABLE:=VTABLE||'</tbody>'||
               		'</table>'||
				'</td>'||
        	'</tr>'||
    	'</tbody>'||
	'</table>';

	RETURN VTABLE;
END fGET_TABLE;

END PKG$EMAIL_TABLE;