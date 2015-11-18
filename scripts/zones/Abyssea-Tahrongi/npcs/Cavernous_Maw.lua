-----------------------------------
-- Area: Abyssea - Tahrongi
--  NPC: Cavernous Maw
-- @pos -31.000, 47.000, -681.000 45
-- Teleports Players to Tahrongi Canyon
-----------------------------------
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x00C8);
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
    if (csid == 0x00C8 and option ==1) then
        player:setPos(-28,46,-680,76,117);
    end
end;