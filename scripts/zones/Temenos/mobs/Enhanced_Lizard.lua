-----------------------------------
-- Area: Temenos W T
--  NPC: Enhanced_Lizard

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)

end;

function onMobDeath(mob, player, isKiller)
local cofferID=Randomcoffer(4,GetInstanceRegion(1298));
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
   GetNPCByID(16929238):setStatus(dsp.status.NORMAL);
  if (cofferID~=0) then
       GetNPCByID(16928768+cofferID):setPos(mobX,mobY,mobZ);
    GetNPCByID(16928768+cofferID):setStatus(dsp.status.NORMAL);
  end
end;
