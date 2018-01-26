-----------------------------------
-- Area: Port Bastok
--  NPC: Ensetsu
-- Finish Quest: Ayame and Kaede
-- Involved in Quest: 20 in Pirate Years, I'll Take the Big Box
-- !pos 33 -6 67 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    AyameAndKaede = player:getQuestStatus(BASTOK,AYAME_AND_KAEDE);

    if (AyameAndKaede == QUEST_ACCEPTED) then

        questStatus = player:getVar("AyameAndKaede_Event")

        if ((questStatus == 1 or questStatus == 2) and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
            player:startEvent(242);
        elseif (questStatus == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == true) then
            player:startEvent(245);
        elseif (questStatus == 3) then
            player:startEvent(243);
        elseif (player:hasKeyItem(SEALED_DAGGER)) then
            player:startEvent(246,SEALED_DAGGER);
        else
            player:startEvent(27);
        end
    elseif (AyameAndKaede == QUEST_COMPLETED and player:getQuestStatus(OUTLANDS,TWENTY_IN_PIRATE_YEARS) == QUEST_AVAILABLE) then
        player:startEvent(247);
    elseif (player:getVar("twentyInPirateYearsCS") == 2) then
        player:startEvent(262);
    elseif (player:getVar("twentyInPirateYearsCS") == 4) then
        player:startEvent(263);
    elseif (player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX) == QUEST_ACCEPTED and player:getVar("illTakeTheBigBoxCS") == 0) then
        player:startEvent(264);
    elseif (player:getVar("illTakeTheBigBoxCS") == 1) then
        player:startEvent(265);
    else
        player:startEvent(27);
    end

end;

-- 27  0x00f0  242  243  245  246  247  262  263  264  265  0x0105

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 242) then
        player:setVar("AyameAndKaede_Event", 2);
    elseif (csid == 245) then
        player:setVar("AyameAndKaede_Event", 3);
    elseif (csid == 246) then
        player:delKeyItem(SEALED_DAGGER);
        player:addTitle(SHADOW_WALKER);
        player:unlockJob(JOBS.NIN);
        player:messageSpecial(UNLOCK_NINJA);
        player:setVar("AyameAndKaede_Event", 0);
        player:addFame(BASTOK, 30);
        player:completeQuest(BASTOK,AYAME_AND_KAEDE);
    elseif (csid == 262) then
        player:setVar("twentyInPirateYearsCS",3);
    elseif (csid == 264) then
        player:setVar("illTakeTheBigBoxCS",1);
    end

end;