-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Hill Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,7,1);
    checkRegime(player,mob,8,2);
end;
