-----------------------------------
-- Area: Windurst Walls
--  NPC: Koru-Moru
-- Starts & Ends Quest: Star Struck
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- @pos -120 -6 124 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
    local count = trade:getItemCount();

    if (trade:hasItemQty(544,1) and count == 1 and trade:getGil() == 0) then
        if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
            if (player:getVar("QuestMakingTheGrade_prog") == 1) then
                player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
            else
                player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
            end
        end
    elseif (trade:hasItemQty(584,1) and count == 1 and trade:getGil() == 0) then
        player:startEvent(0x00c7);
    elseif (qStarStruck == QUEST_ACCEPTED and trade:hasItemQty(582,1) and count == 1 and trade:getGil() == 0) then
        player:startEvent(0x00d3);
    elseif (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
        if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 4) then
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
        end
    elseif (trade:hasItemQty(16511,1) and count == 1 and trade:getGil() == 0) then
        if (player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED) then
            player:startEvent(0x00e0); -- Complete quest!
        else
            player:startEvent(0x00e1); -- not the shell
        end
    elseif (trade:hasItemQty(829,1) and count == 1 and trade:getGil() == 0) then
        if (player:getQuestStatus(WINDURST,THE_ROOT_OF_THE_PROBLEM) == QUEST_ACCEPTED) then
            player:startEvent(0x15D);
            player:tradeComplete();
            player:setVar("rootProblem",2);
        end
    elseif (trade:hasItemQty(17299,4) and count == 4 and trade:getGil() == 0) then -- trade:getItemCount() is apparently checking total of all 8 slots combined. Could have sworn that wasn't how it worked before.
        if (player:getQuestStatus(WINDURST,CLASS_REUNION) == 1 and player:getVar("ClassReunionProgress") == 2) then
            player:startEvent(0x0197); -- now Koru remembers something that you need to inquire his former students.
        end;
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
    local blastFromPast = player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST);
    local blastProg = player:getVar("BlastFromThePast_Prog");
    local rootProblem = player:getQuestStatus(WINDURST,THE_ROOT_OF_THE_PROBLEM);
    local ThePuppetMaster = player:getQuestStatus(WINDURST,THE_PUPPET_MASTER);
    local ThePuppetMasterProgress = player:getVar("ThePuppetMasterProgress");
    local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
    local ClassReunionProgress = player:getVar("ClassReunionProgress");
    local talk1 = player:getVar("ClassReunion_TalkedToFupepe");
    local talk2 = player:getVar("ClassReunion_TalkedToFurakku");
    local CarbuncleDebacle = player:getQuestStatus(WINDURST,CARBUNCLE_DEBACLE);
    local CarbuncleDebacleProgress = player:getVar("CarbuncleDebacleProgress");

    if (blastFromPast == QUEST_AVAILABLE and qStarStruck == QUEST_COMPLETED and player:getQuestStatus(WINDURST,CLASS_REUNION) ~= QUEST_ACCEPTED and player:getFameLevel(WINDURST) >= 3 and player:needToZone() == false) then
        player:startEvent(0x00d6);
    elseif (blastFromPast == QUEST_ACCEPTED and blastProg >= 2) then
        player:startEvent(0x00d7);
    elseif (blastFromPast == QUEST_ACCEPTED) then
        player:startEvent(0x00d8);
    elseif (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        local makingGradeProg = player:getVar("QuestMakingTheGrade_prog");
        if (makingGradeProg == 0 and player:hasItem(544)) then
            player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
        elseif (makingGradeProg == 1) then
            player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
        elseif (makingGradeProg >= 2) then
            player:startEvent(0x011e); -- MAKING THE GRADE: Reminder to go away
        else
            player:startEvent(0x00c1);
        end
    elseif (qStarStruck == QUEST_ACCEPTED) then
        player:startEvent(0x00c6);
    elseif ((qStarStruck == QUEST_AVAILABLE) and (ClassReunion ~= QUEST_ACCEPTED) and player:hasItem(584)) then
        player:startEvent(0x00c5);
    ----------------------------------------------------------
    -- Carbuncle Debacle
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 1 or CarbuncleDebacleProgress == 2) then
        player:startEvent(0x01a0); -- go and see Ripapa
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 4) then
        player:startEvent(0x01a1); -- now go and see Agado-Pugado
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 5) then
        player:startEvent(0x01a2); -- Uran-Mafran must be stopped
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 7) then
        player:startEvent(0x01a3); -- ending cs
    elseif (ThePuppetMaster == QUEST_COMPLETED and ClassReunion == QUEST_COMPLETED and CarbuncleDebacle == QUEST_COMPLETED) then
        player:startEvent(0x01a4); -- new cs after all 3 SMN AFs done
    ----------------------------------------------------------
    -- Class Reunion
    elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 1) then
        player:startEvent(0x019c,0,450,17299,0,0,0,0,0); -- bring Koru 4 astragaloi
    elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 2) then
        player:startEvent(0x019e,0,0,17299,0,0,0,0,0); -- reminder to bring 4 astragaloi
    elseif ((ClassReunion == QUEST_ACCEPTED and ClassReunionProgress >= 3) and (talk1 ~= 1 or talk2 ~= 1)) then
        player:startEvent(0x0198); -- reminder to visit the students
    elseif (ClassReunion == QUEST_ACCEPTED and ClassReunionProgress == 6 and talk1 == 1 and talk2 == 1) then
            player:startEvent(0x019a); -- ending cs
    elseif (ThePuppetMaster == QUEST_COMPLETED and ClassReunion == QUEST_COMPLETED) then
        player:startEvent(0x019b); -- new cs after completed AF2
    ----------------------------------------------------------
    -- The Puppet Master
    elseif (ThePuppetMaster == QUEST_ACCEPTED and ThePuppetMasterProgress == 4) then
        player:startEvent(0x0194); -- ending cs
    elseif (ThePuppetMaster == QUEST_COMPLETED and ClassReunion ~= 2) then
        player:startEvent(0x0195); -- new cs after completed AF1
    ----------------------------------------------------------
    elseif (rootProblem == QUEST_ACCEPTED and player:getVar("rootProblem") == 1) then
        player:startEvent(0x015C,0,829);
    else
        if (qStarStruck == QUEST_COMPLETED) then
            player:startEvent(0x00d5);
        else
            player:startEvent(0x00c1);
        end
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

    if (csid == 0x011d) then  -- Giving him KI from Principle
        player:tradeComplete();
        player:addKeyItem(TATTERED_TEST_SHEET);
        player:messageSpecial(KEYITEM_OBTAINED,TATTERED_TEST_SHEET);
        player:setVar("QuestMakingTheGrade_prog",2);
    elseif (csid == 0x00d3) then
        player:tradeComplete();
        player:addItem(12502);
        player:messageSpecial(ITEM_OBTAINED,12502);
        player:completeQuest(WINDURST,STAR_STRUCK);
        player:needToZone(true);
        player:addFame(WINDURST,20);
    elseif (csid == 0x00c7) then
        player:tradeComplete();
        player:messageSpecial(GIL_OBTAINED,50);
        player:addGil(50);
    elseif (csid == 0x00c5 and option == 0) then
        player:addQuest(WINDURST,STAR_STRUCK);
    elseif (csid == 0x00d6 and option == 0) then
        player:addQuest(WINDURST,BLAST_FROM_THE_PAST);
    elseif (csid == 0x00e0) then
        player:tradeComplete();
        player:setVar("BlastFromThePast_Prog",0);
        player:completeQuest(WINDURST,BLAST_FROM_THE_PAST);
        player:addItem(17030);
        player:messageSpecial(ITEM_OBTAINED,17030);
        player:addTitle(FOSSILIZED_SEA_FARER);
        player:addFame(WINDURST,30);
        player:needToZone(true);
    elseif (csid == 0x0194) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(17532);
            player:messageSpecial(ITEM_OBTAINED,17532);
            player:completeQuest(WINDURST,THE_PUPPET_MASTER);
            player:setVar("ThePuppetMasterProgress",0);
            player:needToZone(true);
            player:addFame(WINDURST,AF1_FAME);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17532);
        end;
    elseif (csid == 0x019c) then
        player:delKeyItem(CARBUNCLES_TEAR);
        player:setVar("ClassReunionProgress",2);
    elseif (csid == 0x0197) then
        player:tradeComplete();
        player:setVar("ClassReunionProgress",3);
    elseif (csid == 0x019a) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(14228);
            player:messageSpecial(ITEM_OBTAINED,14228);
            player:completeQuest(WINDURST,CLASS_REUNION);
            player:setVar("ClassReunionProgress",0);
            player:setVar("ClassReunion_TalkedToFurakku",0);
            player:setVar("ClassReunion_TalkedToFupepe",0);
            player:needToZone(true);
            player:addFame(WINDURST,AF2_FAME);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14228);
        end;
    elseif (csid == 0x01a0) then
        player:setVar("CarbuncleDebacleProgress",2);
    elseif (csid == 0x01a1) then
        player:setVar("CarbuncleDebacleProgress",5);
        player:addKeyItem(DAZEBREAKER_CHARM);
        player:messageSpecial(KEYITEM_OBTAINED,DAZEBREAKER_CHARM);
    elseif (csid == 0x01a3) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(12520); -- Evoker's Horn
            player:messageSpecial(ITEM_OBTAINED,12520);
            player:addTitle(PARAGON_OF_SUMMONER_EXCELLENCE);
            player:completeQuest(WINDURST,CARBUNCLE_DEBACLE);
            player:addFame(WINDURST,AF3_FAME);
            player:setVar("CarbuncleDebacleProgress",0);
            player:needToZone(true);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12520);
        end;
    end;
end;