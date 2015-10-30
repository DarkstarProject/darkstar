-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Rongelouts N Distaud
-- @zone 80
-- @pos 0.067 2 -22
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2) then
		local mask = player:getVar("GiftsOfGriffonPlumes");
		if (trade:hasItemQty(2528,1) and trade:getItemCount() == 1 and not player:getMaskBit(mask,3)) then
			player:startEvent(0x019) -- Gifts of Griffon Trade
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x025C) -- Default Dialogue
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
	if (csid == 0x019) then -- Gifts Of Griffon Trade
		player:tradeComplete();
		local mask = player:getVar("GiftsOfGriffonPlumes");
		player:setMaskBit(mask,"GiftsOfGriffonPlumes",3,true);
	end
end;