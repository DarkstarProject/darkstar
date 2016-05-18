-----------------------------------
-- Area: North Gustaberg
--  MOB: Stone Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,16,1);
end;
