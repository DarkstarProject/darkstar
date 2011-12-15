-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Hot Springs
-- @Zone: 139
-- @pos:  444 -37 -18
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/settings");
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
require("scripts/zones/Horlais_Peak/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getQuestStatus(0,60) == 1) and (player:hasKeyItem(164) == true) then
player:startEvent(0x0002);
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
if (csid == 0x0002) then
player:addKeyItem(165)
player:messageSpecial(KEYITEM_OBTAINED,165);
player:delKeyItem(164);
end
end;