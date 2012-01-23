-----------------------------------
-- Area: Shouthern San d'Oria
-- NPC: 
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

OrcishDriedFood = 196;
   FencingDegen = 16829;
    AntiqueCoin = 1093;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getMainJob() == 5) and (player:getMainLvl() >= AF1_QUEST_LEVEL) and (player:getQuestStatus(0,84) == 0) then
  if (player:getVar("has_seen_rdmaf1_quest_already") == 0) then
    player:startEvent(0x46);
  else
  	player:startEvent(0x47);
  end;
elseif (player:getQuestStatus(0,84) == 1) and (player:hasKeyItem(OrcishDriedFood) == false) then
	player:startEvent(0x4A);
elseif (player:hasKeyItem(OrcishDriedFood) == true) then
  player:startEvent(0x4B);
elseif (player:getQuestStatus(0,84) == 2) and (player:getQuestStatus(0,85) == 0) then
	player:startEvent(0x44);
	elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(0x45);
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 0) then
	player:startEvent(0x40);
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 1) then
	player:startEvent(0x41);
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 2) or (player:getVar("peace_for_the_spirit_status") == 3) then
	player:startEvent(0x42);
else
  player:startEvent(0x00F);
end; 
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
if (csid == 0x46) or (csid == 0x47) then
  if (csid == 0x46) and (option == 0) then
  	player:setVar("has_seen_rdmaf1_quest_already",1)
  end;
  if (option == 1) then
  	player:addQuest(0,84)
  	player:setVar("has_seen_rdmaf1_quest_already",0)
  end;
elseif (csid ==0x4B) then
	player:completeQuest(0,84);
	player:delKeyItem(OrcishDriedFood);
	player:addItem(FencingDegen);
	player:messageSpecial(ITEM_OBTAINED,FencingDegen);
	player:addFame(0,SAN_FAME*AF1_FAME);
elseif (csid == 0x40) then
	player:setVar("peace_for_the_spirit_status",1);
elseif (csid == 0x42) then
	player:setVar("peace_for_the_spirit_status",3);
end;
end;
 

