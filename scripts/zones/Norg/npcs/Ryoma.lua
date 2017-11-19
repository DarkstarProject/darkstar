-----------------------------------
-- Area: Norg
-- NPC:  Ryoma
-- Start and Finish Quest: 20 in Pirate Years, I'll Take the Big Box, True Will
-- Involved in Quest: Ayame and Kaede
-- !pos -23 0 -9 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    twentyInPirateYears = player:getQuestStatus(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
    illTakeTheBigBox = player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
    trueWill = player:getQuestStatus(OUTLANDS,TRUE_WILL);

    mLvl = player:getMainLvl();
    mJob = player:getMainJob();

    if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
        if (player:getVar("AyameAndKaede_Event") == 3) then
            player:startEvent(95); -- During Quest "Ayame and Kaede"
        else
            player:startEvent(94);
        end
    elseif (twentyInPirateYears == QUEST_AVAILABLE and mJob == 13 and mLvl >= 40) then
        player:startEvent(133); -- Start Quest "20 in Pirate Years"
    elseif (twentyInPirateYears == QUEST_ACCEPTED and player:hasKeyItem(TRICK_BOX)) then
        player:startEvent(134); -- Finish Quest "20 in Pirate Years"
    elseif (twentyInPirateYears == QUEST_COMPLETED and illTakeTheBigBox == QUEST_AVAILABLE and mJob == 13 and mLvl >= 50 and player:needToZone() == false) then
        player:startEvent(135); -- Start Quest "I'll Take the Big Box"
    elseif (illTakeTheBigBox == QUEST_COMPLETED and trueWill == QUEST_AVAILABLE and mJob == 13) then
        player:startEvent(136); -- Start Quest "True Will"
    elseif (player:hasKeyItem(OLD_TRICK_BOX) and player:getVar("trueWillCS") == 0) then
        player:startEvent(137);
    elseif (player:getVar("trueWillCS") == 1) then
        player:startEvent(138);
    else
        player:startEvent(94);
    end

end;

--0x00af  94  95  133  134  135  136  137  138  0x00b8  0x00b9  0x00ba  0x00bb  0x00bc  0x00bd

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

    if (csid == 95) then
        player:addKeyItem(SEALED_DAGGER);
        player:messageSpecial(KEYITEM_OBTAINED, SEALED_DAGGER);
        player:delKeyItem(STRANGELY_SHAPED_CORAL);
        player:setVar("AyameAndKaede_Event", 4);
    elseif (csid == 133) then
        player:addQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
        player:setVar("twentyInPirateYearsCS",1);
    elseif (csid == 134) then
        if (player:getFreeSlotsCount() <= 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17771);
        else
            player:delKeyItem(TRICK_BOX);
            player:addItem(17771);
            player:addItem(17772);
            player:messageSpecial(ITEM_OBTAINED, 17771); -- Anju
            player:messageSpecial(ITEM_OBTAINED, 17772); -- Zushio
            player:needToZone();
            player:setVar("twentyInPirateYearsCS",0);
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
        end
    elseif (csid == 135) then
        player:addQuest(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
    elseif (csid == 136) then
        player:addQuest(OUTLANDS,TRUE_WILL);
    elseif (csid == 137) then
        player:setVar("trueWillCS",1);
    end

end;