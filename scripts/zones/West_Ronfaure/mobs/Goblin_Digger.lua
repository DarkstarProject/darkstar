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

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,56,2);
end;
