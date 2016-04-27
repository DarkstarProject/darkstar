-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Halver
-- Involved in Mission 2-3, 3-3, 5-1, 5-2, 8-1
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos 2 0.1 0.1 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Chateau_dOraguille/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    --print(player:getVar("MissionStatus"));
    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local WildcatSandy = player:getVar("WildcatSandy");
    local MissionStatus = player:getVar("MissionStatus");

    -- Lure of the Wildcat San d'Oria
    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,16) == false) then
        player:startEvent(558);
    -- Blackmail quest
    elseif (player:getQuestStatus(SANDORIA, BLACKMAIL) == QUEST_ACCEPTED and player:hasKeyItem(SUSPICIOUS_ENVELOPE)) then
        player:startEvent(549);
        player:setVar("BlackMailQuest",1);
        player:delKeyItem(SUSPICIOUS_ENVELOPE);
    -- San D'Oria Flag check
    elseif (player:getVar("Flagsando") == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,181);
        else
            player:setVar("Flagsando",0);
            player:addItem(181);
            player:messageSpecial(ITEM_OBTAINED,181);
        end
    elseif (player:getCurrentMission(TOAU) == CONFESSIONS_OF_ROYALTY and player:hasKeyItem(RAILLEFALS_LETTER)) then
        player:startEvent(564);
    elseif (player:getCurrentMission(TOAU) == EASTERLY_WINDS and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(565);
    elseif (pNation == SANDORIA) then
        -- Mission San D'Oria 9-2 The Heir to the Light
        if (player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT)) then
            player:startEvent(31);
        elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 7) then
            player:startEvent(9);
        elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 6) then
            player:startEvent(30);
        elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus >= 2 and MissionStatus <=5) then
            player:startEvent(29);
        -- Mission San d'Oria 8-1 Coming of Age --
        elseif (currentMission == COMING_OF_AGE and MissionStatus == 3 and player:hasKeyItem(DROPS_OF_AMNIO)) then
            player:startEvent(102);
        elseif (currentMission == COMING_OF_AGE and MissionStatus == 1) then
            player:startEvent(58);
        -- Mission San D'Oria 6-1 Leaute's last wishes
        elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 3) then
            player:startEvent(22);
        elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
            player:startEvent(24);
        elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 1) then
            player:startEvent(23);
        elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 0) then
            player:startEvent(25);
        -- Mission San D'Oria 5-2 The Shadow Lord
        elseif (player:hasCompletedMission(SANDORIA,THE_SHADOW_LORD) and currentMission == 255) then
            player:showText(npc,HALVER_OFFSET+500);
        elseif (currentMission == THE_SHADOW_LORD and MissionStatus == 5) then
            player:showText(npc,HALVER_OFFSET+471);
        elseif (currentMission == THE_SHADOW_LORD and MissionStatus == 4 and player:hasKeyItem(SHADOW_FRAGMENT)) then
            player:startEvent(548);
        elseif (currentMission == THE_SHADOW_LORD and MissionStatus == 0) then
            player:startEvent(546);
            -- Mission San D'Oria 5-1 The Ruins of Fei'Yin
        elseif (currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 12 and player:hasKeyItem(BURNT_SEAL)) then
            player:startEvent(534);
        elseif (currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 10) then
            player:showText(npc,HALVER_OFFSET+334);
        elseif (currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 9) then
            player:startEvent(533);
        -- Mission San D'Oria 3-3 Appointment to Jeuno
        elseif (currentMission == APPOINTMENT_TO_JEUNO and MissionStatus == 0) then
            player:startEvent(508);
        -- Mission San D'Oria 2-3 Journey Abroad
        elseif (currentMission == JOURNEY_ABROAD and MissionStatus == 11) then
            player:startEvent(507);
        elseif (currentMission == JOURNEY_ABROAD and MissionStatus == 0) then
            player:startEvent(505);
        elseif (currentMission == JOURNEY_ABROAD) then
            player:startEvent(532);
        end
    elseif (pNation == BASTOK) then
        -- Bastok 2-3 San -> Win
        if (currentMission == THE_EMISSARY) then
            if (MissionStatus == 3) then
                player:startEvent(501);
            end
        -- Bastok 2-3 San -> Win, report to consulate
        elseif (currentMission == THE_EMISSARY_SANDORIA) then
            player:showText(npc,HALVER_OFFSET+279);
        -- Bastok 2-3 Win -> San
        elseif (currentMission == THE_EMISSARY_SANDORIA2) then
            if (MissionStatus == 8) then
                player:startEvent(503);
            elseif (MissionStatus <= 10) then
                player:showText(npc,HALVER_OFFSET+279);
            end
        else
            player:showText(npc,HALVER_OFFSET+1092);
        end
    elseif (pNation == WINDURST) then
        -- Windurst 2-3
        if (currentMission == THE_THREE_KINGDOMS and MissionStatus < 3) then
            player:startEvent(532);
        elseif (currentMission == THE_THREE_KINGDOMS_SANDORIA or currentMission == THE_THREE_KINGDOMS_SANDORIA2) then
            if (MissionStatus == 3) then
                player:startEvent(502);
            elseif (MissionStatus == 8) then
                player:startEvent(504);
            else
                player:showText(npc,HALVER_OFFSET+279);
            end
        end

    else
        player:showText(npc,HALVER_OFFSET+1092);
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

    if (csid == 501) then
        player:addMission(BASTOK,THE_EMISSARY_SANDORIA);
        player:setVar("MissionStatus",4);
    elseif (csid == 503) then
        player:setVar("MissionStatus",9);
    elseif (csid == 508) then
        player:setVar("MissionStatus",2);
    elseif (csid == 505) then
        player:setVar("MissionStatus",2);
        player:addKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_SANDORIA);
    elseif (csid == 502) then
        player:setVar("MissionStatus",4);
    elseif (csid == 558) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",16,true);
    elseif (csid == 504) then
        player:setVar("MissionStatus",9);
    elseif (csid == 546) then
        player:setVar("MissionStatus",1);
    elseif (csid == 507 or csid == 533 or csid == 534 or csid == 548) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 25) then
        player:setVar("MissionStatus",1);
    elseif (csid == 22) then
        player:setVar("MissionStatus",4);
    elseif (csid == 9) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,181);
            player:setVar("Flagsando",1);
        else
            player:addItem(181);
            player:messageSpecial(ITEM_OBTAINED,181);
        end
        player:setVar("MissionStatus",0);
        player:completeMission(SANDORIA,THE_HEIR_TO_THE_LIGHT);
        player:setRank(10);
        player:addGil(100000);
        player:messageSpecial(GIL_OBTAINED,100000);
        player:setTitle(295);
        player:setVar("SandoEpilogue",1);
    elseif (csid == 58) then
        player:setVar("MissionStatus",2);
    elseif (csid == 102) then
        finishMissionTimeline(player,3,csid,option);
        player:setVar("Wait1DayM8-1_date", os.date("%j"));
    elseif (csid == 564 and option == 1) then
        player:completeMission(TOAU,CONFESSIONS_OF_ROYALTY);
        player:addMission(TOAU,EASTERLY_WINDS);
        player:delKeyItem(RAILLEFALS_LETTER);
    elseif (csid == 565) then
        player:setVar("AhtUrganStatus", 1);
    end
end;
