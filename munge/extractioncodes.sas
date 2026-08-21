libname sos 'P:\k2_stat_heartfailure\Projects\20210525_shfdb4\dm\raw-data\SOS\20240423';

data lm; 
set sos.ut_r_lmed_7140_2024;
atc5 = substr(ATC, 1, 5);  
atc4 = substr(ATC, 1, 4); 
atc3 = substr(ATC, 1, 3); 
 
if (ANTAL > 0 AND (atc3 IN ("C09", "C07", "C10") or atc4 IN ("A10A", "A10B", "C03A", "C03B", "C03C") or atc5 IN ("C03DA", "C03EB", "B01AC", "B01AA", "B01AE", "B01AF"))); 

keep lopnr atc edatum; 
run; 

proc import file="P:\k2_stat_heartfailure\Projects\20260723_giulio_ckmdatabase\data\raw-data\ndrpats.txt"
    out=ndrid
    dbms=tab;
run;

proc SQL;
create table lmdata as
   select *
   from ndrid as n inner join 
           lm as l
      on n.lopnr=l.lopnr;
quit;

libname extra "P:\k2_stat_heartfailure\Projects\20260723_giulio_ckmdatabase\data\raw-data";

data extra.lmndr; 
set lmdata; 
run; 
