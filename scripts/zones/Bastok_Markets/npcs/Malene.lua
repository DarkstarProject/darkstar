-----------------------------------
-- Area: Bastok Markets
-- NPC: Malene
-- Starts & Finishes Quest: The Cold Light of Day
-----------------------------------

require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
  count = trade:getItemCount();
  gil = trade:getGil();
  SteamClock = trade:hasItemQty(STEAM_CLOCK,1);
  
  	if (SteamClock == true and count == 1 and gil == 0) then
  		TheColdLightofDay = player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY);
  		
		if (TheColdLightofDay > 0) then
			player:startEvent(0x68);
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0066);
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

	TheColdLightofDay = player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY);

	if (csid == 0x0066) then
		if (TheColdLightofDay == 0) then
			player:addQuest(BASTOK,THE_COLD_LIGHT_OF_DAY);	
		end
	elseif (csid == 0x68) then
		if (TheColdLightofDay == 1) then 
			player:completeQuest(BASTOK,THE_COLD_LIGHT_OF_DAY);
			player:addFame(BASTOK,BAS_FAME*50);
		else
			player:addFame(BASTOK,BAS_FAME*8);
		end
		player:tradeComplete();
		player:setTitle(CRAB_CRUSHER);			
		player:addGil(GIL_RATE*500);
		player:messageSpecial(GIL_OBTAINED, GIL_RATE*500);		
	end
end;




