-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Sand Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,7,2);
end;
