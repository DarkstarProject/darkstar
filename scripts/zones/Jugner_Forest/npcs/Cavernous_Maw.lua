-----------------------------------
-- Area: Jugner Forest
--  NPC: Cavernous Maw
-- @pos -118 -8 -518 104
-- Teleports Players to Jugner Forest [S]
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Jugner_Forest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(PURE_WHITE_FEATHER) and hasMawActivated(player,3)) then
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
        toMaw(player,13);
    end
end;