-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Stalagmite
-- Involved In Quest: Sharpening the Sword
-- @pos -51 0.1 3 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
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

	if (player:getVar("sharpeningTheSwordCS") == 3) then
		local NMDespawned = GetMobAction(17568134) == 0;
		local spawnTime = player:getVar("Polevik_Spawned");
		local canSpawn = (os.time() - spawnTime) > 30;
		local PolevikKilled = player:getVar("PolevikKilled");
		
		if (PolevikKilled == 1) then
			if ((os.time() - player:getVar("Polevik_Timer") < 30) or (NMDespawned and (os.time() - spawnTime) < 30)) then
				player:addKeyItem(ORDELLE_WHETSTONE);
				player:messageSpecial(KEYITEM_OBTAINED,ORDELLE_WHETSTONE);
				player:setVar("PolevikKilled",0);
				player:setVar("Polevik_Spawned",0);
				player:setVar("Polevik_Timer",0);
				player:setVar("sharpeningTheSwordCS",4)
			elseif (NMDespawned) then
				SpawnMob(17568134,168):updateClaim(player); -- Despawn after 3 minutes (-12 seconds for despawn delay).
				player:setVar("PolevikKilled",0);
				player:setVar("Polevik_Spawned",os.time()+180);
			else
				player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
			end
		elseif (canSpawn) then
			SpawnMob(17568134,168):updateClaim(player); -- Despawn after 3 minutes (-12 seconds for despawn delay).
			player:setVar("Polevik_Spawned",os.time()+180);
		else
			player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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