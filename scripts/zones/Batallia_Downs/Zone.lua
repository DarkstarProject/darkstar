-----------------------------------
--
-- Zone: Batallia_Downs (105)
--
-----------------------------------
package.loaded[ "scripts/zones/Batallia_Downs/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require( "scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/zone");
require( "scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 847, 69, DIGREQ_NONE },
                    { 880, 137, DIGREQ_NONE },
                    { 845, 4, DIGREQ_NONE },
                    { 640, 82, DIGREQ_NONE },
                    { 768, 133, DIGREQ_NONE },
                    { 643, 82, DIGREQ_NONE },
                    { 17296, 137, DIGREQ_NONE },
                    { 774, 26, DIGREQ_NONE },
                    { 106, 69, DIGREQ_NONE },
                    { 4449, 3, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 656, 106, DIGREQ_BURROW },
                    { 748, 8, DIGREQ_BURROW },
                    { 749, 30, DIGREQ_BURROW },
                    { 750, 136, DIGREQ_BURROW },
                    { 1237, 30, DIGREQ_BORE },
                    { 2235, 60, DIGREQ_BORE },
                    { 2364, 150, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Ahtu
    SetRespawnTime(17207657, 900, 10800);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -693.609, -14.583, 173.59, 30);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0385;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x0387;
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
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0385) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0385) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x0387) then
        if (player:getZPos() >  -331) then
            player:updateEvent(0,0,0,0,0,3);
        else
            player:updateEvent(0,0,0,0,0,2);
        end
    end
end;