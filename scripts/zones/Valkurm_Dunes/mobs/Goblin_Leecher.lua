-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Leecher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,57,2);
end;
