-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Cavernous Maw
-- !pos 597 -32 279 119
-- Teleports Players to Meriphataud Mountains [S]
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player, 5) then
        player:startEvent(905)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 905 and option == 1 then
        dsp.teleport.toMaw(player, 17)
    end
end