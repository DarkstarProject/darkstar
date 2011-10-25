-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Antreneau
-- Quest NPC
-----------------------------------
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	conejo = player:getQuestStatus(0,100);
	
	if (conejo == 0) then
	player:startEvent(0x020f);

	elseif (conejo == 2 and player:hasItem(4371) == false) then
	player:startEvent(0x0212);
elseif (player:hasItem(4371)) then
player:startEvent(0x020d);
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
if (csid == 0x0212) then
if (player:getQuestStatus(0,100) == 2 and player:getFreeSlotsCount() >= 1) then
                        player:completeQuest(0,100);
						player:addItem(4371,1);
                        player:messageSpecial(6403,4371);
						player:setTitle(RABBITER);
						else
						  player:messageSpecial(6402, 4371);
		
	end
	end
end;