-----------------------------------
-- Area: Horlais Peak
-- NPC:  Burning Circle
-- Horlais Peak Burning Circle
-- @pos -509 158 -211 139
-------------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Horlais_Peak/TextIDs");

	--- 0: The Rank 2 Final Mission
	--- 1: Tails of Woe
	--- 2: Dismemberment Brigade
	--- 3: The Secret Weapon (Sandy Mission 7-2)
	--- 4: Hostile Herbivores
	--- 5: Shattering Stars (WAR)
	--- 6: Shattering Stars (BLM)
	--- 7: Shattering Stars (RNG)
	--- 8: Carapace Combatants
	--- 9: Shooting Fish
	--- 10: Dropping like Flies
	--- 11: Horns of War
	--- 12: Under Observation
	--- 13: Eye of the Tiger
	--- 14: Shots in the Dark
	--- 15: Double Dragonian
	--- 16: Today's Horoscope
	--- 17: Contaminated Colosseum

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
		return;
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (EventTriggerBCNM(player,npc)) then
		return;
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

	if (EventUpdateBCNM(player,csid,option)) then
		return;
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if (EventFinishBCNM(player,csid,option)) then
		return;
	end
	
end;