-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Goblin Replica
-- Map1 Position: http://images3.wikia.nocookie.net/__cb20090312005127/ffxi/images/b/bb/Jeu1.jpg
-- Map2 Position: http://images4.wikia.nocookie.net/__cb20090312005155/ffxi/images/3/31/Jeu2.jpg
-- Vanguard Position: http://faranim.livejournal.com/39860.html
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/TextIDs");

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
	local spawnList = jeunoList;
	
	if (mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
		for nb = 1, table.getn(spawnList), 2 do
			if (mob:getID() == spawnList[nb]) then
				for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
					if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
					local mobNBR = spawnList[nb + 1][nbi];
					
					if (mobNBR <= 20) then
						if (mobNBR == 0) then mobNBR = math.random(1,15);  end -- Spawn random Vanguard (TEMPORARY)
						local DynaMob = getDynaMob(target,mobNBR,1);
						
						--printf("Goblin Replica => mob %u \n",DynaMob);
						
						if (DynaMob ~= nil) then
							-- Spawn Mob
							SpawnMob(DynaMob):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
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
	
	mobID = mob:getID();
	
	-- Time Bonus (30min): 002
	if (mobID == 17547531 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(30);
		mob:addInBattlefieldList();
	-- Time Bonus (30min): 004
	elseif (mobID == 17547533 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(30);
		mob:addInBattlefieldList();
	-- Time Bonus (30min): 029
	elseif (mobID == 17547558 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(30);
		mob:addInBattlefieldList();
	-- Time Bonus (30min): 045
	elseif (mobID == 17547574 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(30);
		mob:addInBattlefieldList();
	end

end;