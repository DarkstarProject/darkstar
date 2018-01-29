-----------------------------------
-- Area: Port San d'Oria
--  NPC: Miene
-- NPC for Quest "The Pickpocket"
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeMiene") == 0) then
            player:messageSpecial(MIENE_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeMiene",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:messageSpecial(FLYERS_HANDED, 17 - player:getVar("FFR"));
            player:tradeComplete();
        elseif (player:getVar("tradeMiene") == 1) then
            player:messageSpecial(FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)

    -- "The Pickpocket" Quest status
    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    -- "The Pickpocket" Quest events
    if (player:getVar("thePickpocket") == 1 and thePickpocket == QUEST_AVAILABLE) then -- skips the original cut scene for "The Pickpocket" Quest if already seen.
        player:startEvent(554);
    elseif (thePickpocket == QUEST_AVAILABLE) then
        player:startEvent(502);
        player:setVar("thePickpocket",1);
    -- "The Pickpocket" giving Eagle Button, but checking if they already have it.
    elseif (thePickpocket == QUEST_ACCEPTED and player:getVar("thePickpocketEagleButton") == 0) then
        player:startEvent(549);
        player:setVar("thePickpocketEagleButton",1);
    elseif (thePickpocket == QUEST_ACCEPTED and player:getVar("thePickpocketEagleButton") == 1) then
        player:startEvent(611);
    else
        player:startEvent(553);
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Pickpocket" Quest, recieving Eagle Button
    if (csid == 549 or csid == 611) then
        if (player:hasItem(578) == false) then
            npcUtil.giveItem(player, 578);
        else
            player:startEvent(552);
        end;
    end;
end;
