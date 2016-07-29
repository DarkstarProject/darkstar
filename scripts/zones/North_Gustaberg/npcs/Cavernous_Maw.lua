-----------------------------------
-- Area: North Gustaberg
--  NPC: Cavernous Maw
-- @pos 466 0 479 106
-- Teleports Players to North Gustaberg [S]
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/North_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(PURE_WHITE_FEATHER) and hasMawActivated(player,7)) then
        player:startEvent(0x0387);
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
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (csid == 0x0387 and option == 1) then
        toMaw(player,11);
    end
end;