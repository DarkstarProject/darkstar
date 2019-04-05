-----------------------------------
--
-- Zone: RuLude_Gardens (243)
--
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-4,-2,40,4,3,50);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        position = math.random(1,5) + 45;
        player:setPos(position,10,-73,192);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 2) then
        cs = 10047;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)

    local regionID = region:GetRegionID();
    -- printf("regionID: %u",regionID);

    if (regionID == 1) then
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN and player:getVar("PromathiaStatus") == 1) then
            player:startEvent(65,player:getNation());
        elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 0) then
            player:startEvent(10048);
        elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(10051);
        elseif (player:getCurrentMission(TOAU) == EASTERLY_WINDS and player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(10094);
        elseif (player:getCurrentMission(TOAU) == ALLIED_RUMBLINGS) then
            player:startEvent(10097);
        elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN) then
            if (player:getVar("COP_3-taru_story") == 2 and player:getVar("COP_shikarees_story") == 1 and player:getVar("COP_louverance_story") == 3
            and player:getVar("COP_tenzen_story") == 1 and player:getVar("COP_jabbos_story") == 1) then
                player:startEvent(122);
            elseif (player:getVar("PromathiaStatus") == 7) then
                if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE) == QUEST_AVAILABLE) then
                    player:startEvent(142);
                elseif (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 3) then
                    player:startEvent(143);
                end
            end
        end
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 65) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,dsp.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN);
        player:addMission(COP,dsp.mission.id.cop.THE_ROAD_FORKS); -- THE_ROAD_FORKS -- global mission 3.3
        -- We can't have more than 1 current mission at the time, so we keep The road forks as current mission
        -- progress are recorded in the following two variables
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",1); -- MEMORIES_OF_A_MAIDEN--3-3B: Windurst Road
        player:setVar("EMERALD_WATERS_Status",1); -- EMERALD_WATERS-- 3-3A: San d'Oria Road
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    elseif (csid == 10047) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,dsp.mission.id.cop.FOR_WHOM_THE_VERSE_IS_SUNG);
        player:addMission(COP,dsp.mission.id.cop.A_PLACE_TO_RETURN);
    elseif (csid == 10048) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 10051) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 122) then
        player:setVar("PromathiaStatus",4);
        player:setVar("COP_3-taru_story",0);
        player:setVar("COP_shikarees_story",0);
        player:setVar("COP_louverance_story",0);
        player:setVar("COP_tenzen_story",0);
        player:setVar("COP_jabbos_story",0);
    elseif (csid == 10094) then
        if (option == 1) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2184);
            else
                player:completeMission(TOAU,EASTERLY_WINDS);
                player:addMission(TOAU,WESTERLY_WINDS);
                player:setVar("AhtUrganStatus", 0);
                player:addItem(2184,10);
                player:messageSpecial(ID.text.ITEM_OBTAINED,2184);
            end
        else
            player:completeMission(TOAU,EASTERLY_WINDS);
            player:addMission(TOAU,WESTERLY_WINDS);
            player:setVar("AhtUrganStatus", 0);
        end
    elseif (csid == 10097) then
        player:completeMission(TOAU,ALLIED_RUMBLINGS);
        player:needToZone(true);
        player:setVar("TOAUM40_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,UNRAVELING_REASON);
    elseif (csid == 142) then
        player:addQuest(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE);
    elseif (csid == 143) then
        player:completeQuest(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE);
        player:setVar('StormsOfFate',0);
    end
end;
