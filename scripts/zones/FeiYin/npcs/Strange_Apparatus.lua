-----------------------------------
-- Area: FeiYin
-- NPC:  Strange Apparatus
-- @pos -94 -15 220 204
-----------------------------------

package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;

require("scripts/zones/FeiYin/TextIDs");
require("scripts/globals/strangeapparatus");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(0x001B, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0019, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
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