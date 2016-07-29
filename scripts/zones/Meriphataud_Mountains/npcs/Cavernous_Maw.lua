-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Cavernous Maw
-- @pos 597 -32 279 119
-- Teleports Players to Meriphataud Mountains [S]
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Meriphataud_Mountains/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(PURE_WHITE_FEATHER) and hasMawActivated(player,5)) then
        player:startEvent(0x0389);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0389 and option == 1) then
        toMaw(player,17);
    end
end;