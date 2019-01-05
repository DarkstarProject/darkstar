-----------------------------------
-- Area: Apollyon NE
-- NPC:  Troglodyte Dhalmel

-----------------------------------
require("scripts/globals/limbus");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

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
 
 
  if (IsMobDead(16933115)==true and
     IsMobDead(16933116)==true and
     IsMobDead(16933117)==true and
     IsMobDead(16933118)==true and
     IsMobDead(16933119)==true and
     IsMobDead(16933120)==true and
     IsMobDead(16933121)==true and
     IsMobDead(16933122)==true
    ) then
     -- item
       GetNPCByID(16932864+178):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+178):setStatus(dsp.status.NORMAL);
   end
end;