-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Maloquedil
-- Involved in Quest : Warding Vampires, Riding on the Clouds
-- @zone 231
-- @pos 35 0 60
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if(player:getQuestStatus(SANDORIA,MIRROR_MIRROR) == QUEST_COMPLETED or player:getVar("QuestVampireVar") == 1) then
		if(trade:hasItemQty(1018,2) and trade:getItemCount() == 2) then -- Trade Shaman Garlic
			player:startEvent(0x0017);
		end
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 4) then
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
	
	mirrorMirror = player:getQuestStatus(SANDORIA,MIRROR_MIRROR);
	
	if(mirrorMirror == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
		player:startEvent(0x0018);
	elseif(player:getVar("QuestVampireVar") == 1) then
		player:startEvent(0x0016);
	elseif(mirrorMirror == QUEST_COMPLETED) then
		player:startEvent(0x0016);
	else
		player:startEvent(0x0015);
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

	if(csid == 0x0018 and option == 1) then
		player:addQuest(SANDORIA,MIRROR_MIRROR);
		player:setVar("QuestVampireVar",1);
	elseif(csid == 0x0017) then
		if(player:getVar("QuestVampireVar") == 1) then
			player:tradeComplete();
			player:setTitle(43);
			player:addGil(GIL_RATE*900);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
			player:setVar("QuestVampireVar",0);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,MIRROR_MIRROR);
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*900);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
			player:addFame(SANDORIA,SAN_FAME*5);
		end
	end
	
end;