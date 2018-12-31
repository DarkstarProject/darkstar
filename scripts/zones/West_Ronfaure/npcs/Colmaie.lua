-----------------------------------
-- Area: West Ronfaure
--  NPC: Colmaie
-- Type: Standard NPC
-- !pos -133.627 -61.999 272.373 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)


    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    if (thePickpocket > 0) then
        player:showText(npc, 7263);
    else
        player:showText(npc, ID.text.COLMAIE_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
