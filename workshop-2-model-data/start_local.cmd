::: Terminal 1

sa.engine -ns


::: Terminal 2

sa.engine -c central-server -O start_local.osql


::: Terminal 3

sa.engine -ew1


::: Terminal 4 / Interactive window

sa.engine -c

reregister("laptop");

other_peers();

models:deploy(["w1"], "edge-weights-publisher");

subscribe("weights@central-server");

