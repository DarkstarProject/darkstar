-----------------------------------
--
-- Zone: Hazhalm_Testing_Grounds (78)
--
-----------------------------------
package.loaded["scripts/zones/Hazhalm_Testing_Grounds/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/zones/Hazhalm_Testing_Grounds/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(652.174,-272.632,-104.92,148);
    end

    if (player:getCurrentMission(TOAU) == GAZE_OF_THE_SABOTEUR and player:getVar("AhtUrganStatus") == 0) then
        cs = 6;
    end

    return cs;
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
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 6) then
        player:setVar("AhtUrganStatus",1);
    end
end;
