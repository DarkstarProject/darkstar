-----------------------------------
--
-- Zone: The_Sanctuary_of_ZiTah (121)
--
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 688, 117, DIGREQ_NONE },
                    { 17296, 150, DIGREQ_NONE },
                    { 880, 100, DIGREQ_NONE },
                    { 833, 83, DIGREQ_NONE },
                    { 696, 100, DIGREQ_NONE },
                    { 690, 33, DIGREQ_NONE },
                    { 772, 17, DIGREQ_NONE },
                    { 773, 33, DIGREQ_NONE },
                    { 4386, 9, DIGREQ_NONE },
                    { 703, 7, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },
                    { 4097, 100, DIGREQ_NONE },
                    { 4098, 100, DIGREQ_NONE },
                    { 4099, 100, DIGREQ_NONE },
                    { 4100, 100, DIGREQ_NONE },
                    { 4101, 100, DIGREQ_NONE },
                    { 4102, 100, DIGREQ_NONE },
                    { 4103, 100, DIGREQ_NONE },
                    { 1255, 10, DIGREQ_NONE },
                    { 1256, 10, DIGREQ_NONE },
                    { 1257, 10, DIGREQ_NONE },
                    { 1258, 10, DIGREQ_NONE },
                    { 1259, 10, DIGREQ_NONE },
                    { 1260, 10, DIGREQ_NONE },
                    { 1261, 10, DIGREQ_NONE },
                    { 1262, 10, DIGREQ_NONE },
                    { 656, 117, DIGREQ_BURROW },
                    { 750, 133, DIGREQ_BURROW },
                    { 749, 117, DIGREQ_BURROW },
                    { 748, 8, DIGREQ_BURROW },
                    { 751, 14, DIGREQ_BURROW },
                    { 720, 1, DIGREQ_BURROW },
                    { 699, 9, DIGREQ_BORE },
                    { 720, 1, DIGREQ_BORE },
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

    -- Let's get the weather of the zone

    local weather = player:getWeather();

    if (weather ~= nil) then
      if (weather >= 0 and weather <= 4) then
        zoneWeather = "WEATHER_NONE";
      elseif (weather > 4 and weather % 2 ~= 0) then -- If the weather is 5, 7, 9, 11, 13, 15, 17 or 19, checking for odd values
        zoneWeather = "WEATHER_DOUBLE";
      else
        zoneWeather = "WEATHER_SINGLE";
      end
    else
      zoneWeather = "WEATHER_NONE";
    end
    
    return chocoboDig(player, itemMap, precheck, messageArray, zoneWeather);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17273417,17273418};

    SetFieldManual(manuals);

    local Noble_Mold = 17273278;
    GetMobByID(Noble_Mold):setLocalVar("ToD",os.time() + math.random((43200), (57600)));

    SetRegionalConquestOverseers(zone:getRegionID())
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
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(539.901, 3.379, -580.218, 126);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0002;
    end

    return cs;
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

    if (csid == 0x0002) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0002) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;