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
	
	if(mob:getStatPoppedMobs() == false) then
		mob:setStatPoppedMobs(true);
		for nb = 1, table.getn(spawnList), 2 do
			if(mob:getID() == spawnList[nb]) then
				local firstHydra = spawnList[nb] - 1;
				local lastHydra = spawnList[nb] - spawnList[nb + 1][1];
				
				for nbi = firstHydra, lastHydra, -1 do
					if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
					
					if(GetMobAction(nbi) == 0) then
						-- Spawn Mob
						SpawnMob(nbi):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
						GetMobByID(nbi):setPos(X,Y,Z);
						GetMobByID(nbi):setSpawn(X,Y,Z);
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
	if(mobID == 17326553 and alreadyReceived(killer,9) == false) then
		killer:addTimeToDynamis(15);
		addDynamisList(killer,256);
	elseif(mobID == 17326706 and alreadyReceived(killer,10) == false) then
		killer:addTimeToDynamis(15);
		addDynamisList(killer,512);
	-- 117 spawn 120 when defeated
	elseif(mobID == 17326536) then
		SpawnMob(17326553);
	-- 138 139 140: Spawn 147 when defeated
	elseif(mobID == 17326661 and GetMobAction(17326668) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326668 and GetMobAction(17326661) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326673 and GetMobAction(17326661) == 0 and GetMobAction(17326668) == 0) then
		SpawnMob(17326706);
	-- 157 spawn 158-162 when defeated
	elseif(mobID == 17326790) then
		SpawnMob(17326086);
		SpawnMob(17326087);
		SpawnMob(17326088);
		SpawnMob(17326089);
		SpawnMob(17326090);
	end
	
end;