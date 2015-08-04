-----------------------------------
-- Area: Dynamis tavnazia
-- NPC:  Vanguard_Eye

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
	
	local mobID = mob:getID();
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
	local spawnList = TavnaziaEyesList;
	local list=2;
	-- printf("mobID: %u",mobID);
	
	if ( mobID > 16949486 ) then 
	    list=1;
	end
	
	if (mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
		for nb = 1, table.getn(spawnList), 2 do
			if (mob:getID() == spawnList[nb]) then			
				for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
					if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
					local mobNBR = spawnList[nb + 1][nbi];
					--	printf("mobNBR: %u",mobNBR);
						
					if (mobNBR <= 20) then
						local DynaMob = getDynaMob(target,mobNBR,list);
						
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
			
		local TaurusNBR = 0;	
		local NBRtaurusadd = 0;	
		
		if (list == 2) then
			for nt = 1, table.getn(TavnaziaTautusList), 2 do		      
				if (mob:getID() == TavnaziaTautusList[nt] and TavnaziaTautusList[nt+1][1] ~= 0) then
					for nf = 1 ,TavnaziaTautusList[nt+1][1] , 1 do
						for TauruslistID = 16949307 , 16949316 , 1 do
							if (GetMobAction(TauruslistID ) == 0 ) then
								SpawnMob(TauruslistID):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								GetMobByID(TauruslistID):setPos(X,Y,Z);
								GetMobByID(TauruslistID):setSpawn(X,Y,Z);	
								break;										  
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
end;