-----------------------------------
-- Area: Windurst Walls
--  NPC: Shantotto
-- !pos 122 -2 112 239
-- CSID's missing in autoEventID please check the old forums under resources for all of shantotto's csid's. I found them all manually.
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)

    local count = trade:getItemCount();
    -- Curses Foiled Again!
    if (player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(928,1) and trade:hasItemQty(880,2) and count == 3) then
            player:startEvent(173,0,0,0,0,0,0,928,880); -- Correct items given, complete quest.
        else
            player:startEvent(172,0,0,0,0,0,0,928,880); -- Incorrect or not enough items
        end

    -- Curses,Foiled ... Again!?
    elseif (player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(17316,2) and trade:hasItemQty(940,1) and trade:hasItemQty(552,1) and count == 4) then
            player:startEvent(183); -- Correct items given, complete quest.
        else
            player:startEvent(181,0,0,0,0,0,0,17316,940); -- Incorrect or not enough items
        end


    end
end;

function onTrigger(player,npc)

    local foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
    local CFA2 = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2);
    local CFAtimer = player:getVar("CursesFoiledAgain");
    local FoiledAGolem = player:getQuestStatus(WINDURST,CURSES_FOILED_A_GOLEM);
    local golemdelivery = player:getVar("foiledagolemdeliverycomplete");
    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 7) then
        player:startEvent(397,0,0,0,282);
    elseif (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,6) == false) then
        player:startEvent(498);
    elseif (player:getQuestStatus(WINDURST,CLASS_REUNION) == QUEST_ACCEPTED and player:getVar("ClassReunionProgress") == 3) then
        player:startEvent(409); -- she mentions that Sunny-Pabonny left for San d'Oria
    -------------------------------------------------------
    -- Curses Foiled Again!
    elseif (foiledAgain == QUEST_AVAILABLE) then
        player:startEvent(171,0,0,0,0,0,0,928,880);
    elseif (foiledAgain == QUEST_ACCEPTED) then
        player:startEvent(172,0,0,0,0,0,0,928,880);
    elseif (foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and CFAtimer == 0) then
        local cDay = VanadielDayOfTheYear();
        local cYear = VanadielYear();
        local dFinished = player:getVar("CursesFoiledAgainDay");
        local yFinished = player:getVar("CursesFoiledAgainYear");

        -- player:PrintToPlayer("Vana Day and year:  "..cDay..", "..cYear);
        -- player:PrintToPlayer("Database Day and year:  "..dFinished..", "..yFinished);

        if (cDay == dFinished and cYear == yFinished) then
            player:startEvent(174);
        elseif (cDay == dFinished + 1 and cYear == yFinished) then
            player:startEvent(178);
        elseif ((cDay >= dFinished + 2 and cYear == yFinished) or (cYear > yFinished)) then
            player:startEvent(179);
        end


    -- Curses,Foiled...Again!?
    elseif (foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2 and player:getMainLvl() >= 5 and CFAtimer == 1) then
        player:startEvent(180,0,0,0,0,928,880,17316,940);        -- Quest Start
    elseif (CFA2 == QUEST_ACCEPTED) then
        player:startEvent(181,0,0,0,0,0,0,17316,940);  -- Reminder dialog


    -- Curses,Foiled A-Golem!?
    elseif (CFA2 == QUEST_COMPLETED and FoiledAGolem == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 4 and player:getMainLvl() >= 10) then
        player:startEvent(340);  --quest start
    elseif (golemdelivery == 1) then
        player:startEvent(342);  -- finish
    elseif (FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(341);  -- reminder dialog


    -- Standard dialog
    elseif (FoiledAGolem == QUEST_COMPLETED) then
        player:startEvent(343);  -- new standard dialog after Curses,Foiled A-Golem!?

    elseif (CFA2 == QUEST_COMPLETED) then
        player:startEvent(184);     -- New standard dialog after CFA2
    elseif (player:hasCompletedMission(WINDURST,THE_JESTER_WHO_D_BE_KING) and player:getVar("ShantottoCS") == 1) then
        player:startEvent(399,0,0,282);
    else
        player:startEvent(164);
    end


end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 173) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17081);
        else
            player:tradeComplete();
            player:setVar("CursesFoiledAgainDay",VanadielDayOfTheYear());
            player:setVar("CursesFoiledAgainYear",VanadielYear());
            player:addFame(WINDURST,80);
            player:addItem(17081);
            player:messageSpecial(ITEM_OBTAINED,17081);
            player:completeQuest(WINDURST,CURSES_FOILED_AGAIN_1);
        end

    elseif (csid == 171 and option ~= 1) then
        player:addQuest(WINDURST,CURSES_FOILED_AGAIN_1);

    elseif (csid == 179) then
        player:setVar("CursesFoiledAgainDayFinished",0);
        player:setVar("CursesFoiledAgainYearFinished",0);
        player:setVar("CursesFoiledAgainDay",0);
        player:setVar("CursesFoiledAgainYear",0);
        player:setVar("CursesFoiledAgain",1); -- Used to acknowledge that the two days have passed, Use this to initiate next quest
        player:needToZone(true);

    elseif (csid == 180 and option == 3) then
        player:setVar("CursesFoiledAgain",0);
        player:addQuest(WINDURST,CURSES_FOILED_AGAIN_2);
        player:setTitle(TARUTARU_MURDER_SUSPECT);

    elseif (csid == 183) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17116);
        else
            player:tradeComplete();
            player:setTitle(HEXER_VEXER);
            player:addItem(17116);
            player:messageSpecial(ITEM_OBTAINED,17116);
            player:completeQuest(WINDURST,CURSES_FOILED_AGAIN_2);
            player:needToZone(true);
            player:addFame(WINDURST,90);
        end

    elseif (csid == 340) then
        if (option == 1) then
            player:addQuest(WINDURST,CURSES_FOILED_A_GOLEM);
        else
            player:setTitle(TOTAL_LOSER);
        end

    elseif (csid == 342) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4870);
        else
            player:completeQuest(WINDURST,CURSES_FOILED_A_GOLEM);
            player:setVar("foiledagolemdeliverycomplete",0);
            player:addItem(4870);
            player:messageSpecial(ITEM_OBTAINED,4870);
            player:setTitle(DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH);
            player:addFame(WINDURST,120);
        end
    elseif (csid == 409) then
        player:setVar("ClassReunionProgress",4);
    elseif (csid == 498) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",6,true);
    elseif (csid == 397) then
        player:addKeyItem(GLOVE_OF_PERPETUAL_TWILIGHT)
        player:messageSpecial(KEYITEM_OBTAINED,GLOVE_OF_PERPETUAL_TWILIGHT);
        player:setVar("MissionStatus",8)
    elseif (csid == 399) then
        player:setVar("ShantottoCS",0)
    end
end;
