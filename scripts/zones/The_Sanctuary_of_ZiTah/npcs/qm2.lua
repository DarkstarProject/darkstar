-----------------------------------
-- Area: The Sanctuary of ZiTah
-- NPC:  qm2 (???)
-- Involved in Quest: Forge Your Destiny
-- @pos 639 -1 -151 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(1021,1) and trade:getItemCount() == 1 and player:hasItem(1153) == false) then
			if (GetMobAction(17272838) == 0) then
				SpawnMob(17272838,288):updateClaim(player); -- Spawn Guardian Treant
				player:tradeComplete();
			end
		elseif (player:getVar("ForgeYourDestiny_killed") == 1) then
			if (trade:hasItemQty(1198,1) and trade:getItemCount() == 1) then 
				player:tradeComplete();
				player:addItem(1153);
				player:messageSpecial(ITEM_OBTAINED, 1153); -- Sacred Branch
				player:setVar("ForgeYourDestiny_killed",0);
			end
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(STURDY_BRANCH,1021);
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

