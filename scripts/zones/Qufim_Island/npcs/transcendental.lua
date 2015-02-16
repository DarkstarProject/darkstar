-----------------------------------
-- Area: Qufim Island
-- NPC: Transcendental Radiance
-- Mission: Abyssea The Wyrm God BCNM entrance
-- @zone 126
-- @pos -259.433 -21.581 220.498
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Qufim_Island/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)  
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	local cost = 0
	local stone = 1 -- player:hasKeyItem(); needs changing to crimson abysite
    player:startEvent(0x002E,1538,stone,0,cost);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
   -- printf("CSID: %u",csid);
   -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	if (option == 1) then
		player:setPos(540,-500,-579,65,255);
	end
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;