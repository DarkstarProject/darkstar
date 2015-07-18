-----------------------------------
--
-- Zone: RuLude_Gardens (243)
--
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/missions");

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
            cs = 0x7534;
        end
        player:setVar("PlayerMainJob",0);
    end

    if (player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 2) then
           cs = 0x273F;
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

    if (regionID==1 and player:getCurrentMission(COP) ==A_VESSEL_WITHOUT_A_CAPTAIN and player:getVar("PromathiaStatus")==1) then
        player:startEvent(0x0041,player:getNation());
    elseif (regionID==1 and player:getCurrentMission(COP) ==A_PLACE_TO_RETURN and player:getVar("PromathiaStatus")==0) then
        player:startEvent(0x2740);
    elseif (regionID==1 and player:getCurrentMission(COP) ==FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus")==2) then
        player:startEvent(0x2743);
    elseif (regionID==1 and player:getCurrentMission(COP) == DAWN ) then
        if (player:getVar("COP_3-taru_story") == 2 and player:getVar("COP_shikarees_story") == 1 and player:getVar("COP_louverance_story") == 3 and player:getVar("COP_tenzen_story") == 1 and player:getVar("COP_jabbos_story") == 1) then
            player:startEvent(0x007A);
        end
    elseif(player:getCurrentMission(TOAU) == EASTERLY_WINDS)then
        player:startEvent(0x276E);
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
    if (csid == 0x0041) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,A_VESSEL_WITHOUT_A_CAPTAIN);
        player:addMission(COP,THE_ROAD_FORKS); -- THE_ROAD_FORKS -- global mission 3.3
        -- We can't have more than 1 current mission at the time , so we keep The road forks as current mission
        -- progress are recorded in the following two variables
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",1); -- MEMORIES_OF_A_MAIDEN--3-3B: Windurst Road
        player:setVar("EMERALD_WATERS_Status",1); -- EMERALD_WATERS-- 3-3A: San d'Oria Road
    elseif (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 0x273F) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,FOR_WHOM_THE_VERSE_IS_SUNG);
        player:addMission(COP,A_PLACE_TO_RETURN);
    elseif (csid == 0x2740) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 0x2743) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 0x007A) then
        player:setVar("PromathiaStatus",4);
        player:setVar("COP_3-taru_story",0);
        player:setVar("COP_shikarees_story",0);
        player:setVar("COP_louverance_story",0);
        player:setVar("COP_tenzen_story",0);
        player:setVar("COP_jabbos_story",0);
    elseif(csid == 0x276E) then
        if(option ==1)then
            if(player:getFreeSlotsCount() == 0) then 
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
		player:completeMission(TOAU,EASTERLY_WINDS);
		player:addMission(TOAU,WESTERLY_WINDS);
	    else
                player:addItem(2184,10);
                player:messageSpecial(ITEM_OBTAINED,2184);
                player:completeMission(TOAU,EASTERLY_WINDS);
                player:addMission(TOAU,WESTERLY_WINDS);
	    end
        else
            player:completeMission(TOAU,EASTERLY_WINDS);
            player:addMission(TOAU,WESTERLY_WINDS);
        end
    end
end;