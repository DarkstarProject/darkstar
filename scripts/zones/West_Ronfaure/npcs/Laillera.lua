-----------------------------------
-- Area: West Ronfaure
--  NPC: Laillera
-- !pos -127.297 -62.000 266.800 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    if (thePickpocket > 0) then
        player:showText(npc, 7264);
    else
        player:showText(npc, LAILLERA_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;



