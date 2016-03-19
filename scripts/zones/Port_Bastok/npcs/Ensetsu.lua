-----------------------------------
-- Area: Port Bastok
-- NPC:  Ensetsu
-- Finish Quest: Ayame and Kaede
-- Involved in Quest: 20 in Pirate Years, I'll Take the Big Box
-- @pos 33 -6 67 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    AyameAndKaede = player:getQuestStatus(BASTOK,AYAME_AND_KAEDE);

    if (AyameAndKaede == QUEST_ACCEPTED) then

        questStatus = player:getVar("AyameAndKaede_Event")

        if ((questStatus == 1 or questStatus == 2) and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
            player:startEvent(0x00f2);
        elseif (questStatus == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == true) then
            player:startEvent(0x00f5);
        elseif (questStatus == 3) then
            player:startEvent(0x00f3);
        elseif (player:hasKeyItem(SEALED_DAGGER)) then
            player:startEvent(0x00f6,SEALED_DAGGER);
        else
            player:startEvent(0x001b);
        end
    elseif (AyameAndKaede == QUEST_COMPLETED and player:getQuestStatus(OUTLANDS,TWENTY_IN_PIRATE_YEARS) == QUEST_AVAILABLE) then
        player:startEvent(0x00f7);
    elseif (player:getVar("twentyInPirateYearsCS") == 2) then
        player:startEvent(0x0106);
    elseif (player:getVar("twentyInPirateYearsCS") == 4) then
        player:startEvent(0x0107);
    elseif (player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX) == QUEST_ACCEPTED and player:getVar("illTakeTheBigBoxCS") == 0) then
        player:startEvent(0x0108);
    elseif (player:getVar("illTakeTheBigBoxCS") == 1) then
        player:startEvent(0x0109);
    else
        player:startEvent(0x001b);
    end

end;

-- 0x001b  0x00f0  0x00f2  0x00f3  0x00f5  0x00f6  0x00f7  0x0106  0x0107  0x0108  0x0109  0x0105

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

    if (csid == 0x00f2) then
        player:setVar("AyameAndKaede_Event", 2);
    elseif (csid == 0x00f5) then
        player:setVar("AyameAndKaede_Event", 3);
    elseif (csid == 0x00f6) then
        player:delKeyItem(SEALED_DAGGER);
        player:addTitle(SHADOW_WALKER);
        player:unlockJob(13);
        player:messageSpecial(UNLOCK_NINJA); -- You can now become a Ninja
        player:setVar("AyameAndKaede_Event", 0);
        player:addFame(BASTOK, 30);
        player:completeQuest(BASTOK,AYAME_AND_KAEDE);
    elseif (csid == 0x0106) then
        player:setVar("twentyInPirateYearsCS",3);
    elseif (csid == 0x0108) then
        player:setVar("illTakeTheBigBoxCS",1);
    end

end;