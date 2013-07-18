-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Adamantking_Effigy

-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Valkurm/TextIDs");

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
	local spawnList = ValkurmQuadavList;
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mob:getID() == spawnList[nb]) then -- si l'id du mob engager correpond a un ID de la list
		
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end			
				local mobNBR = spawnList[nb + 1][nbi];				
				--printf("Serjeant_Tombstone => mob %u \n",mobNBR);			
				   if(mobNBR ~= nil) then
						-- Spawn Mob
						SpawnMob(mobNBR):updateEnmity(target);
						GetMobByID(mobNBR):setPos(X,Y,Z);
						GetMobByID(mobNBR):setSpawn(X,Y,Z);
						-- Spawn Pet for BST, DRG, and SMN

					   local MJob = GetMobByID(mobNBR):getMainJob();
								--	printf("Serjeant_Tombstone => mob %u \n",mobNBR);	
								--	printf("mobjob %u \n",MJob);
					  if(MJob == 9 or MJob == 14 or MJob == 15) then
						-- Spawn Pet for BST , DRG , and SMN  
						SpawnMob(mobNBR + 1):updateEnmity(target);
						GetMobByID(mobNBR + 1):setPos(X,Y,Z);
						GetMobByID(mobNBR + 1):setSpawn(X,Y,Z);
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
	
	if( mobID == 16937233)then --hp
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	    killer:restoreHP(3000);
	elseif(mobID == 16937239 and alreadyReceived(killer,1) == false)then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,1);
		--print("addtime 10min");
	elseif(mobID == 16937237 and alreadyReceived(killer,5) == false)then
	    killer:addTimeToDynamis(20);
		addDynamisList(killer,16);
		--print("addtime 20min");
	end
end;