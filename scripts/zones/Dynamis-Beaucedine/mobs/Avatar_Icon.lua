-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Avatar Icon
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Beaucedine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
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
	local spawnList = beaucedineYagudoList;
	
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
	
	local mobID = mob:getID();
	-- Time Bonus: 010 020
	if (mobID == 17326839 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	elseif (mobID == 17326849 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	-- HP Bonus: 005 013 018 023 028 030
	elseif (mobID == 17326834 or mobID == 17326842 or mobID == 17326847 or mobID == 17326852 or mobID == 17326857 or mobID == 17326859) then 
		killer:restoreHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 012 019 022 025 027 106
	elseif (mobID == 17326841 or mobID == 17326848 or mobID == 17326851 or mobID == 17326854 or mobID == 17326856 or mobID == 17326935) then 
		killer:restoreMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	
end;