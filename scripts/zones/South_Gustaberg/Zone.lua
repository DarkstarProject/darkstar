-----------------------------------
--
-- Zone: South_Gustaberg (107)
--
-----------------------------------
package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/icanheararainbow");
require("scripts/zones/South_Gustaberg/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17216200,17216201};

    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-601.433,35.204,-520.031,1);
    end

    if (player:getCurrentMission(COP) == THE_CALL_OF_THE_WYRMKING and player:getVar("VowsDone") == 1) then
        cs= 0x038A;
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0385;
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
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0385) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x038A) then
        if (player:getCurrentMission(COP) == A_TRANSIENT_DREAM) then
            player:completeMission(COP,A_TRANSIENT_DREAM);
            player:addMission(COP,THE_CALL_OF_THE_WYRMKING);
        end
        player:setVar("VowsDone",0);
    elseif (csid == 0x0385) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;