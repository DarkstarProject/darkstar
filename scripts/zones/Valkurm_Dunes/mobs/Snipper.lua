-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Snipper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,8,1);
    checkRegime(player,mob,9,2);
end;
