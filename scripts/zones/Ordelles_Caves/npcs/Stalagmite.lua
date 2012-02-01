-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Stalagmite
-- Involved In Quest: Sharpening the Sword
-- @zone 193
-- @pos -51 0 3
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyItems");
require("scripts/globals/quests");
require("scripts/zones/Ordelles_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getVar("sharpeningTheSwordCS") == 3) then
		NMDespawned = GetMobAction(17568134) == 0;
		spawnTime = player:getVar("Polevik_Spawned");
		canSpawn = (os.time() - spawnTime) > 30;
		PolevikKilled = player:getVar("PolevikKilled");
		
		if(PolevikKilled == 1) then
			if((os.time() - player:getVar("Polevik_Timer") < 30) or (NMDespawned and (os.time() - spawnTime) < 30)) then
				player:addKeyItem(ORDELLE_WHETSTONE);
				player:messageSpecial(KEYITEM_OBTAINED,ORDELLE_WHETSTONE);
				player:setVar("PolevikKilled",0);
				player:setVar("Polevik_Spawned",0);
				player:setVar("Polevik_Timer",0);
				player:setVar("sharpeningTheSwordCS",4)
			elseif(NMDespawned) then
				SpawnMob(17568134,168):updateEnmity(player); -- Despawn after 3 minutes (-12 seconds for despawn delay).
				player:setVar("PolevikKilled",0);
				player:setVar("Polevik_Spawned",os.time()+180);
			else
				player:messageSpecial(NOTHING_FOUND);
			end
		elseif(canSpawn) then
			SpawnMob(17568134,168):updateEnmity(player); -- Despawn after 3 minutes (-12 seconds for despawn delay).
			player:setVar("Polevik_Spawned",os.time()+180);
		else
			player:messageSpecial(NOTHING_FOUND);
		end
	else
		player:messageSpecial(NOTHING_FOUND);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;