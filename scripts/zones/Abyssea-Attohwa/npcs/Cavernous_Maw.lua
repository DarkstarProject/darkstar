-----------------------------------
-- Area: Abyssea - Attohwa
--  NPC: Cavernous Maw
-- @pos -133.197 20.242 -181.658 215
-- Notes: Teleports Players to Buburimu Peninsula
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Abyssea-Attohwa/TextIDs");

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
        player:setPos(-338,-23,47,167,118);
    end
end;