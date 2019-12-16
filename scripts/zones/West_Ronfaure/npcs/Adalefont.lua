-----------------------------------
-- Area: West Ronfaure
--  NPC: Adalefont
-- !pos -176.000 -61.999 377.460 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCharVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_ADALEFONT)
    else
        player:showText(npc, ID.text.ADALEFONT_DIALOG)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
