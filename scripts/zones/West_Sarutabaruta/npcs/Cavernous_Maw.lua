-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Cavernous Maw
-- Teleports Players to West Sarutabaruta [S]
-- !pos -2.229 0.001 -162.715 115
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs")
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player,8) then
        player:startEvent(904)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 904 and option == 1 then
        dsp.teleport.toMaw(player, 7)
    end
end