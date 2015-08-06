-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Vanguard_Eye
-- Map Position: http://images.wikia.com/ffxi/images/c/cc/Xar.jpg
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

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
	local spawnList = xarcabardList;
	
	if (mob:isInBattlefieldList() == false) then -- No repop if the eye is in the list
		mob:addInBattlefieldList();
		if (mob:getStatPoppedMobs() == false) then
			mob:setStatPoppedMobs(true);
			for nb = 1, table.getn(spawnList), 2 do
				if (mob:getID() == spawnList[nb]) then
					for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
						if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
						local mobNBR = spawnList[nb + 1][nbi];
						
						if (mobNBR <= 20) then
							local DynaMob = getDynaMob(target,mobNBR,1);
							
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
						elseif (mobNBR > 20) then
							SpawnMob(mobNBR):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
							GetMobByID(mobNBR):setPos(X,Y,Z);
							GetMobByID(mobNBR):setSpawn(X,Y,Z);
							
							local MJob = GetMobByID(mobNBR):getMainJob();
							if (MJob == 9 or MJob == 15) then
								-- Spawn Pet for BST, DRG, and SMN
								SpawnMob(mobNBR+1):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								GetMobByID(mobNBR+1):setPos(X,Y,Z);
								GetMobByID(mobNBR+1):setSpawn(X,Y,Z);
							end
						end
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
	
	-- 035 039: spawn 043 when defeated
	if (mobID == 17326536) then
		SpawnMob(17326553);
	-- 058: spawn 60 when defeated
	elseif (mobID == 17326661 and GetMobAction(17326668) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326668 and GetMobAction(17326661) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326673 and GetMobAction(17326661) == 0 and GetMobAction(17326668) == 0) then
		SpawnMob(17326706);
	-- 114: spawn 112 when defeated
	elseif (mobID == 17326790) then
		SpawnMob(17326086);
	-- 144-149: spawn 150 when defeated
	elseif (mobID >= 17330913 and mobID <= 17330918) then
		SetServerVariable("[DynaXarcabard]TE150_Trigger",GetServerVariable("[DynaXarcabard]TE150_Trigger") + (mobID - 17330912) ^ 2);
	end
	
	if (GetServerVariable("[DynaXarcabard]TE150_Trigger") == 63) then
		SpawnMob(17330919); -- 150
	end
	
end;