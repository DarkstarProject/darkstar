-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Goblin Replica
-- Map1 Position: http://images3.wikia.nocookie.net/__cb20090312005127/ffxi/images/b/bb/Jeu1.jpg
-- Map2 Position: http://images4.wikia.nocookie.net/__cb20090312005155/ffxi/images/3/31/Jeu2.jpg
-- Vanguard Position: http://faranim.livejournal.com/39860.html
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
	local spawnList = jeunoList;
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mob:getID() == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				local mobNBR = spawnList[nb + 1][nbi];
				
				if(mobNBR <= 20) then -- Spawn normal Mob
					if(mobNBR == 0) then mobNBR = math.random(1,15);  end -- Spawn random Vanguard (TEMPORARY)
					local mobList = getListDynaMob(target,mobNBR);
					
					for nbo = 1, table.getn(mobList), 1 do
						if(GetMobAction(mobList[nbo]) == 0) then
							-- Spawn Mob
							SpawnMob(mobList[nbo]):updateEnmity(target);
							GetMobByID(mobList[nbo]):setPos(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if(mobNBR == 9 or mobNBR == 14 or mobNBR == 15) then
								SpawnMob(mobList[nbo] + 1):updateEnmity(target);
								GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
							end
							break;
						end
					end
				elseif(mobNBR > 20) then -- Spawn NM
					SpawnMob(mobNBR);
					MJob = GetMobByID(mobNBR):getMainJob();
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
	
	-- Time Bonus (30min): 002
	if(mobID == 17547531) then
		killer:addTimeToDynamis(30);
	-- Time Bonus (30min): 004
	elseif(mobID == 17547533) then
		killer:addTimeToDynamis(30);
	-- Time Bonus (30min): 029
	elseif(mobID == 17547558) then
		killer:addTimeToDynamis(30);
	-- Time Bonus (30min): 045
	elseif(mobID == 17547574) then
		killer:addTimeToDynamis(30);
	end
	
end;