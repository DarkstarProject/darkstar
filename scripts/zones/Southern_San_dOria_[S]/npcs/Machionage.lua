-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Machionage
-- @zone 80
-- @pos -255 -3 109
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2) then
		local mask = player:getVar("GiftsOfGriffonPlumes");
		if(trade:hasItemQty(2528,1) and trade:getItemCount() == 1 and not player:getMaskBit(mask,0)) then
			player:startEvent(0x01C) -- Gifts of Griffon Trade
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x026B); -- Default Dialogue
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
	if (csid == 0x01C) then
		player:tradeComplete()
		local mask = player:getVar("GiftsOfGriffonPlumes");
		player:setMaskBit(mask,"GiftsOfGriffonPlumes",0,true);
	end
end;