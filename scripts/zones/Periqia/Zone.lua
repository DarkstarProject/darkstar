-----------------------------------
--
-- Zone: Periqia
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Periqia/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    local pos = player:getPos();

    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        player:setPos(player:getInstance():getEntryPos());
    end

    player:addTempItem(5346);

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
    if (csid == 0x66) then
        player:setPos(0,0,0,0,79);
    end
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceLoadFailed()
    return 79;
end;