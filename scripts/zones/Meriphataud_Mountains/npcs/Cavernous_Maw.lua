-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Cavernous Maw
-- !pos 597 -32 279 119
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

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player,5)) then
        player:startEvent(905);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 905 and option == 1) then
        dsp.teleport.toMaw(player,17);
    end
end;