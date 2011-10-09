-----------------------------------
-- Area: The Sanctuary of ZiTah
-- NPC: ???
-- Involved in Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	count = trade:getItemCount();
	gil	= trade:getGil();
	
	if (trade:hasItemQty(HATCHET,1) and count == 1 and gil == 0 and player:hasItem(SACRED_BRANCH) == false) then
		if (GetMobAction(GUARDIAN_TREANT) == 0) then
			SpawnMob(GUARDIAN_TREANT, 10);
			player:tradeComplete();
		end
	elseif (player:getVar("ForgeYourDestiny_killed") == 1) then
		if (trade:hasItemQty(SACRED_SPRIG,1) and count == 1 and gil == 0) then 
			player:tradeComplete();
			player:addItem(SACRED_BRANCH);
			player:messageSpecial(ITEM_OBTAINED, SACRED_BRANCH);
			player:setVar("ForgeYourDestiny_killed",0);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(STURDY_BRANCH,HATCHET);
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