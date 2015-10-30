----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: macroplasm
-----------------------------------	
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/Gustav_Tunnel/TextIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)
  local X = GetMobByID(17645795):getXPos();
  local Y = GetMobByID(17645795):getYPos();
  local Z = GetMobByID(17645795):getZPos();
  local A = GetMobByID(17645796):getXPos();
  local B = GetMobByID(17645796):getYPos();
  local C = GetMobByID(17645796):getZPos();
if (mob:getID() == 17645795) then
    SpawnMob(17645797):setPos(X,Y,Z);
    SpawnMob(17645798):setPos(X,Y,Z);
    GetMobByID(17645797):updateEnmity(killer);
    GetMobByID(17645798):updateEnmity(killer);
elseif (mob:getID() == 17645796) then
  SpawnMob(17645799):setPos(A,B,C);
  SpawnMob(17645800):setPos(A,B,C);
  GetMobByID(17645799):updateEnmity(killer);
  GetMobByID(17645800):updateEnmity(killer);
end
end;	
