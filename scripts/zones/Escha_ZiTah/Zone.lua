-----------------------------------
--
-- Zone: Escha - Zi'Tah (288)
--
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Escha_ZiTah/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        -- player:setPos(x, y, z, rot);
    end

    return cs;
end;
-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;