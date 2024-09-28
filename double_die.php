<?php

$times = 0;
$timeNow = microtime(true);

while (true) {
    $die1 = random_int(1, 6);
    $die2 = random_int(1, 6);
    $times++;

    if ($die1 === $die2 && $die1 === 6) {
        $duration = microtime(true) - $timeNow;
        echo "Done ! Times:$times   Duration:$duration ms";
        break;
    }
}