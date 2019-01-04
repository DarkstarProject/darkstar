-----------------------------------
-- Area: Toraimarai Canal
--  NM:  Magic Sludge
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:setVar("rootProblem",3);
end;