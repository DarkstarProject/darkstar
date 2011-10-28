-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Olbergieut 
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
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
	sanFame = player:getFameLevel(SANDORIA);
	gates = player:getQuestStatus(SANDORIA,GATES_TO_PARADISE)
	Key = player:hasKeyItem(150);
	if (sanFame >= 2 and gates == 0 and Key == false) then
	player:startEvent(0x026b);
	end;
if (gates == 1 and Key == true) then 
player:startEvent(0x026c);
elseif (gates == 1 and Key == false) then
player:startEvent(0x0264);
end;
if (gates == 2) then
player:startEvent(0x0264);
end;
if (sanFame < 2) then 
player:startEvent(0x0264);
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

function onEventFinish(player,csid,option)                ----(0x026b) reward
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
if (csid == 0x026b and option == 0) then 
player:getQuestStatus(SANDORIA,GATES_TO_PARADISE);
player:addQuest(GATES_TO_PARADISE);
end
if (csid == 0x026c) then
player:completeQuest(SANDORIA,GATES_TO_PARADISE);
player:addFame(SANDORIA,SAN_FAME*30);
player:setTitle(THE_PIOUS_ONE );
player:delKeyItem(150);
player:addItem(13584,1);
player:messageSpecial(6567,13584);
end
end;
