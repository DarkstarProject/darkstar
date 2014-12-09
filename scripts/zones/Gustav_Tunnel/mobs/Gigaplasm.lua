----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: gigaplasm
-----------------------------------	
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Gustav_Tunnel/TextIDs");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)
local X = GetMobByID(17645794):getXPos();
local Y = GetMobByID(17645794):getYPos();
local Z = GetMobByID(17645794):getZPos();
SpawnMob(17645795):setPos(X,Y,Z);
SpawnMob(17645796):setPos(X-1,Y,Z-1);
GetMobByID(17645795):updateEnmity(killer);
GetMobByID(17645796):updateEnmity(killer);
end;	