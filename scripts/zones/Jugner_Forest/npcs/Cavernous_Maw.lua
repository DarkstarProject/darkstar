-----------------------------------
-- Area: Jugner Forest
--  NPC: Cavernous Maw
-- !pos -118 -8 -518 104
-- Teleports Players to Jugner Forest [S]
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
local ID = require("scripts/zones/Jugner_Forest/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player,3)) then
        player:startEvent(905);
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 905 and option == 1) then
        dsp.teleport.toMaw(player,13);
    end
end;