-----------------------------------
-- Area: Heaven's Tower
--  NPC: Vestal Chamber (chamber of the Star Sibyl)
-- !pos 0.1 -49 37 242
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Heavens_Tower/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == A_NEW_JOURNEY and MissionStatus == 0) then
        player:startEvent(153);
    elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST)) then
        player:startEvent(166);
    elseif (player:getRank() == 5 and CurrentMission == 255 and player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false) then
        player:startEvent(190);
    elseif (player:hasKeyItem(dsp.ki.BURNT_SEAL)) then
        player:startEvent(192);
    elseif (CurrentMission == THE_SHADOW_AWAITS and MissionStatus == 0) then
        player:startEvent(214);
    elseif (CurrentMission == THE_SHADOW_AWAITS and player:hasKeyItem(dsp.ki.SHADOW_FRAGMENT)) then
        player:startEvent(216);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 0) then
        player:startEvent(310);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 3) then
        player:startEvent(312);
    elseif (CurrentMission == DOLL_OF_THE_DEAD and MissionStatus == 2) then
        player:startEvent(362);
    elseif (CurrentMission == MOON_READING and MissionStatus == 0) then
        player:startEvent(384);
    elseif (CurrentMission == MOON_READING and MissionStatus == 1 and player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_ROMAEVE) and player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA) and player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH)) then
        player:startEvent(385);
    elseif (CurrentMission == MOON_READING and MissionStatus == 3) then
        player:startEvent(386);
    elseif (CurrentMission == MOON_READING and MissionStatus == 4) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,183);
        else    
            player:startEvent(407);
        end
    else
        player:startEvent(154);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 153) then
        player:setVar("MissionStatus",1);
        player:delKeyItem(dsp.ki.STAR_CRESTED_SUMMONS);
        player:addKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_AMBASSADOR);
    elseif (csid == 166 or csid == 190) then
        if (option == 0) then
            player:addMission(WINDURST,THE_FINAL_SEAL);
            player:addKeyItem(dsp.ki.NEW_FEIYIN_SEAL);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.NEW_FEIYIN_SEAL);
            player:setVar("MissionStatus",10);
        end
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST);
    elseif (csid == 214) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(dsp.ki.STAR_CRESTED_SUMMONS);
        player:addTitle(dsp.title.STARORDAINED_WARRIOR);
    elseif (csid == 310) then
        player:setVar("MissionStatus",1);
        player:addTitle(dsp.title.HERO_ON_BEHALF_OF_WINDURST);
        player:addKeyItem(dsp.ki.HOLY_ONES_INVITATION);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HOLY_ONES_INVITATION);
    elseif (csid == 312) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 192 or csid == 216) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 362) then
        player:setVar("MissionStatus",3);
    elseif (csid == 384) then
        player:setVar("MissionStatus",1);
    elseif (csid == 385) then
        player:setVar("MissionStatus",2);
    elseif (csid == 386) then
        player:setVar("MissionStatus",4);
    elseif (csid == 407) then
        player:setPos(0,-16.750,130,64,239);
    end

end;