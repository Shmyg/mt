SPOOL	rtx_tablespaces.log

CREATE	TABLESPACE RTX_TAP_KEY DATAFILE
	'/ora/rtxdata02/RTX9R1/d_rtx_tap_key_01.dbf' SIZE 8G AUTOEXTEND OFF,
	'/ora/rtxdata02/RTX9R1/d_rtx_tap_key_02.dbf' size 8G AUTOEXTEND OFF;
	'/ora/rtxdata02/RTX9R1/d_rtx_tap_key_03.dbf' size 8G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_ERROR_112009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_error_112009_01.dbf' SIZE 8G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_ERROR_122009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_error_122009_01.dbf' SIZE 2G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_RAP_112009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_rap_112009_01.dbf' SIZE 4G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_RAP_122009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_rap_122009_01.dbf' SIZE 2G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_TAP_112009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_tap_112009_01.dbf' SIZE 8G AUTOEXTEND OFF,
	'/ora/rtxdata03/RTX9R1/d_rtx_tap_112009_02.dbf' size 8G AUTOEXTEND OFF;

CREATE	TABLESPACE RTX_TAP_122009 DATAFILE
	'/ora/rtxdata03/RTX9R1/d_rtx_tap_122009_01.dbf' SIZE 2G AUTOEXTEND OFF;

SPOOL	OFF
