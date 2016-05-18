-----------------------------------
-- Area: South Gustaberg
--  MOB: Stone Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,77,1);
end;
