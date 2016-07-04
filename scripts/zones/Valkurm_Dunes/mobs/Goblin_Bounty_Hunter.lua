-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Bounty Hunter
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,57,2);
end;
