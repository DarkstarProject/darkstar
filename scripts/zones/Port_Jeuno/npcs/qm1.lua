-----------------------------------
-- Area: Port Jeuno
-- NPC: ???
-- Finish Quest: Borghertz's Hands (AF Hands, Many job)
-- @zone 246
-- @pos -51 8 -4
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	OldGauntlets = player:hasKeyItem(OLD_GAUNTLETS);
	ShadowFlames = player:hasKeyItem(SHADOW_FLAMES);
	BorghertzCS = player:getVar("BorghertzCS");
	
	if (OldGauntlets == true and ShadowFlames == false and BorghertzCS == 1) then 
		player:startEvent(0x0014);
	elseif (OldGauntlets == true and ShadowFlames == false and BorghertzCS == 2) then 
		player:startEvent(0x0031);
	elseif (OldGauntlets == true and ShadowFlames == true) then 
		player:startEvent(0x0030);
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
	if (csid == 0x0014 and option == 1) then 
		player:setVar("BorghertzCS",2);
	elseif (csid == 0x0030) then 
		NumQuest = 43 + player:getVar("BorghertzAlreadyActiveWithJob");
		NumHands = 13960 + player:getVar("BorghertzAlreadyActiveWithJob");
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,NumHands);
		else 
			player:addItem(NumHands);
			player:messageSpecial(ITEM_OBTAINED,NumHands);
			player:delKeyItem(OLD_GAUNTLETS);
			player:delKeyItem(SHADOW_FLAMES);
			player:setVar("BorghertzCS",0);
			player:setVar("BorghertzAlreadyActiveWithJob",0);
			player:addFame(JEUNO,30);
			player:completeQuest(JEUNO,NumQuest);
		end
	end
end;