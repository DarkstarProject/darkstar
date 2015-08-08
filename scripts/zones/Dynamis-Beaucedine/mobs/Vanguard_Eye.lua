-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Vznguard_Eye
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Beaucedine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Beaucedine/TextIDs");

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
	local spawnList = beaucedineHydraList;
	if (mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
        for nb = 1, table.getn(spawnList), 2 do
				if (mob:getID() == spawnList[nb]) then
					for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
						if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
						local mobNBR = spawnList[nb + 1][nbi];
						
						if (mobNBR <= 20) then
							local DynaMob = getDynaMob(target,mobNBR,5);
							if (DynaMob ~= nil) then
								-- Spawn Mob
								SpawnMob(DynaMob):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								GetMobByID(DynaMob):setPos(X,Y,Z);
								GetMobByID(DynaMob):setSpawn(X,Y,Z);
								-- Spawn Pet for BST, DRG, and SMN
								if (mobNBR == 9 or mobNBR == 14 or mobNBR == 15) then
									SpawnMob(DynaMob+1):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
									GetMobByID(DynaMob+1):setPos(X,Y,Z);
									GetMobByID(DynaMob+1):setSpawn(X,Y,Z);
								end
							end
						elseif (mobNBR > 20) then --spawn blm's as eye's are in the hydra's id range
                            GetMobByID(mobNBR):setSpawn(X,Y,Z);
							SpawnMob(mobNBR):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
							GetMobByID(mobNBR):setPos(X,Y,Z);
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
	local mobID = mob:getID();
	
	-- Time Bonus: 120 147
	if (mobID == 17326553 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	elseif (mobID == 17326706 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	-- 117 spawn 148 when defeated
	elseif (mobID == 17326721) then
		SpawnMob(17326553);
	-- 138 139 140: Spawn 147 when defeated
	elseif (mobID == 17326661 and GetMobAction(17326668) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326668 and GetMobAction(17326661) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326673 and GetMobAction(17326661) == 0 and GetMobAction(17326668) == 0) then
		SpawnMob(17326706);
	-- 157 spawn 158-162 when defeated
	elseif (mobID == 17326790) then
		SpawnMob(17326086);
		SpawnMob(17326087);
		SpawnMob(17326088);
		SpawnMob(17326089);
		SpawnMob(17326090);
	end
	
end;