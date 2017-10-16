-----------------------------------
-- Area: Temenos N T    
-- NPC:  Praetorian_Guard

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

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (
        GetMobByID(16928809):isDead() and
        GetMobByID(16928810):isDead() and
        GetMobByID(16928811):isDead() and
        GetMobByID(16928812):isDead()
    ) then
        GetNPCByID(16928768+28):setPos(-311,80,419);
        GetNPCByID(16928768+28):setStatus(STATUS_NORMAL);
        GetNPCByID(16928768+162):setPos(-311,80,417);
        GetNPCByID(16928768+162):setStatus(STATUS_NORMAL);
        GetNPCByID(16928768+213):setPos(-311,80,421);
        GetNPCByID(16928768+213):setStatus(STATUS_NORMAL);
        GetNPCByID(16928770+454):setStatus(STATUS_NORMAL);
    end
end;
