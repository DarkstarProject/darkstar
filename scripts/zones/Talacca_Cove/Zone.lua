-----------------------------------
--
-- Zone: Talacca_Cove (57)
--
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Talacca_Cove/TextIDs");

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

    if (player:getCurrentMission(TOAU) == TESTING_THE_WATERS and player:getVar("AhtUrganStatus") == 1) then
        player:setPos(-88.879,-7.318,-109.233,173);
        cs = 106;
    elseif (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(64.007,-9.281,-99.988,88);
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

    if (csid == 106) then
        player:completeMission(TOAU,TESTING_THE_WATERS);
        player:delKeyItem(EPHRAMADIAN_GOLD_COIN);
        player:addKeyItem(PERCIPIENT_EYE);
        player:messageSpecial(KEYITEM_OBTAINED,PERCIPIENT_EYE);
        player:setTitle(TREASURE_TROVE_TENDER);
        player:setVar("AhtUrganStatus", 0);
        player:addMission(TOAU,LEGACY_OF_THE_LOST);
    end
end;
