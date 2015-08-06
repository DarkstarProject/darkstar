-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	-- this is my super id and all my children will have the same number
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
	local spawnList = bastyList;
	
	if (mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
		for nb = 1, table.getn(spawnList), 2 do
			if (mobID == spawnList[nb]) then
				for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
					if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
					local mobNBR = spawnList[nb + 1][nbi];
	
					if (mobNBR <= 20) then
						if (mobNBR == 0) then mobNBR = math.random(1,15);  end -- Spawn random Vanguard (TEMPORARY)
						local DynaMob = getDynaMob(target,mobNBR,1);
	
						--printf("Adamantking Effigy => mob %u \n",DynaMob);
	
						if (DynaMob ~= nil) then
							-- Spawn Mob
							SpawnMob(DynaMob):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
							printf("super link? %d", GetMobByID(DynaMob):getMobMod(MOBMOD_SUPERLINK));
							GetMobByID(DynaMob):setPos(X,Y,Z);
							GetMobByID(DynaMob):setSpawn(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if (mobNBR == 9 or mobNBR == 15) then
								SpawnMob(DynaMob + 1):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								GetMobByID(DynaMob + 1):setPos(X,Y,Z);
								GetMobByID(DynaMob + 1):setSpawn(X,Y,Z);
							end
						end
					elseif (mobNBR > 20) then
						SpawnMob(mobNBR):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
	
						local MJob = GetMobByID(mobNBR):getMainJob();
						if (MJob == 9 or MJob == 15) then
							-- Spawn Pet for BST, DRG, and SMN
							SpawnMob(mobNBR + 1):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
							GetMobByID(mobNBR + 1):setPos(X,Y,Z);
							GetMobByID(mobNBR + 1):setSpawn(X,Y,Z);
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
	-- Time Bonus: 001 019 041
	if (mobID == 17539350 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(20);
		mob:addInBattlefieldList(); 
	elseif (mobID == 17539368 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(20);
		mob:addInBattlefieldList();
	elseif (mobID == 17539386 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(20);
		mob:addInBattlefieldList();
	-- HP Bonus: 007 008 025 042 082 085 092
	elseif (mobID == 17539356 or mobID == 17539357 or mobID == 17539374 or mobID == 17539387 or
		   mobID == 17539426 or mobID == 17539429 or mobID == 17539171) then
		killer:restoreHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 026 031 038 081 104
	elseif (mobID == 17539118 or mobID == 17539161 or mobID == 17539383 or
		   mobID == 17539425 or mobID == 17539446) then
		killer:restoreMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end

end;