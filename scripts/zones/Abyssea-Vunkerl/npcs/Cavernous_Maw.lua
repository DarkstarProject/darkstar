-----------------------------------
-- Area: Abyssea - Vunkerl
--  NPC: Cavernous Maw
-- @pos -360.000 -46.750 700.000 217
-- Notes: Teleports Players to Jugner Forest
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x00c8);
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
    if (csid == 0x00c8 and option == 1) then
        player:setPos(241,0.001,11,42,104);
    end
end;