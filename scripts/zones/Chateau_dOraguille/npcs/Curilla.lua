-----------------------------------
-- Area: Northern San d'Oria
-- NPC: 
-- Quest NPC
-----------------------------------
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");

CurillasBottle1 = 164;
CurillasBottle2 = 165;
  LynxBaghnakhs = 16409;
 OldPocketWatch = 197;
	   OldBoots = 198;
   CrawlerBlood = 201;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
sanFame = player:getFameLevel(SANDORIA);
if (player:getQuestStatus(0,60) == 0) and (sanFame >=2) then
	player:startEvent(0x37);
elseif (player:getQuestStatus(0,60) == 1) and (player:hasKeyItem(CurillasBottle1) == true) then
	player:startEvent(0x35);
elseif (player:getQuestStatus(0,60) == 1) and (player:hasKeyItem(CurillasBottle2) == true) then
	player:startEvent(0x36);
	elseif (player:getMainJob() == 5) and (player:getMainLvl() >= AF2_QUEST_LEVEL) and (player:getQuestStatus(0,84) == 2) and (player:getQuestStatus(0,85) == 0) then
	player:startEvent(0x5E);
elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(0x6D);
elseif (player:getQuestStatus(0,86) == 1) and ((player:getVar("peace_for_the_spirit_status") >= 2) and (player:getVar("peace_for_the_spirit_status") <= 4)) then
	player:startEvent(0x71);
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 5) then
	player:startEvent(0x33);
elseif (player:getQuestStatus(0,86) == 2) then
	player:startEvent(0x34);
elseif (player:getQuestStatus(0,86) == 1) then
	player:startEvent(0x6C);
elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(0x72);
elseif (player:hasKeyItem(CrawlerBlood) == true) then
  player:startEvent(0x75); -- wiki mentions another event here but that seems like an error. She told you to find the blood AND bury the boots.
elseif (player:hasKeyItem(198) == true) and (player:getVar("needs_crawler_blood") == 0) then
  player:startEvent(0x65);
elseif (player:getVar("needs_crawler_blood") == 1) then
  player:startEvent(0x75);
elseif (player:getQuestStatus(0,85) == 1) and (player:hasKeyItem(OldPocketWatch) == 1) then
	player:startEvent(0x5D);

	else
  player:startEvent(0x212);
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
if (csid == 0x37) and (option == 1) then 
  player:addKeyItem(CurillasBottle1);
  player:messageSpecial(KEYITEM_OBTAINED,CurillasBottle1);
  player:addQuest(0,60)
elseif (csid == 0x36) then 
  player:delKeyItem(CurillasBottle2);
  player:messageSpecial(ITEM_OBTAINED,LynxBaghnakhs);
  player:addItem(LynxBaghnakhs);
  player:completeQuest(0,60);
  player:addFame(0,SAN_FAME*30);
  elseif (csid == 0x5E) and (option == 1) then
	player:addKeyItem(OldPocketWatch);
  player:messageSpecial(KEYITEM_OBTAINED,197);
  player:addQuest(0,85)
elseif (csid == 0x6D) and (option == 1) then
  player:addQuest(0,86)
elseif (csid == 0x65) then 
	player:setVar("needs_crawler_blood",1);
  end
end;