exec :pin := ($$CNT);
select /* A11 */ * from ris.r_a11 where pin=:pin;
