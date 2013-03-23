-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Serjeant Tombstone
-- Map1 Position: http://www.dynamislounge.com/html/zone/frame_san1.htm
-- Map2 Position: http://www.dynamislounge.com/html/zone/frame_san2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

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
	local spawnList = sandyList;
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mobID == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				local mobNBR = spawnList[nb + 1][nbi];
				
				if(mobNBR <= 20) then
					if(mobNBR == 0) then mobNBR = math.random(1,15);  end -- Spawn random Vanguard (TEMPORARY)
					local DynaMob = getDynaMob(target,mobNBR,1);
					
					--printf("Serjeant Tombstone => mob %u \n",DynaMob);
					
					if(DynaMob ~= nil) then
						-- Spawn Mob
						SpawnMob(DynaMob):updateEnmity(target);
						GetMobByID(DynaMob):setPos(X,Y,Z);
						-- Spawn Pet for BST, DRG, and SMN
						if(mobNBR == 9 or mobNBR == 14 or mobNBR == 15) then
							SpawnMob(DynaMob + 1):updateEnmity(target);
							GetMobByID(DynaMob + 1):setPos(X,Y,Z);
						end
					end
				elseif(mobNBR > 20) then
					SpawnMob(mobNBR):updateEnmity(target);
					
					local MJob = GetMobByID(mobNBR):getMainJob();
					if(MJob == 9 or MJob == 14 or MJob == 15) then
						-- Spawn Pet for BST, DRG, and SMN
						SpawnMob(mobNBR + 1):updateEnmity(target);
						GetMobByID(mobNBR + 1):setPos(X,Y,Z);
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
	
	mobID = mob:getID();
	-- Time Bonus (10min): 074
	if(mobID == 17535319 and alreadyReceived(killer,1) == false) then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,1);
	-- Time Bonus (15min): 007
	elseif(mobID == 17535256 and alreadyReceived(killer,2) == false) then
		killer:addTimeToDynamis(15);
		addDynamisList(killer,2);
	-- Time Bonus (15min): 009
	elseif(mobID == 17535258 and alreadyReceived(killer,3) == false) then
		killer:addTimeToDynamis(15);
		addDynamisList(killer,4);
	-- Time Bonus (25min): 026
	elseif(mobID == 17535273 and alreadyReceived(killer,4) == false) then
		killer:addTimeToDynamis(25);
		addDynamisList(killer,8);
	-- Time Bonus (25min): 064
	elseif(mobID == 17535309 and alreadyReceived(killer,5) == false) then
		killer:addTimeToDynamis(25);
		addDynamisList(killer,16);
	-- Time Bonus (30min): 041
	elseif(mobID == 17535287 and alreadyReceived(killer,6) == false) then
		killer:addTimeToDynamis(30);
		addDynamisList(killer,32);
	-- HP Bonus: 012 015 034 044 052 059 072 073 078 081 083 091 097 103 104 107 | 
	elseif(mobID == 17535261 or mobID == 17535264 or mobID == 17535281 or mobID == 17535290 or mobID == 17535298 or mobID == 17535305 or mobID == 17535317 or mobID == 17535318 or
		   mobID == 17535323 or mobID == 17535326 or mobID == 17535328 or mobID == 17535336 or mobID == 17535340 or mobID == 17535344 or mobID == 17535345 or mobID == 17535348) then 
		killer:restoreHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 006 010 014 032 035 038 047 060 062 070 076 079 084 086 092 108 | 
	elseif(mobID == 17535255 or mobID == 17535259 or mobID == 17535263 or mobID == 17535279 or mobID == 17535282 or mobID == 17535284 or mobID == 17535293 or mobID == 17535306 or 
		   mobID == 17535307 or mobID == 17535315 or mobID == 17535321 or mobID == 17535324 or mobID == 17535329 or mobID == 17535331 or mobID == 17535337 or mobID == 17535349) then 
		killer:restoreMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	-- Special
	elseif(mobID == 17535352) then
		SpawnMob(17535353); -- 112 spawn 113 when defeated
	elseif(mobID == 17535354) then
		SpawnMob(17535355); -- 114 spawn 115 when defeated
	end
	
end;