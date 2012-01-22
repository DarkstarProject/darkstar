-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Pagisalis
-- Quest NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

OldPocketWatch = 197;
      OldBoots = 198;
   VelvetCloth = 828;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
Abeja = player:getQuestStatus(0,26);
if (Abeja == 1) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(913, 2);
		gil = trade:getGil();
		if (carta and count == 2 and gil == 0) then
			player:startEvent(0x0233);
			end
			end;
			
	if (player:hasKeyItem(197) == true) and (player:hasKeyItem(198) == false) then 
	if (trade:hasItemQty(828,1)) and (trade:getItemCount() == 1) then
		player:startEvent(0x25);
		player:delKeyItem(197);
			end
			end;
			end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
sanFame = player:getFameLevel(SANDORIA);
Abeja = player:getQuestStatus(0,26);
if (sanFame >= 2 and Abeja == 0 and player:hasKeyItem(198) == false and player:hasKeyItem(197) == false) then
	player:startEvent(0x0232);
	elseif (Abeja == 1) then
	player:startEvent(0x0235);
	elseif (Abeja == 2 and player:hasKeyItem(198) == false and player:hasKeyItem(197) == false) then
	player:startEvent(0x0236);
	elseif (player:hasKeyItem(198) == true) then
  player:startEvent(0x3A);
elseif (player:hasKeyItem(197) == true) then
  player:startEvent(0x30);
	else
  player:startEvent(0x234)
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
if (csid == 0x0232 and option == 0) then
player:addQuest(0,26);
elseif (csid == 0x0233) then
player:completeQuest(0,26);
player:addFame(SANDORIA,SAN_FAME*30);
player:tradeComplete();
player:setTitle(62);
player:addItem(13211);
player:messageSpecial(6567,13211);
elseif (csid == 0x25) then
	player:addKeyItem(198);
	player:messagerSpecial(KEYITEM_OBTAINED,198);
	player:delKeyItem(197);
	player:tradeComplete();
end
end;