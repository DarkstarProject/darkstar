-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Faurbellant
-- Quest NPC
-----------------------------------


package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
gates = player:getQuestStatus(SANDORIA, GATES_TO_PARADISE)
if (gates == 1 and player:hasKeyItem(150) == false) then 
player:addKeyItem(150);
player:messageSpecial(KEYITEM_OBTAINED, 150)
if (gates == 1 and player:hasKeyItem(150)) then
player:addKeyItem(150);
end
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

end;
