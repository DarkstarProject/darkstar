-----------------------------------
--
-- Zone: Spire_of_Vahzl (23)
--
-----------------------------------
package.loaded["scripts/zones/Spire_of_Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Spire_of_Vahzl/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-0.039,-2.049,293.640,64); -- Floor 1 {R}
    end
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==7) then
        cs = 20;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 20) then
        player:setVar("PromathiaStatus",8);
    end

end;
