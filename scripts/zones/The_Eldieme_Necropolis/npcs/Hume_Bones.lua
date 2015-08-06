-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Hume Bones
-- Involved in Quests: Blue Ribbon Blues
-- @pos 299 0.1 19 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED and player:getVar("BlueRibbonBluesProg") >= 3) then
		if (trade:hasItemQty(13569,1) and trade:getItemCount() == 1) then

			if (player:getVar("Lich_C_Magnus_Died") == 0) then
				if (GetMobAction(17575937) == 0) then
					player:tradeComplete();
					SpawnMob(17575937):updateClaim(player); -- Lich C Magnus NM
					player:messageSpecial(RETURN_RIBBON_TO_HER);
				end
			end
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getVar("Lich_C_Magnus_Died") == 1 and player:hasItem(12521) == false) then
		if (player:getFreeSlotsCount() >= 1) then
			player:addItem(12521);
			player:messageSpecial(ITEM_OBTAINED,12521);
			player:setVar("Lich_C_Magnus_Died",0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12521);
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
end;
-- 
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