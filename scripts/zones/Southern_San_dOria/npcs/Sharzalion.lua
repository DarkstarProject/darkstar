-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Sharzalion
-- Starts and Finishes Quest: The Crimson Trial
-- Involved in Quest: Peace for the Spirit
-- !pos 95 0 111 230
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    theCrimsonTrial = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL);
    envelopedInDarkness = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.ENVELOPED_IN_DARKNESS);
    peaceForTheSpirit = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT);
    peaceForTheSpiritCS = player:getVar("peaceForTheSpiritCS");
    OrcishDriedFood = player:hasKeyItem(dsp.ki.ORCISH_DRIED_FOOD);

    if (player:getMainJob() == dsp.job.RDM and player:getMainLvl() >= AF1_QUEST_LEVEL and theCrimsonTrial == QUEST_AVAILABLE) then
        if (player:getVar("has_seen_rdmaf1_quest_already") == 0) then
            player:startEvent(70);
        else
            player:startEvent(71);
        end
    elseif (theCrimsonTrial == QUEST_ACCEPTED and OrcishDriedFood == false) then
        player:startEvent(74);
    elseif (OrcishDriedFood == true) then
        player:startEvent(75);
    elseif (theCrimsonTrial == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(68);
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(69);
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and peaceForTheSpiritCS == 0) then
        player:startEvent(64);
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and peaceForTheSpiritCS == 1) then
        player:startEvent(65);
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (peaceForTheSpiritCS == 2 or peaceForTheSpiritCS == 3)) then
        player:startEvent(66);
    else
        player:startEvent(15);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 70 or csid == 71) then
        if (csid == 70 and option == 0) then
            player:setVar("has_seen_rdmaf1_quest_already",1);
        elseif (option == 1) then
            player:addQuest(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL);
            player:setVar("has_seen_rdmaf1_quest_already",0);
        end
    elseif (csid == 75) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16829); -- Fencing Degen
        else
            player:delKeyItem(dsp.ki.ORCISH_DRIED_FOOD);
            player:addItem(16829);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16829); -- Fencing Degen
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL);
        end
    elseif (csid == 64) then
        player:setVar("peaceForTheSpiritCS",1);
    elseif (csid == 66) then
        player:setVar("peaceForTheSpiritCS",3);
    end

end;