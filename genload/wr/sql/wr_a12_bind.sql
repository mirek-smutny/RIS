exec :pin := ($$CNT);
select /* A12 */ * from ris.r_a12 where pin=:pin;
