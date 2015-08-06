-----------------------------------
-- Area: Dynamis Tavnazia
-- NPC: Nightmare_Makara

-----------------------------------
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Tavnazia/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
	local spawnList = TavnaziaCloneList;
	
	if (mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
		for nb = 1, table.getn(spawnList), 2 do
			if (mob:getID() == spawnList[nb]) then 
			
				for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
					if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end			
					local mobNBR = spawnList[nb + 1][nbi];				
		
					if (mobNBR ~= nil) then
							-- Spawn Mob
							SpawnMob(mobNBR):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
							GetMobByID(mobNBR):setPos(X,Y,Z);
							GetMobByID(mobNBR):setSpawn(X,Y,Z);
	
		
					end
				end
			end
		end	
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
end;