-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Sharzalion
-- Starts and Finishes Quest: The Crimson Trial
-- Involved in Quest: Peace for the Spirit
-- @zone 230
-- !pos 95 0 111
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    theCrimsonTrial = player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL);
    envelopedInDarkness = player:getQuestStatus(SANDORIA,ENVELOPED_IN_DARKNESS);
    peaceForTheSpirit = player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT);
    peaceForTheSpiritCS = player:getVar("peaceForTheSpiritCS");
    OrcishDriedFood = player:hasKeyItem(ORCISH_DRIED_FOOD);

    if (player:getMainJob() == JOBS.RDM and player:getMainLvl() >= AF1_QUEST_LEVEL and theCrimsonTrial == QUEST_AVAILABLE) then
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

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 70 or csid == 71) then
        if (csid == 70 and option == 0) then
            player:setVar("has_seen_rdmaf1_quest_already",1);
        elseif (option == 1) then
            player:addQuest(SANDORIA,THE_CRIMSON_TRIAL);
            player:setVar("has_seen_rdmaf1_quest_already",0);
        end
    elseif (csid == 75) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16829); -- Fencing Degen
        else
            player:delKeyItem(ORCISH_DRIED_FOOD);
            player:addItem(16829);
            player:messageSpecial(ITEM_OBTAINED, 16829); -- Fencing Degen
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_CRIMSON_TRIAL);
        end
    elseif (csid == 64) then
        player:setVar("peaceForTheSpiritCS",1);
    elseif (csid == 66) then
        player:setVar("peaceForTheSpiritCS",3);
    end

end;