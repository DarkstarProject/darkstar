-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Miageau
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	Cura = player:getQuestStatus(0,20);
	if (Cura == 1 and player:hasKeyItem(153) == false) then
	player:addKeyItem(153);
player:messageSpecial(6381,153);
elseif (Cura == 1 and player:hasKeyItem(153) == true) then
player:addKeyItem(153);
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
