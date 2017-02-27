-----------------------------------
--
-- Zone: Navukgo_Execution_Chamber (64)
--
-----------------------------------
package.loaded["scripts/zones/Navukgo_Execution_Chamber/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/zones/Navukgo_Execution_Chamber/TextIDs");

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
        player:setPos(-660.185,-12.079,-199.532,192);
    end

    if (player:getCurrentMission(TOAU) == SHIELD_OF_DIPLOMACY and player:getVar("AhtUrganStatus") == 0) then
        cs = 1;
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

    if (csid == 1) then
        player:setVar("AhtUrganStatus",1);
    end
end;
