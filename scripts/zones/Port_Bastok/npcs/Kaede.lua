-----------------------------------
-- Area: Port Bastok
-- NPC:  Kaede
-- Start Quest: Ayame and Kaede
-- Involved in Quests: Riding on the Clouds
-- @pos 48 -6 67 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 4) then
		if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_2",0);
			player:tradeComplete();
			player:addKeyItem(SMILING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local ayameKaede = player:getQuestStatus(BASTOK,AYAME_AND_KAEDE);
	local WildcatBastok = player:getVar("WildcatBastok");

	if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,0) == false) then
		player:startEvent(0x0160);
	elseif (ayameKaede == QUEST_AVAILABLE and player:getMainLvl() >= 30) then			
		player:startEvent(0x00f0);
	elseif (ayameKaede == QUEST_ACCEPTED) then
		player:startEvent(0x001a);
	elseif (ayameKaede == QUEST_COMPLETED) then
		player:startEvent(0x00f8);
	else
		player:startEvent(0x001a);
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

	if (csid == 0x00f0) then
		if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_AVAILABLE) then
			player:addQuest(BASTOK,AYAME_AND_KAEDE);
		end
	elseif (csid == 0x0160) then
		player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",0,true);
	end
	
end;