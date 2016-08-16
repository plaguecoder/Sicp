#lang scheme

(centera *(1 - (0.5*ta))) , (centera *(1 + (0.5*ta)))

(centerb *(1 - (0.5*tb))) , (centerb *(1 + (0.5*tb)))

when we multiply these intervals we get

centera * centerb * (1 - 0.5 *(ta+tb) + (0.25 * ta * tb))   ; assuming all numbes are positive
centera * centerb * (1 + 0.5 *(ta+tb) + (0.25 * ta * tb))

(0.25 * ta * tb) is a very small number so it can be ignored

therefore effective tolerance results to be approximately equal to sum of component tolerances.