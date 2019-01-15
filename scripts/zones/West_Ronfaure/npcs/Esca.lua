-----------------------------------
-- Area: West Ronfaure
--  NPC: Esca
-- Involved in Quest "The Pickpocket"
-- !pos -624.231 -51.499 278.369 100
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
local ID = require("scripts/zones/West_Ronfaure/IDs");
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)

    -- "The Pickpocket" Quest status
    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    -- "The Pickpocket" Trading Esca for Gilt Glasses
    if thePickpocket == QUEST_ACCEPTED and player:getVar("thePickpocket") == 1 and npcUtil.tradeHas(trade, 578) then
        player:startEvent(121);
    end;
end;

function onTrigger(player,npc)
    local thePickpocketStat = player:getVar("thePickpocket")
    local chasingQuotasStat = player:getVar("ChasingQuotas_Progress");

    -- CHASING QUOTAS
    if chasingQuotasStat == 4 then
        player:startEvent(137); -- My earring!  I stole the last dragoon's armor.  Chosen option does not matter.
    elseif chasingQuotasStat == 5 then
        player:startEvent(138); -- Reminder for finding the armor.

    -- THE PICKPOCKET
    elseif thePickpocketStat == 1 then
        player:startEvent(120);
    elseif thePickpocketStat == 2 and not player:hasItem(579) then
        player:startEvent(128);
    elseif thePickpocketStat == 2 then
        player:startEvent(123);

    -- STANDARD DIALOG
    else
        player:startEvent(119);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- "The Pickpocket" recieving Gilt Glasses
    if csid == 121 and npcUtil.giveItem(player, 579) then
        player:setVar("thePickpocket", 2);
        player:confirmTrade();
    elseif (csid == 137) then
        player:setVar("ChasingQuotas_Progress",5);
        player:delKeyItem(dsp.ki.SHINY_EARRING);
    end;
end;
