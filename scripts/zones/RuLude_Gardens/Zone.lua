-----------------------------------
--
-- Zone: RuLude_Gardens (243)
--
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/quests");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-4,-2,40,4,3,50);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

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

    if (player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 2) then
        cs = 10047;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    
    local regionID = region:GetRegionID();
    -- printf("regionID: %u",regionID);
    
    if (regionID == 1) then
        if (player:getCurrentMission(COP) == A_VESSEL_WITHOUT_A_CAPTAIN and player:getVar("PromathiaStatus") == 1) then
            player:startEvent(65,player:getNation());
        elseif (player:getCurrentMission(COP) == A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 0) then
            player:startEvent(10048);
        elseif (player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(10051);
        elseif (player:getCurrentMission(COP) == DAWN) then
            if (player:getVar("COP_3-taru_story") == 2 and player:getVar("COP_shikarees_story") == 1 and player:getVar("COP_louverance_story") == 3
            and player:getVar("COP_tenzen_story") == 1 and player:getVar("COP_jabbos_story") == 1) then
                player:startEvent(122);
            elseif (player:getVar("PromathiaStatus") == 7) then
                if (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_AVAILABLE) then
                    player:startEvent(142);
                elseif (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 3) then
                    player:startEvent(143);
                end
            end
        elseif (player:getCurrentMission(TOAU) == EASTERLY_WINDS and player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(10094);
        end
    end
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
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
    if (csid == 65) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,A_VESSEL_WITHOUT_A_CAPTAIN);
        player:addMission(COP,THE_ROAD_FORKS); -- THE_ROAD_FORKS -- global mission 3.3
        -- We can't have more than 1 current mission at the time, so we keep The road forks as current mission
        -- progress are recorded in the following two variables
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",1); -- MEMORIES_OF_A_MAIDEN--3-3B: Windurst Road
        player:setVar("EMERALD_WATERS_Status",1); -- EMERALD_WATERS-- 3-3A: San d'Oria Road
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 10047) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,FOR_WHOM_THE_VERSE_IS_SUNG);
        player:addMission(COP,A_PLACE_TO_RETURN);
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
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
            else
                player:completeMission(TOAU,EASTERLY_WINDS);
                player:addMission(TOAU,WESTERLY_WINDS);
                player:setVar("AhtUrganStatus", 0);
                player:addItem(2184,10);
                player:messageSpecial(ITEM_OBTAINED,2184);
            end
        else
            player:completeMission(TOAU,EASTERLY_WINDS);
            player:addMission(TOAU,WESTERLY_WINDS);
            player:setVar("AhtUrganStatus", 0);
        end
    elseif (csid == 142) then
        player:addQuest(JEUNO,STORMS_OF_FATE);
    elseif (csid == 143) then
        player:completeQuest(JEUNO,STORMS_OF_FATE);
        player:setVar('StormsOfFate',0);
    end
end;
