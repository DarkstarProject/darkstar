-----------------------------------
--
-- Zone: Windurst_Waters_[S] (94)
--
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");

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
    -- MOG HOUSE EXIT
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        position = math.random(1,5) + 157;
        player:setPos(position,-5,-62,192);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 0x7534;
        end
        player:setVar("PlayerMainJob",0);
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
end;