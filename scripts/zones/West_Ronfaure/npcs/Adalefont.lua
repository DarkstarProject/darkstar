-----------------------------------
-- Area: West Ronfaure
--  NPC: Adalefont
-- !pos -176.000 -61.999 377.460 100
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/West_Ronfaure/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    if (thePickpocket > 0) then
        player:showText(npc, 7265);
    else
        player:showText(npc, ID.text.ADALEFONT_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
