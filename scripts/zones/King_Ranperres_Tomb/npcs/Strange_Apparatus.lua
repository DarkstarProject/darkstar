-----------------------------------
-- Area: King_Ranperre's Tomb
-- NPC:  Strange Apparatus
-- @pos -260 7 -142 190
-----------------------------------

package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;

require("scripts/zones/King_Ranperres_Tomb/TextIDs");
require("scripts/globals/strangeapparatus");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(0x000D, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x000B, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;