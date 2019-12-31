-----------------------------------
-- Area: West Ronfaure
--  NPC: Gachemage
-- Type: Gate Guard
-- !pos -176.000 -61.999 382.425 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCharVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_GACHEMAGE)
    else
        player:showText(npc, ID.text.GACHEMAGE_DIALOG)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
