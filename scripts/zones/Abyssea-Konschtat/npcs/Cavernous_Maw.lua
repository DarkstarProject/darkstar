-----------------------------------
-- Area: Abyssea - Konschatat
--  NPC: Cavernous Maw
-- @pos 159.943 -72.109 -839.986 15
-- Teleports Players to Konschatat Highlands
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

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
    if (csid == 0x00C8 and option == 1) then
        player:setPos(91,-68,-582,237,108);
    end
end;