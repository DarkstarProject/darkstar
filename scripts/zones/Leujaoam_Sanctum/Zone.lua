-----------------------------------
--
-- Zone: Leujaoam_Sanctum
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Leujaoam_Sanctum/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onInstanceZoneIn
-----------------------------------

function onInstanceZoneIn(player,instance)
    local cs = -1;

    local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos();
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot);
    end

    player:addTempItem(5343);
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