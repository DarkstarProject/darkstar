-----------------------------------
-- Area: Bostaunieux Obliette
--  NPC: Novalmauge
-- Starts and Finishes Quest: The Rumor
-- Involved in Quest: The Holy Crest, Trouble at the Sluice
-- !pos 70 -24 21 167
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/globals/pathfind");
-----------------------------------

local path =
{
41.169430, -24.000000, 19.860674,
42.256676, -24.000000, 19.885197,
41.168694, -24.000000, 19.904638,
21.859211, -24.010996, 19.792259,
51.917370, -23.924366, 19.970068,
74.570229, -24.024828, 20.103880,
44.533886, -23.947662, 19.926519
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

function onTrade(player,npc,trade)

    if (player:getVar("troubleAtTheSluiceVar") == 2) then
        if (trade:hasItemQty(959,1) and trade:getItemCount() == 1) then -- Trade Dahlia
            player:startEvent(17);
            npc:wait();
        end
    end
    if (player:getQuestStatus(SANDORIA,THE_RUMOR) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local BeastBlood = trade:hasItemQty(930,1)
        if (BeastBlood == true and count == 1) then
            player:startEvent(12);
            npc:wait();
        end
    end
end;

function onTrigger(player,npc)

    local troubleAtTheSluice = player:getQuestStatus(SANDORIA,TROUBLE_AT_THE_SLUICE);
    local TheHolyCrest = player:getVar("TheHolyCrest_Event");
    local tatsVar = player:getVar("troubleAtTheSluiceVar");
    local theRumor = player:getQuestStatus(SANDORIA,THE_RUMOR);
    local crestCheck = player:getVar("theHolyCrestCheck");

    npc:wait();

    -- The Holy Crest Quest
    if (TheHolyCrest == 1) then
        player:startEvent(6);
    elseif (TheHolyCrest == 2 and crestCheck == 0) then
        player:startEvent(7);
        player:setVar("theHolyCrestCheck",1);
    -- Trouble at the Sluice Quest
    elseif (tatsVar == 1) then
        player:startEvent(15);
        player:setVar("troubleAtTheSluiceVar",2);
    elseif (tatsVar == 2) then
        player:startEvent(16);
    -- The rumor Quest
    elseif (theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3 and player:getMainLvl() >= 10) then
        player:startEvent(13);
    elseif (theRumor == QUEST_ACCEPTED) then
        player:startEvent(11);
    elseif (theRumor == QUEST_COMPLETED) then
        player:startEvent(14); -- Standard dialog after "The Rumor"
        player:setVar("theHolyCrestCheck",0);
    else
        player:startEvent(10); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 6) then
        player:setVar("TheHolyCrest_Event",2);
    elseif (csid == 17) then
        player:tradeComplete();
        player:addKeyItem(NEUTRALIZER);
        player:messageSpecial(KEYITEM_OBTAINED,NEUTRALIZER);
        player:setVar("troubleAtTheSluiceVar",0);
        player:setVar("theHolyCrestCheck",0);
    elseif (csid == 13 and option == 1) then
        player:addQuest(SANDORIA,THE_RUMOR);
    elseif (csid == 12) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4853); -- Scroll of Drain
        else
            player:tradeComplete();
            player:addItem(4853);
            player:messageSpecial(ITEM_OBTAINED, 4853); -- Scroll of Drain

            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_RUMOR);
        end
    end

    npc:wait(0);
end;