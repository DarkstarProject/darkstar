-----------------------------------
-- Area: Temenos W T
--  NPC: Enhanced_Slime

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)

end;

function onMobDeath(mob, player, isKiller)
local cofferID=Randomcoffer(5,GetInstanceRegion(1298));
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16929239):setStatus(dsp.status.NORMAL);
  if (cofferID~=0) then
       GetNPCByID(16928768+cofferID):setPos(mobX,mobY,mobZ);
    GetNPCByID(16928768+cofferID):setStatus(dsp.status.NORMAL);
  end
end;
