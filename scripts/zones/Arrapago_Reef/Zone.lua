-----------------------------------
--
-- Zone: Arrapago_Reef (54)
--
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/settings");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-462,-4,-420,-455,-1,-392);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-180.028,-10.335,-559.987,182);
    end
    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN) and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(8);
    end
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
    if (csid == 8) then
        player:setVar("AhtUrganStatus",1);
        player:delKeyItem(EPHRAMADIAN_GOLD_COIN);
        player:startEvent(34,1,1,1,1,1,1,1,1);
    elseif (csid == 34 and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(35);
    end
end;