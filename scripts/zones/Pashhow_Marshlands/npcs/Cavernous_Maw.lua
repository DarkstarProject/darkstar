-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Cavernous Maw
-- !pos 418 25 27 109
-- Teleports Players to Pashhow Marshlands [S]
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player, 4) then
        player:startEvent(905)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 905 and option == 1 then
        dsp.teleport.toMaw(player, 15)
    end
end