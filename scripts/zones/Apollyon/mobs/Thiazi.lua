-----------------------------------
-- Area: Apollyon NE
--  NPC: Thiazi

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
 local mobID = mob:getID();
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();


    if (mobID ==16933063) then -- item
       GetNPCByID(16932864+126):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+126):setStatus(dsp.status.NORMAL);
 end
end;