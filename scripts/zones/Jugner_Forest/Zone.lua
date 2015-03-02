-----------------------------------
--
-- Zone: Jugner_Forest (104)
--
-----------------------------------
package.loaded[ "scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest/TextIDs");
require("scripts/globals/zone");
require("scripts/globals/icanheararainbow");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17203883,17203884};

    zone:registerRegion(1, -484, 10, 292, 0, 0, 0); -- Sets Mark for "Under Oath" Quest cutscene.

    SetFieldManual(manuals);

    -- Fraelissa
    SetRespawnTime(17203447, 900, 10800);

    SetRegionalConquestOverseers(zone:getRegionID());
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 342, -5, 15.117, 169);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x000f;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
    if (region:GetRegionID() == 1) then
        if (player:getVar("UnderOathCS") == 7) then -- Quest: Under Oath - PLD AF3
            player:startEvent(0x000E);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000f) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000f) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x000E) then
        player:setVar("UnderOathCS",8); -- Quest: Under Oath - PLD AF3
    end
end;