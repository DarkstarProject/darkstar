-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Digger
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/pathfind");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,56,2);
end;
