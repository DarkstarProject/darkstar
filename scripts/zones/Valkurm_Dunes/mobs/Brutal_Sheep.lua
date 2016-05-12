-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Brutal Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,10,1);
end;
