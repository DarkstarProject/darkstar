-----------------------------------
-- Area: Port San d'Oria
--  NPC: Altiret
-- NPC for Quest "The Pickpocket"
-- !pos 21.263 -3.999 -65.776 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- THE PICKPOCKET
    if player:getQuestStatus(SANDORIA, THE_PICKPOCKET) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 579) then
        player:startEvent(550);

    -- FLYERS FOR REGINE
    elseif player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED);

    -- DEFAULT DIALOG
    else
        player:startEvent(551);
    end
end;

function onTrigger(player,npc)
    -- THE PICKPOCKET
    if player:getVar("thePickpocket") > 0 then
        player:startEvent(547);
    elseif player:getQuestStatus(SANDORIA, THE_PICKPOCKET) == QUEST_COMPLETED then
        player:startEvent(580);

    -- STANDARD DIALOG
    else
        player:startEvent(559);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- THE PICKPOCKET
    if csid == 547 and player:getQuestStatus(SANDORIA, THE_PICKPOCKET) == QUEST_AVAILABLE then
        player:addQuest(SANDORIA, THE_PICKPOCKET);
    elseif csid == 550 and npcUtil.completeQuest(player, SANDORIA, THE_PICKPOCKET, {item = 16667, title = dsp.title.PICKPOCKET_PINCHER, var = {"thePickpocket", "[pickpocket]skipNPC"}}) then
        player:confirmTrade();
    end;
end;
