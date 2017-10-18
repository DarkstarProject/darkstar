-----------------------------------
-- Area: Apollyon NE    
-- NPC:  Troglodyte Dhalmel 

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");

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
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();    
    -- print(mobID);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (
        GetMobByID(16933115):isDead() and 
        GetMobByID(16933116):isDead() and   
        GetMobByID(16933117):isDead() and
        GetMobByID(16933118):isDead() and
        GetMobByID(16933119):isDead() and
        GetMobByID(16933120):isDead() and
        GetMobByID(16933121):isDead() and
        GetMobByID(16933122):isDead() 
    ) then
        GetNPCByID(16932864+178):setPos(mobX,mobY,mobZ);
        GetNPCByID(16932864+178):setStatus(STATUS_NORMAL);
    end
end;