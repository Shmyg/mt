select * from (select ts_name, datafile_size, number_of_datafiles, (select count(*) from dba_data_files where tablespace_name = ts.ts_name)
as curr_number_of_datafiles from tablespaces ts) where number_of_datafiles != curr_number_of_datafiles;
