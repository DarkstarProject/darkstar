-----------------------------------
-- Area: Apollyon SE
-- NPC:  Evil_Armory

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
    GetMobByID(16933033):updateEnmity(target);
    GetMobByID(16933034):updateEnmity(target);
    GetMobByID(16933035):updateEnmity(target);
    GetMobByID(16933036):updateEnmity(target);
    GetMobByID(16933037):updateEnmity(target);
    GetMobByID(16933038):updateEnmity(target);
    GetMobByID(16933039):updateEnmity(target);
    GetMobByID(16933040):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
   local mobID = mob:getID();    
  -- print(mobID);
 local mobX = mob:getXPos();
 local mobY = mob:getYPos();
 local mobZ = mob:getZPos();
 
  GetNPCByID(16932864+263):setPos(mobX,mobY,mobZ);
  GetNPCByID(16932864+263):setStatus(STATUS_NORMAL);

end;