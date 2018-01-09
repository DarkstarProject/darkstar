-----------------------------------
--
-- Zone: RuAun_Gardens (130)
--
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/conquest");
require("scripts/globals/status");
require("scripts/globals/titles");

function onInitialize(zone)
    for k, v in pairs(RUAUN_PORTALS) do
        zone:registerRegion(k,unpack(v["coords"]));
    end

    UpdateTreasureSpawnPoint(RUAUN_TREASURE_COFFER);

    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(333.017,-44.896,-458.35,164);
    end
    if (player:getCurrentMission(ZILART) == THE_GATE_OF_THE_GODS and player:getVar("ZilartStatus") == 1) then
        cs = 51;
    end

    return cs;
end;

function onRegionEnter(player,region)
    local p = RUAUN_PORTALS[region:GetRegionID()];

    if (p["green"] ~= nil) then -- green portal
        if (player:getVar("skyShortcut") == 1) then
            player:startEvent(42);
        else
            title = player:getTitle();
            if (title == WARRIOR_OF_THE_CRYSTAL) then
                player:startEvent(41,title);
            else
                player:startEvent(43,title);
            end
        end

    elseif (p["portal"] ~= nil) then -- blue portal
        if (GetNPCByID(p["portal"]):getAnimation() == ANIMATION_OPEN_DOOR) then
            player:startEvent(p["event"]);
        end

    elseif (type(p["event"]) == "table") then -- portal with random destination
        local events = p["event"];
        player:startEvent(events[math.random(#events)]);

    else -- portal with static destination
        player:startEvent(p["event"]);
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 41 and option ~= 0) then
        player:setVar("skyShortcut",1);
    elseif (csid == 51) then
        player:setVar("ZilartStatus",0);
        player:completeMission(ZILART,THE_GATE_OF_THE_GODS);
        player:addMission(ZILART,ARK_ANGELS);
    end
end;
