-----------------------------------
--
-- Zone: Promyvion-Dem (18)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Dem/TextIDs");
require("scripts/zones/Promyvion-Dem/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/status");

function onInitialize(zone)
    for k, v in pairs(DEM_MEMORY_STREAMS) do
        zone:registerRegion(k,v[1],v[2],v[3],v[4],v[5],v[6]);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(185.891, 0, -52.331, 128);
    end

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
        player:completeMission(COP,BELOW_THE_ARKS);
        player:addMission(COP,THE_MOTHERCRYSTALS); -- start mission 1.3
        player:setVar("PromathiaStatus",0);
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then
        if (player:hasKeyItem(LIGHT_OF_HOLLA) and player:hasKeyItem(LIGHT_OF_MEA)) then
            if (player:getVar("cslastpromy") == 1) then
                player:setVar("cslastpromy",0)
                cs = 52;
            end
        elseif (player:hasKeyItem(LIGHT_OF_HOLLA) or player:hasKeyItem(LIGHT_OF_MEA)) then
            if (player:getVar("cs2ndpromy") == 1) then
                player:setVar("cs2ndpromy",0)
                cs = 51;
            end
        end
    end

    if (player:getVar("FirstPromyvionDem") == 1) then
        cs = 50;
    end

    return cs;
end;

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(dsp.effects.LEVEL_RESTRICTION,30,0,0); -- LV30 cap
    end
end;

function onRegionEnter(player,region)
    if (player:getAnimation() == 0) then
        local regionId = region:GetRegionID();
        local event = nil;
        if (regionId < 100) then
            event = DEM_MEMORY_STREAMS[regionId][7][1];
        else
            local stream = GetNPCByID(regionId);
            if (stream ~= nil and stream:getAnimation() == ANIMATION_OPEN_DOOR) then
                event = stream:getLocalVar("destination");
                if (event == nil or event == 0) then -- this should never happen, but sanity check
                    event = DEM_MEMORY_STREAMS[regionId][7][1];
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

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 46 and option == 1) then
        player:setPos(-226.193, -46.459, -280.046, 127, 14); -- To Hall of Transference {R}
    elseif (csid == 50) then
        player:setVar("FirstPromyvionDem",0);
    end
end;