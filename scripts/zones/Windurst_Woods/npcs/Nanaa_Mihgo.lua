-----------------------------------
-- Area: Windurst Walls
--  NPC: Nanaa Mihgo
-- Starts and Finishes Quest: Mihgo's Amigo (R), The Tenshodo Showdown (start), Rock Racketeer (start, listed as ROCK_RACKETTER in quests.lua)
-- Involved In Quest: Crying Over Onions
-- Involved in Mission 2-1
-- !pos 62 -4 240 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(498,4) and trade:getItemCount() == 4) then -- Trade Yagudo Necklace x4

        local MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);

        if (MihgosAmigo == QUEST_ACCEPTED) then
            player:startEvent(88,GIL_RATE*200);
        elseif (MihgosAmigo == QUEST_COMPLETED) then
            player:startEvent(494,GIL_RATE*200);
        end
    end

end;

function onTrigger(player,npc)

    -- Check for Missions first (priority?)
    local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(WINDURST) == LOST_FOR_WORDS and MissionStatus > 0 and MissionStatus < 5) then
        if (MissionStatus == 1) then
            player:startEvent(165,0,LAPIS_CORAL,LAPIS_MONOCLE);
        elseif (MissionStatus == 2) then
            player:startEvent(166,0,LAPIS_CORAL,LAPIS_MONOCLE);
        elseif (MissionStatus == 3) then
            player:startEvent(169);
        else
            player:startEvent(170);
        end
    else

        local CryingOverOnionsVar = player:getVar("CryingOverOnions");
        local MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);

        local theTenshodoShowdown = player:getQuestStatus(WINDURST,THE_TENSHODO_SHOWDOWN); -- THF af quest
        local theTenshodoShowdownCS = player:getVar("theTenshodoShowdownCS");
        local RockRacketeer = player:getQuestStatus(WINDURST,ROCK_RACKETTER);
        local RRvar = player:getVar("rockracketeer_sold");

        local thickAsThieves = player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES); -- THF af quest
        local thickAsThievesCS = player:getVar("thickAsThievesCS");
        local thickAsThievesGrapplingCS = player:getVar("thickAsThievesGrapplingCS");
        local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

        local hittingTheMarquisate = player:getQuestStatus(WINDURST,HITTING_THE_MARQUISATE); -- THF af quest
        local hittingTheMarquisateYatnielCS = player:getVar("hittingTheMarquisateYatnielCS");
        local hittingTheMarquisateHagainCS = player:getVar("hittingTheMarquisateHagainCS");
        local hittingTheMarquisateNanaaCS = player:getVar("hittingTheMarquisateNanaaCS");

        local WildcatWindurst = player:getVar("WildcatWindurst");

        local LvL = player:getMainLvl();
        local Job = player:getMainJob();

        -- Lure of the Wildcat (Windurst)
        if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,4) == false) then
            player:startEvent(732);

        -- Optional CS of the quest "Crying Over Onions"
        elseif (CryingOverOnionsVar == 1) then
            player:startEvent(598);

        -- Quest "The Tenshodo Showdown" THF af
        elseif (Job == 6 and LvL >= 40 and theTenshodoShowdown == QUEST_AVAILABLE) then
            player:startEvent(496); -- Start Quest "The Tenshodo Showdown"
        elseif (theTenshodoShowdownCS == 1) then
            player:startEvent(497); -- During Quest "The Tenshodo Showdown" (before cs at tensho HQ)
        elseif (theTenshodoShowdownCS >= 2) then
            player:startEvent(498); -- During Quest "The Tenshodo Showdown" (after cs at tensho HQ)
        elseif (Job == 6 and LvL < 50 and theTenshodoShowdown == QUEST_COMPLETED) then
            player:startEvent(503); -- Standard dialog after "The Tenshodo Showdown"

        -- Quest "Thick as Thieves" THF af
        elseif (Job == 6 and LvL >= 50 and thickAsThieves == QUEST_AVAILABLE and theTenshodoShowdown == QUEST_COMPLETED) then
            player:startEvent(504); -- Start Quest "Thick as Thieves"
        elseif (thickAsThievesCS >= 1 and thickAsThievesCS <= 4 and thickAsThievesGamblingCS <= 7 and thickAsThievesGrapplingCS <= 7) then
            player:startEvent(505,0,GANG_WHEREABOUTS_NOTE); -- During Quest "Thick as Thieves" (before completing grappling+gambling sidequests)
        elseif (thickAsThievesGamblingCS == 8 and thickAsThievesGrapplingCS ==8) then
            player:startEvent(508);    -- complete quest "as thick as thieves"


        -- Quest "Hitting The Marquisate" THF af
        elseif (Job == 6 and LvL >= 50 and thickAsThieves == QUEST_COMPLETED and hittingTheMarquisate == QUEST_AVAILABLE) then
            player:startEvent(512); -- Start Quest "Hitting The Marquisate"
        elseif (hittingTheMarquisateYatnielCS == 3 and hittingTheMarquisateHagainCS == 9) then
            player:startEvent(516); -- finish first part of "Hitting The Marquisate"
        elseif (hittingTheMarquisateNanaaCS == 1) then
            player:startEvent(517); -- during second part of "Hitting The Marquisate"


        -- Rock Racketeer (listed as ROCK_RACKETTER in quests.lua)
        elseif (MihgosAmigo == QUEST_COMPLETED and RockRacketeer == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 3) then
            if (player:needToZone()) then
                player:startEvent(89); -- Mihgos Amigo complete text
            else
                player:startEvent(93); -- quest start
            end
        elseif (RockRacketeer == QUEST_ACCEPTED and RRvar == 1) then
            player:startEvent(98); -- advance quest talk to Varun
        elseif (RockRacketeer == QUEST_ACCEPTED and RRvar == 2) then
            player:startEvent(95); -- not sold reminder
        elseif (RockRacketeer == QUEST_ACCEPTED) then
            player:startEvent(94); -- quest reminder


        -- Quest "Mihgo's Amigo"
        elseif (MihgosAmigo == QUEST_AVAILABLE) then
            local CryingOverOnions = player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);

            if (CryingOverOnions == QUEST_AVAILABLE) then
                player:startEvent(81); -- Start Quest "Mihgo's Amigo" with quest "Crying Over Onions" Activated
            else
                player:startEvent(80); -- Start Quest "Mihgo's Amigo"
            end
        elseif (MihgosAmigo == QUEST_ACCEPTED) then
            player:startEvent(82);

        -- Standard dialog
        elseif (RockRacketeer == QUEST_COMPLETED) then
            player:startEvent(99); -- new dialog after Rock Racketeer

        elseif (MihgosAmigo == QUEST_COMPLETED) then
            player:startEvent(89); -- new dialog after Mihgo's Amigos
        else
            player:startEvent(76); -- standard dialog
        end


    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 80 or csid == 81) then
        player:addQuest(WINDURST,MIHGO_S_AMIGO);
    elseif (csid == 93) then -- start quest "rock racketeer"
        player:addQuest(WINDURST,ROCK_RACKETTER);
        player:addKeyItem(SHARP_GRAY_STONE);
        player:messageSpecial(KEYITEM_OBTAINED,SHARP_GRAY_STONE);
    elseif (csid == 98) then
        player:delGil(10*GIL_RATE);
        player:setVar("rockracketeer_sold",3);
    elseif (csid == 88) then
        player:tradeComplete();
        player:addGil(GIL_RATE*200);
        player:addTitle(CAT_BURGLAR_GROUPIE);
        player:needToZone(true);
        player:addFame(NORG,60);
        player:completeQuest(WINDURST,MIHGO_S_AMIGO);
    elseif (csid == 494) then
        player:tradeComplete();
        player:addTitle(CAT_BURGLAR_GROUPIE);
        player:addGil(GIL_RATE*200);
        player:addFame(NORG,30);
    elseif (csid == 496) then
        player:addQuest(WINDURST,THE_TENSHODO_SHOWDOWN);
        player:setVar("theTenshodoShowdownCS",1);
        player:addKeyItem(LETTER_FROM_THE_TENSHODO);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_THE_TENSHODO);
    elseif (csid == 504 and option == 1) then  -- start quest "as thick as thieves"
        player:addQuest(WINDURST,AS_THICK_AS_THIEVES);
        player:setVar("thickAsThievesCS",1);
        player:addKeyItem(GANG_WHEREABOUTS_NOTE);
        player:addKeyItem(FIRST_FORGED_ENVELOPE);
        player:addKeyItem(SECOND_FORGED_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,GANG_WHEREABOUTS_NOTE);
        player:messageSpecial(KEYITEM_OBTAINED,FIRST_FORGED_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,SECOND_FORGED_ENVELOPE);
    elseif (csid == 508) then    -- complete quest "as thick as thieves"
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12514);
        else
            player:addItem(12514);
            player:messageSpecial(ITEM_OBTAINED,12514);
            player:completeQuest(WINDURST,AS_THICK_AS_THIEVES);
            player:setVar("thickAsThievesCS",0);
            player:setVar("thickAsThievesGrapplingCS",0);
            player:setVar("thickAsThievesGamblingCS",0);
            player:delKeyItem(GANG_WHEREABOUTS_NOTE);
            player:delKeyItem(FIRST_SIGNED_FORGED_ENVELOPE);
            player:delKeyItem(SECOND_SIGNED_FORGED_ENVELOPE);
        end
    elseif (csid == 512) then  -- start quest "hitting The Marquisate "
        player:addQuest(WINDURST,HITTING_THE_MARQUISATE);
        player:setVar("hittingTheMarquisateYatnielCS",1);
        player:setVar("hittingTheMarquisateHagainCS",1);
        player:addKeyItem(CAT_BURGLARS_NOTE);
        player:messageSpecial(KEYITEM_OBTAINED,CAT_BURGLARS_NOTE);
    elseif (csid == 516) then  -- end first part of "hitting The Marquisate "
        player:setVar("hittingTheMarquisateNanaaCS",1);
        player:setVar("hittingTheMarquisateYatnielCS",0);
        player:setVar("hittingTheMarquisateHagainCS",0);
    elseif (csid == 165 and option == 1) then -- Windurst Mission 2-1 continuation
        -- Add the key item for the mission
        player:addKeyItem(LAPIS_MONOCLE);
        player:messageSpecial(KEYITEM_OBTAINED,LAPIS_MONOCLE);
        -- Mark the progress
        player:setVar("MissionStatus",2);
    elseif (csid == 169) then -- Windurst Mission 2-1 continuation
        player:setVar("MissionStatus",4);
        player:setVar("MissionStatus_randfoss",0);
        player:delKeyItem(LAPIS_MONOCLE);
        player:delKeyItem(LAPIS_CORAL);
        player:addKeyItem(HIDEOUT_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,HIDEOUT_KEY);
    elseif (csid == 732) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",4,true);
    end

end;