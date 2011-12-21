-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Door: "Neptune's Spire"
-- Starts and Finishes Quest: Beat Around the Bushin
-- @zone 245
-- @pos 35 0 -15
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,BEAT_AROUND_THE_BUSHIN) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1526,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 2) then 
			player:startEvent(0x009c); -- After trade Wyrm Beard
		elseif(trade:hasItemQty(1527,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 3) then 
			player:startEvent(0x009d); -- After trade Behemoth Tongue
		elseif(trade:hasItemQty(1525,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 4) then 
			player:startEvent(0x009e); -- After trade Adamantoise Egg
		elseif(trade:hasItemQty(13202,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 5) then 
			player:startEvent(0x009f); -- After trade Brown Belt, Finish Quest "Beat around the Bushin"
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("BeatAroundTheBushin") == 1) then 
		player:startEvent(0x009b); -- Start Quest "Beat around the Bushin"
	elseif(player:hasKeyItem(TENSHODO_MEMBERS_CARD) == true) then 
		player:startEvent(0x0069); -- Open the door
	else
		player:messageSpecial(DOOR_IS_LOCKED);
		return 1;
	end
end; 

-- 0x2726  0x2741  0x2742  0x2743  0x2753  0x276e  0x0054
-- 0x0009  0x000a  0x0056  0x0069  0x0014  0x009b  0x009c  0x009d  0x009e  0x009f

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
	if(csid == 0x009b) then 
		player:addQuest(JEUNO,BEAT_AROUND_THE_BUSHIN);
		player:setVar("BeatAroundTheBushin",2);
	elseif(csid == 0x009c) then 
		player:setVar("BeatAroundTheBushin",3);
		player:tradeComplete();
	elseif(csid == 0x009d) then 
		player:setVar("BeatAroundTheBushin",4);
		player:tradeComplete();
	elseif(csid == 0x009e) then 
		player:setVar("BeatAroundTheBushin",5);
		player:tradeComplete();
	elseif(csid == 0x009f) then 
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13186);
		else
			player:completeQuest(JEUNO,BEAT_AROUND_THE_BUSHIN);
			player:setTitle(BLACK_BELT);
			player:addItem(13186);
			player:messageSpecial(ITEM_OBTAINED,13186);
			player:setVar("BeatAroundTheBushin",0);
			player:addFame(3,NORG_FAME*125);
			player:tradeComplete();
		end
	end
end;



