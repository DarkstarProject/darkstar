-----------------------------------
-- Area: Temenos N T    
-- NPC: Goblin_Theurgist

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(16928831):updateEnmity(target);
    GetMobByID(16928832):updateEnmity(target);
    GetMobByID(16928834):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (
        GetMobByID(16928831):isDead() and
        GetMobByID(16928832):isDead() and
        GetMobByID(16928833):isDead() and
        GetMobByID(16928834):isDead() and
        GetMobByID(16928835):isDead()
    ) then
        GetNPCByID(16928768+39):setPos(-599,85,438);
        GetNPCByID(16928768+39):setStatus(STATUS_NORMAL);
        GetNPCByID(16928768+456):setStatus(STATUS_NORMAL);
    end
end;