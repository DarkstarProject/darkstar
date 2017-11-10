-----------------------------------
--
-- Zone: Promyvion-Vahzl (22)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
package.loaded["scripts/zones/Promyvion-Vahzl/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/status");

function onInitialize(zone)
    for k, v in pairs(MEMORY_STREAMS) do
        zone:registerRegion(k,v[1],v[2],v[3],v[4],v[5],v[6]);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-14.744,0.036,-119.736,1); -- To Floor 1 {R}
    end

    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==0) then
        cs = 50;
    end
    return cs;
end;

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0); -- LV50 cap
    end
end;

function onRegionEnter(player,region)
    if (player:getAnimation() == 0) then
        local regionId = region:GetRegionID();
        local events = MEMORY_STREAMS[regionId][7];
        local event = events[math.random(#events)];
        if (regionId < 100 or GetNPCByID(regionId):getAnimation() == ANIMATION_OPEN_DOOR) then
            player:startEvent(event);
        end
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 50) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 45 and option == 1) then
        player:setPos(-379.947, 48.045, 334.059, 192, 9); -- To Pso'Xja {R}
    end
end;
