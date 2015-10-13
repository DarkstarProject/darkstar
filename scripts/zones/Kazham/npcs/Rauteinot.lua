-----------------------------------
-- Area: Kazham
-- NPC:  Rauteinot
-- Starts and Finishes Quest: Missionary Man
-- @zone 250
-- @pos -42 -10 -89
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getVar("MissionaryManVar") == 1 and trade:hasItemQty(1146,1) == true and trade:getItemCount() == 1) then
		player:startEvent(0x008b); -- Trading elshimo marble
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	MissionaryMan = player:getQuestStatus(OUTLANDS,MISSIONARY_MAN);
	MissionaryManVar = player:getVar("MissionaryManVar");
	
	if (MissionaryMan == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 3) then 
		player:startEvent(0x0089,0,1146); -- Start quest "Missionary Man"
	elseif (MissionaryMan == QUEST_ACCEPTED and MissionaryManVar == 1) then 
		player:startEvent(0x008a,0,1146); -- During quest (before trade marble) "Missionary Man"
	elseif (MissionaryMan == QUEST_ACCEPTED and (MissionaryManVar == 2 or MissionaryManVar == 3)) then 
		player:startEvent(0x008c); -- During quest (after trade marble) "Missionary Man"
	elseif (MissionaryMan == QUEST_ACCEPTED and MissionaryManVar == 4) then 
		player:startEvent(0x008d); -- Finish quest "Missionary Man"
	elseif (MissionaryMan == QUEST_COMPLETED) then 
		player:startEvent(0x008e); -- New standard dialog
	else
		player:startEvent(0x0088); -- Standard dialog
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
	if (csid == 0x0089 and option == 1) then
		player:addQuest(OUTLANDS,MISSIONARY_MAN);
		player:setVar("MissionaryManVar",1);
	elseif (csid == 0x008b) then 
		player:setVar("MissionaryManVar",2);
		player:addKeyItem(RAUTEINOTS_PARCEL);
		player:messageSpecial(KEYITEM_OBTAINED,RAUTEINOTS_PARCEL);
		player:tradeComplete();
	elseif (csid == 0x008d) then 
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4728);
		else 
			player:setVar("MissionaryManVar",0);
			player:delKeyItem(SUBLIME_STATUE_OF_THE_GODDESS);
			player:addItem(4728);
			player:messageSpecial(ITEM_OBTAINED,4728);
			player:addFame(WINDURST,WIN_FAME*30);
			player:completeQuest(OUTLANDS,MISSIONARY_MAN);
		end
	end
end;