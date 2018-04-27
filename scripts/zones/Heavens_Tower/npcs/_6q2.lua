-----------------------------------
-- Area: Heaven's Tower
--  NPC: Vestal Chamber (chamber of the Star Sibyl)
-- !pos 0.1 -49 37 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == A_NEW_JOURNEY and MissionStatus == 0) then
        player:startEvent(153);
    elseif (player:hasKeyItem(dsp.kis.MESSAGE_TO_JEUNO_WINDURST)) then
        player:startEvent(166);
    elseif (player:getRank() == 5 and CurrentMission == 255 and player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false) then
        player:startEvent(190);
    elseif (player:hasKeyItem(dsp.kis.BURNT_SEAL)) then
        player:startEvent(192);
    elseif (CurrentMission == THE_SHADOW_AWAITS and MissionStatus == 0) then
        player:startEvent(214);
    elseif (CurrentMission == THE_SHADOW_AWAITS and player:hasKeyItem(dsp.kis.SHADOW_FRAGMENT)) then
        player:startEvent(216);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 0) then
        player:startEvent(310);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 3) then
        player:startEvent(312);
    elseif (CurrentMission == DOLL_OF_THE_DEAD and MissionStatus == 2) then
        player:startEvent(362);
    else
        player:startEvent(154);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 153) then
        player:setVar("MissionStatus",1);
        player:delKeyItem(dsp.kis.STAR_CRESTED_SUMMONS);
        player:addKeyItem(dsp.kis.LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.LETTER_TO_THE_AMBASSADOR);
    elseif (csid == 166 or csid == 190) then
        if (option == 0) then
            player:addMission(WINDURST,THE_FINAL_SEAL);
            player:addKeyItem(dsp.kis.NEW_FEIYIN_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.NEW_FEIYIN_SEAL);
            player:setVar("MissionStatus",10);
        end
        player:delKeyItem(dsp.kis.MESSAGE_TO_JEUNO_WINDURST);
    elseif (csid == 214) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(dsp.kis.STAR_CRESTED_SUMMONS);
        player:addTitle(STARORDAINED_WARRIOR);
    elseif (csid == 310) then
        player:setVar("MissionStatus",1);
        player:addTitle(HERO_ON_BEHALF_OF_WINDURST);
        player:addKeyItem(dsp.kis.HOLY_ONES_INVITATION);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.HOLY_ONES_INVITATION);
    elseif (csid == 312) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 192 or csid == 216) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 362) then
        player:setVar("MissionStatus",3);
    end

end;