-----------------------------------
--
-- Zone: Promyvion-Mea (20)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Mea/TextIDs"] = nil;
package.loaded["scripts/zones/Promyvion-Mea/MobIDs"] = nil;
----------------------------------
require("scripts/zones/Promyvion-Mea/TextIDs");
require("scripts/zones/Promyvion-Mea/MobIDs");
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
        player:setPos(-93.268, 0, 170.749, 162); -- Floor 1 {R}
    end

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
        player:completeMission(COP,BELOW_THE_ARKS);
        player:addMission(COP,THE_MOTHERCRYSTALS); -- start mission 1.3
        player:setVar("PromathiaStatus",0);
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then
        if (player:hasKeyItem(LIGHT_OF_HOLLA) and player:hasKeyItem(LIGHT_OF_DEM)) then
            if (player:getVar("cslastpromy") == 1) then
                player:setVar("cslastpromy",0)
                cs = 52;
            end
        elseif (player:hasKeyItem(LIGHT_OF_HOLLA) or player:hasKeyItem(LIGHT_OF_DEM)) then
            if (player:getVar("cs2ndpromy") == 1) then
                player:setVar("cs2ndpromy",0)
                cs = 51;
            end
        end
    end

    if (player:getVar("FirstPromyvionMea") == 1) then
        cs = 50;
    end

     return cs;
end;

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0); -- LV30 cap
    end
end;

function onRegionEnter(player,region)
    if (player:getAnimation() == 0) then
        local regionId = region:GetRegionID();
        local event = nil;
        if (regionId < 100) then
            event = MEMORY_STREAMS[regionId][7][1];
        else
            local stream = GetNPCByID(regionId);
            if (stream ~= nil and stream:getAnimation() == ANIMATION_OPEN_DOOR) then
                event = stream:getLocalVar("destination");
                if (event == nil or event == 0) then -- this should never happen, but sanity check
                    event = MEMORY_STREAMS[regionId][7][1];
                end
            end
        end
        if (event ~= nil) then
            player:startEvent(event);
        end
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,region)
end;

function onEventFinish(player,csid,option)
    if (csid == 46 and option == 1) then
        player:setPos(279.988, -86.459, -25.994, 63, 14); -- To Hall of Transferance {R}
    elseif (csid == 50) then
        player:setVar("FirstPromyvionMea",0);
    end
end;
