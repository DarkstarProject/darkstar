-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Fochacha
--  Type: Standard NPC
--  @pos 2.897 -1 -10.781 50
--  Quest: Delivering the Goods
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local vanishingact = player:getQuestStatus(AHT_URHGAN,VANISHING_ACT);
	local deliveryGoodsProg = player:getVar("deliveringTheGoodsCS"); 
	local vanishActProg = player:getVar("vanishingactCS");
	if (player:getQuestStatus(AHT_URHGAN,DELIVERING_THE_GOODS) == QUEST_AVAILABLE) then
		player:startEvent(0x0027);
    elseif (deliveryGoodsProg == 1) then
	    player:startEvent(0x002e);
	elseif (deliveryGoodsProg == 2) then
	    player:startEvent(0x0029);
    elseif (vanishingact == QUEST_ACCEPTED and vanishActProg == 2) then
	    player:startEvent(0x002b);
	elseif (vanishActProg == 3) then
	    player:startEvent(0x0030);
	elseif (vanishActProg == 4) then
	    player:startEvent(0x0031);
	elseif (vanishingact == QUEST_COMPLETED) then
	    player:startEvent(0x003b);
	else
	    player:startEvent(0x002f);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if (csid == 0x0027) then
		player:addQuest(AHT_URHGAN,DELIVERING_THE_GOODS);
		player:setVar("deliveringTheGoodsCS",1);
	elseif (csid == 0x0029) then
	    if (player:getFreeSlotsCount() == 0) then
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINEDX,2184,3);
	    else
		   player:setVar("deliveringTheGoodsCS",0);
	       player:addItem(2184,3);
		   player:messageSpecial(ITEM_OBTAINEDX,2184,3);
		   player:completeQuest(AHT_URHGAN,DELIVERING_THE_GOODS);
		   player:setVar("VANISHING_ACT_waitJPMidnight",getMidnight());
		end
	elseif (csid == 0x002b) then
	       player:setVar("vanishingactCS",3);
	end
end;

