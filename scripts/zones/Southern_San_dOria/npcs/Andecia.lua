-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Andecia
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
	Tomb = player:getQuestStatus(0,11);
	if (player:getQuestStatus(0,11) == 1) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(547, 1);
		gil = trade:getGil();
		if (carta and count == 1 and gil == 0) then
			player:tradeComplete();
			player:startEvent(0x0270);
			end
			end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	Tomb = player:getQuestStatus(0,11);
	if (Tomb == 0) then
	player:startEvent(0x021c);
	elseif (Tomb == 1 and player:hasItem(567) == false and player:hasItem(547) == false) then
	player:startEvent(0x021d);
	elseif (Tomb == 1 and player:hasItem(567) == true) then
	player:startEvent(0x026f);
	elseif (Tomb == 1 and player:hasItem(547) == true) then
	player:startEvent(0x026f);
	elseif (Tomb == 2) then
	player:startEvent(0x022e);
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
if (csid == 0x021c and option == 0) then
player:addQuest(0,11);
elseif (csid == 0x021d) then
player:addQuest(0,11);
player:addItem(567);
player:messageSpecial(6403,567);
elseif (csid == 0x0270) then
player:completeQuest(0,11);
player:addFame(SANDORIA,SAN_FAME*30);
player:setTitle(57);
player:addGil(GIL_RATE*560);
player:messageSpecial(6404,GIL_RATE*560)
player:delItem(547, 1);
end
end;
