-----------------------------------
--
-- Zone: Abyssea - Empyreal_Paradox
--
-----------------------------------
package.loaded["scripts/zones/Abyssea-Empyreal_Paradox/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        --player:setPos(-495,0,483,205); -- BC Area
        player:setPos(540,-500,-565,64);
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;