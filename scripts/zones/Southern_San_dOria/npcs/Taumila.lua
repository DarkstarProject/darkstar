-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Taumila
-- Quest NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
Diente = player:getQuestStatus(0,23);
if (Diente == 1 or Diente == 2) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(884, 3);
		gil = trade:getGil();
		if (carta and count == 3 and gil == 0) then
			player:startEvent(0x023c);
			end
			end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
sanFame = player:getFameLevel(SANDORIA);
Diente = player:getQuestStatus(0,23);
if (sanFame <= 2) then
	player:startEvent(0x023b);
	elseif(sanFame >= 3 and  Diente == 0) then
	player:startEvent(0x023e);
	elseif (Diente == 1) then
	player:startEvent(0x023f);
	elseif (Diente == 2) then
	player:startEvent(0x023d);
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
Diente = player:getQuestStatus(0,23);
if (csid == 0x023e and option == 0) then
player:addQuest(0,23);
elseif (csid == 0x023c) then
if (Diente == 1) then
player:completeQuest(0,23);
player:addFame(SANDORIA,SAN_FAME*30);
player:tradeComplete();
player:setTitle(61);
player:addGil(GIL_RATE*2100);
player:messageSpecial(6404,GIL_RATE*2100)
elseif (csid == 0x023c) then
if (Diente == 2) then
player:addFame(SANDORIA,SAN_FAME*5);
player:tradeComplete();
player:setTitle(61);
player:addGil(GIL_RATE*2100);
player:messageSpecial(6404,GIL_RATE*2100)
end
end
end
end;