-----------------------------------
-- Area: West Ronfaure
--  NPC: Laillera
-- !pos -127.297 -62.000 266.800 100
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/West_Ronfaure/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    if (thePickpocket > 0) then
        player:showText(npc, 7264);
    else
        player:showText(npc, ID.text.LAILLERA_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
