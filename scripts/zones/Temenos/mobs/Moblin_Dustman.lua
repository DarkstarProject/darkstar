-----------------------------------
-- Area: Temenos N T
--  NPC: Moblin_Dustman

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobDeath(mob, player, isKiller)
 local mobID = mob:getID();
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

 if (mobID ==16928775) then
       GetNPCByID(16928768+152):setPos(328,70,464);
    GetNPCByID(16928768+152):setStatus(dsp.status.NORMAL);
  elseif (mobID ==16928777) then
      GetNPCByID(16928768+209):setPos(332,70,470);
    GetNPCByID(16928768+209):setStatus(dsp.status.NORMAL);
 end
end;