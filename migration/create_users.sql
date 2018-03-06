/*
|| Creates Oracle users in iX for each BSCS username from V7 
|| For existing batch users a new profile is assigned
||
|| $Log: create_users.sql,v $
|| Revision 1.3  2011/03/01 18:12:32  shmyg
|| Added trigger for SY
||
|| Revision 1.2  2011-02-21 09:13:06  shmyg
|| Fixed a lot of bugs before migration on bscsix
||
|| Revision 1.1.1.1  2011-02-15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.3  2011-02-01 16:02:22  shmyg
|| Modified some scripts
||
|| Revision 1.2  2011-01-10 10:18:34  shmyg
|| Fixed user creation script
||
|| Revision 1.1  2010-12-01 12:48:49  shmyg
|| Added locking procedure
||
*/

DECLARE

	TYPE	my_type IS TABLE OF PLS_INTEGER INDEX BY BINARY_INTEGER;

	my_tab	my_type;

	v_count	PLS_INTEGER := 0;

	v_au_avid	PLS_INTEGER;
	v_string	VARCHAR2(600);
BEGIN

	-- Mapping for VA_ID in SY_AMOUNTVALUES
	my_tab(11) := 1;
	my_tab(12) := 2;
	my_tab(13) := 3;
	my_tab(21) := 4;
	my_tab(22) := 5;
	my_tab(23) := 6;
	my_tab(31) := 7;
	my_tab(32) := 8;
	my_tab(33) := 9;
	my_tab(73) := 122;
	my_tab(41) := 10;
	my_tab(42) := 11;
	my_tab(43) := 12;
	my_tab(44) := 123;
	my_tab(45) := 124;
	my_tab(51) := 13;
	my_tab(52) := 14;
	my_tab(53) := 15;
	my_tab(61) := 16;
	my_tab(62) := 17;
	my_tab(63) := 18;
	my_tab(64) := 19;
	my_tab(65) := 20;
	my_tab(66) := 21;
	my_tab(72) := 125;
	my_tab(67) := 22;
	my_tab(68) := 23;
	my_tab(69) := 24;
	my_tab(70) := 25;
	my_tab(71) := 26;

	-- Creating the users initially as there is a trigger USERS_AIU on the table
	-- USERS which requires Oracle user to exist before it can be inserted
	-- into the table
	-- We need to create first 'group users' which have GROUP_USER set to null
	-- to avoid constraint violation
	FOR i IN (
		SELECT	username
		FROM	users@bscsv7
		WHERE	batch_flag IS NULL
		AND	username NOT LIKE '\_%'
		AND	username NOT LIKE '%.%'
		AND	username NOT IN
			(
			SELECT	username
			FROM	dba_users
			UNION
			SELECT	username
			FROM	users
			)
		ORDER	BY group_user NULLS FIRST
		)
	LOOP
		BEGIN
		SAVEPOINT my_point;
		EXECUTE IMMEDIATE 'CREATE USER ' || i.username || ' IDENTIFIED BY bscsix';
		EXECUTE IMMEDIATE 'GRANT CREATE SESSION, bscs_role TO ' || i.username ;
		EXECUTE IMMEDIATE 'ALTER USER ' || i.username || ' PASSWORD EXPIRE';
		v_count := v_count + 1;
		DBMS_APPLICATION_INFO.SET_ACTION('Created ' || v_count || ' users' );

		INSERT	INTO shmyg.created_users
			(
			username
			)
		VALUES	(
			i.username
			);

		INSERT	INTO users
			(
			username,
			description,
			cost_center,
			entdate,
			moddate,
			modified,
			batch_flag,
			gmd_prio_reg,
			gmd_prio_erase,
			gmd_prio_servctrl,
			gmd_prio_repl,
			gmd_prio_requ,
			default_collector,
			group_user,
			rec_version,
			user_type,
			mas_default_lng,
			password_expiration_date,
			app_user,
			soi_server_user_flag,
			failed_login_attemps
			)
		(
		SELECT	username,
			description, 
			cost_center,
			entdate,
			TRUNC( SYSDATE ),
			modified,
			batch_flag,
			gmd_prio_reg,
			gmd_prio_erase,
			gmd_prio_servctrl,
			gmd_prio_repl,
			gmd_prio_requ,
			default_collector,
			group_user,
			rec_version,
			user_type,
			mas_default_lng,
			SYSDATE,
			NULL,
			NULL,
			0
		FROM	users@bscsv7
		WHERE	username = i.username
		);

		INSERT	INTO user_class
			(
			USERNAME,
			CLCODE,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
			)
		(
		SELECT	USERNAME,
			CLCODE,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
		FROM	user_class@bscsv7
		WHERE	username = i.username
		);

		-- Purging NMT market
		INSERT	INTO user_markets
			(
			USERNAME,
			SCCODE,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
			)
		(
		SELECT	USERNAME,
			SCCODE,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
		FROM	user_markets@bscsv7
		WHERE	sccode NOT IN ( 4, 5 )
		AND	username = i.username
		);

		-- Creating a new market for each line of GSM
		INSERT	INTO user_markets
			(
			USERNAME,
			SCCODE,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
			)
		(
		SELECT	USERNAME,
			11,
			ENTDATE,
			MODDATE,
			USERLASTMOD,
			REC_VERSION
		FROM	user_markets@bscsv7
		WHERE	sccode = 1
		AND	username = i.username
		);

		FOR	k IN (SELECT * from sy_amountsuser@bscsv7 WHERE auname = i.username)
		LOOP
			INSERT	INTO sy_amountsuser
				(
				AUNAME,
				AU_AVID,
				REC_VERSION
				)
			VALUES	(
				k.auname,
				-- Mapping old codes to new ones
				my_tab(k.au_avid),
				k.rec_version
			);
		END	LOOP;
		
		COMMIT;

		EXCEPTION
			WHEN OTHERS
			THEN
				ROLLBACK TO my_point;
				dbms_output.put_line(i.username || ' ' || SQLERRM);
		END;
		END	LOOP;
END;
/
