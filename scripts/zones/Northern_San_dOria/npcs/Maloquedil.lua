-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Maloquedil
-- Involved in Quest : Warding Vampires
-- @zone 231
-- @pos: 35 0 60
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
Malo = player:getQuestStatus(0,79)
VampireVar = player:getVar("QuestVampireVar")
if (VampireVar == 1 or Malo == 2) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(1018, 2);
		gil = trade:getGil();
		if (carta and count == 2 and gil == 0) then
			player:startEvent(0x0017);
			end
			end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
Malo = player:getQuestStatus(0,79)
VampireVar = player:getVar("QuestVampireVar")
sanFame = player:getFameLevel(SANDORIA);	
	if (Malo == 0 and sanFame >= 3) then
	player:startEvent(0x0018);
	elseif (VampireVar == 1) then
	player:startEvent(0x0016)
	elseif (Malo == 2) then
	player:startEvent(0x0016)
	else
    player:startEvent(0x0015)	
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
Malo = player:getQuestStatus(0,79)
VampireVar = player:getVar("QuestVampireVar")
if (csid == 0x0018 and option == 1) then
player:addQuest(0,79);
player:setVar("QuestVampireVar",1)
elseif (csid == 0x0017) then
if (VampireVar == 1) then
player:completeQuest(0,79);
player:addFame(SANDORIA,SAN_FAME*30);
player:setTitle(43);
player:tradeComplete();
player:addGil(GIL_RATE*900);
player:messageSpecial(6568,900);
player:setVar("QuestVampireVar",0)
else
player:tradeComplete();
player:addFame(SANDORIA,SAN_FAME*5);
player:addGil(GIL_RATE*900);
player:messageSpecial(6568,900);
end
end
end;