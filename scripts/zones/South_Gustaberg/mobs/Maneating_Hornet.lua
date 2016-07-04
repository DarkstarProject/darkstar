-----------------------------------
-- Area: South Gustaberg
--  MOB: Maneating Hornet
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,76,1);
end;
