-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
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
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mobID == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				
				if(spawnList[nb + 1][nbi] <= 20) then
					mobList = getListDynaMob(target,spawnList[nb + 1][nbi]);
					for nbo = 1, table.getn(mobList), 1 do
						if(GetMobAction(mobList[nbo]) == 0) then
							-- Spawn Mob
							SpawnMob(mobList[nbo]):updateEnmity(target);
							GetMobByID(mobList[nbo]):setPos(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if(spawnList[nb + 1][nbi] == 1 or spawnList[nb + 1][nbi] == 4 or spawnList[nb + 1][nbi] == 13) then
								SpawnMob(mobList[nbo] + 1):updateEnmity(target);
								GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
							end
							break;
						end
					end
				elseif(spawnList[nb + 1][nbi] > 20) then
					-- Special spawn
					SpawnMob(spawnList[nb + 1][nbi]):updateEnmity(target);
					GetMobByID(spawnList[nb + 1][nbi]):setPos(X,Y,Z);
					MJob = GetMobByID(spawnList[nb + 1][nbi]):getMainJob();
					if(MJob == 9 or MJob == 14 or MJob == 15) then
						-- Spawn Pet for BST, DRG, and SMN
						SpawnMob(spawnList[nb + 1][nbi] + 1):updateEnmity(target);
						GetMobByID(spawnList[nb + 1][nbi] + 1):setPos(X,Y,Z);
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
	if(mobID == 17539350 and alreadyReceived(killer,1) == false) then
		killer:addTimeToDynamis(20);
		addDynamisList(killer,1);
	elseif(mobID == 17539368 and alreadyReceived(killer,2) == false) then
		killer:addTimeToDynamis(20);
		addDynamisList(killer,2);
	elseif(mobID == 17539386 and alreadyReceived(killer,3) == false) then
		killer:addTimeToDynamis(20);
		addDynamisList(killer,4);
	-- HP Bonus: 007 008 025 042 082 085 092
	elseif(mobID == 17539356 or mobID == 17539357 or mobID == 17539374 or mobID == 17539387 or 
		   mobID == 17539426 or mobID == 17539429 or mobID == 17539171) then 
		killer:restoreHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 026 031 038 081 104
	elseif(mobID == 17539118 or mobID == 17539161 or mobID == 17539383 or 
		   mobID == 17539425 or mobID == 17539446) then 
		killer:restoreMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	
end;