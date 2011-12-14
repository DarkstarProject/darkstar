-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Belgidiveau
-- Involved in Quest : Trouble at the Sluice
-- @zone 231
-- @pos -98 0 69
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
Flor = player:getQuestStatus(0,68);
sanFame = player:getFameLevel(SANDORIA);
FlorVar = player:getVar("QuestFlorVar")
KeyFlor = player:hasKeyItem(166);
if (Flor == 0 and sanFame >= 3) then
player:startEvent(0x0039);
player:setVar("QuestFlorVar",1)
elseif (FlorVar == 1) then
player:startEvent(0x0037)
NewFlorVar = FlorVar + 1;
              player:setVar("QuestFlorVar",NewFlorVar)
elseif (FlorVar == 3) then
player:startEvent(0x0038)
else
player:startEvent(0x0249);
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
FlorVar = player:getVar("QuestFlorVar")
Flor = player:getQuestStatus(0,68);
if (csid == 0x0039 and option == 0) then
player:addQuest(0,68);
elseif (csid == 0x0038) then
player:completeQuest(0,68);
player:addFame(SANDORIA,SAN_FAME*30);
player:delKeyItem(166);
player:tradeComplete();
player:addItem(16706,1);
player:messageSpecial(6567,16706)
player:setVar("QuestFlorVar",0)
end
end;




