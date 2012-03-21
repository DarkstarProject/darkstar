-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Sobane
-- Starts and Finishes Quest: Signed in Blood
-- Involved in quest: Sharpening the Sword, Riding on the Clouds
-- @zone 230
-- @pos -190 -3 97
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 2) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_1",0);
			player:addKeyItem(SCOWLING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
		end
	end
	
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	
	if(player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD) == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
		player:startEvent(0x02dc,0,1662); -- Start Quest
	elseif(player:getVar("sharpeningTheSwordCS") >= 2) then
		player:startEvent(0x0034);
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
	
	if(csid == 0x02dc and option == 1) then
		player:addQuest(SANDORIA,SIGNED_IN_BLOOD);
	elseif(csid == 0x0034) then
		player:setVar("sharpeningTheSwordCS",3);
	end
	
end;