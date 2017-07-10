-----------------------------------
--
-- Zone: La_Theine_Plateau (102)
--
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/zone");
require("scripts/globals/icanheararainbow");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/weather");
require("scripts/globals/chocobo_digging");

fallenEggPositions = {
        [1] = {211.000, 24.000, 257.000},
        [2] = {228.000, 25.000, 249.000},
        [3] = {221.000, 24.000, 252.000},
        [4] = {202.000, 23.000, 243.000},
        [5] = {185.000, 21.000, 243.000},
        [6] = {165.000, 16.000, 247.000},
        [7] = {335.000, 40.000, 268.000},
        [8] = {336.000, 40.000, 266.000},
        [9] = {348.000, 40.000, 274.000},
        [10] = {360.000, 40.000, 269.000},
        [11] = {352.000, 40.000, 258.000},
        [12] = {341.000, 40.000, 254.000},
        [13] = {213.000, 24.000, 282.000},
        [14] = {202.000, 24.000, 286.000},
        [15] = {190.000, 23.000, 291.000},
        [16] = {193.000, 24.000, 305.000},
        [17] = {183.000, 23.000, 309.000},
        [18] = {179.000, 23.000, 336.000},
        [19] = {201.000, 24.000, 348.000},
        [20] = {162.000, 24.000, 321.000},
        [21] = {159.000, 22.000, 310.000},
        [22] = {159.000, 17.000, 291.000},
        [23] = {554.000, 24.000, 90.000},
        [24] = {576.000, 24.000, 82.000},
        [25] = {582.000, 23.000, 97.000},
        [26] = {570.000, 23.000, 124.000},
        [27] = {580.000, 23.000, 140.000},
        [28] = {603.000, 23.000, 156.000},
        [29] = {620.000, 24.000, 166.000},
        [30] = {629.000, 26.000, 142.000},
        [31] = {656.000, 30.000, 131.000},
        [32] = {651.000, 31.000, 113.000},
        [33] = {657.000, 31.000, 93.000},
        [34] = {668.000, 31.000, 90.000},
        [35] = {693.000, 30.000, 70.000},
        [36] = {708.000, 30.000, 133.000},
        [37] = {630.000, 24.000, 179.000},
        [38] = {595.000, 24.000, 177.000},
        [39] = {571.000, 24.000, 157.000},
        [40] = {579.000, 40.000, -444.000},
        [41] = {594.000, 40.000, -404.000},
        [42] = {602.000, 40.000, -411.000},
        [43] = {615.000, 39.000, -393.000},
        [44] = {615.000, 37.000, -382.000},
        [45] = {606.000, 39.000, -374.000},
        [46] = {629.000, 40.000, -406.000},
        [47] = {631.000, 40.000, -425.000},
        [48] = {631.000, 40.000, -442.000},
        [49] = {626.000, 40.000, -463.000},
        [50] = {636.000, 40.000, -470.000},
        [51] = {602.000, 40.000, -485.000},
        [52] = {599.000, 40.000, -521.000},
        [53] = {601.000, 40.000, -508.000},
        [54] = {560.000, 24.000, -321.000},
        [55] = {570.000, 26.000, -330.000},
        [56] = {560.000, 24.000, -334.000},
        [57] = {563.000, 24.000, -347.000},
        [58] = {553.000, 24.000, -351.000},
        [59] = {537.000, 24.000, -357.000},
        [60] = {533.000, 25.000, -368.000},
        [61] = {546.000, 25.000, -365.000},
        [62] = {519.000, 24.000, -361.000}
}

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 688, 153, DIGREQ_NONE },
                    { 17396, 155, DIGREQ_NONE },
                    { 17296, 134, DIGREQ_NONE },
                    { 641, 103, DIGREQ_NONE },
                    { 840, 56, DIGREQ_NONE },
                    { 642, 49, DIGREQ_NONE },
                    { 696, 57, DIGREQ_NONE },
                    { 694, 40, DIGREQ_NONE },
                    { 622, 28, DIGREQ_NONE },
                    { 700, 3, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 4545, 34, DIGREQ_BURROW },
                    { 636, 20, DIGREQ_BURROW },
                    { 616, 8, DIGREQ_BURROW },
                    { 5235, 2, DIGREQ_BURROW },
                    { 2364, 139, DIGREQ_BORE },
                    { 2235, 44, DIGREQ_BORE },
                    { 617, 6, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 1237, 12, DIGREQ_MODIFIER },
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
    local fallenEgg = GetNPCByID(17195583);
    local newPosition = npcUtil.pickNewPosition(fallenEgg:getID(), fallenEggPositions);

    fallenEgg:setPos(newPosition.x, newPosition.y, newPosition.z);
end;


-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -272.118, 21.715, 98.859, 243);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x007b;
    elseif ( prevZone == 193 and player:getVar( "darkPuppetCS") == 5 and player:getFreeSlotsCount() >= 1) then
        cs = 0x007a;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x007d;
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
    if (csid == 0x007b) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x007d) then
        player:updateEvent(0,0,0,0,0,2);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x007b) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x007a) then
        player:addItem( 14096);
        player:messageSpecial( ITEM_OBTAINED, 14096); -- Chaos Sollerets
        player:setVar( "darkPuppetCS", 0);
        player:addFame(BASTOK, AF2_FAME);
        player:completeQuest(BASTOK,DARK_PUPPET);
    end
end;

-----------------------------------
-- onZoneWeatherChange
-----------------------------------

function onZoneWeatherChange(weather)
    local _2u0 = GetNPCByID(17195607);
    local VanadielTOTD = VanadielTOTD();
    local I_Can_Hear_a_Rainbow = GetServerVariable("I_Can_Hear_a_Rainbow");

    if (I_Can_Hear_a_Rainbow == 1 and weather ~= WEATHER_RAIN and VanadielTOTD >= TIME_DAWN and VanadielTOTD <= TIME_EVENING and _2u0:getAnimation() == 9) then
        _2u0:setAnimation(8);
    elseif (I_Can_Hear_a_Rainbow == 1 and weather == WEATHER_RAIN and _2u0:getAnimation() == 8) then
        _2u0:setAnimation(9);
        SetServerVariable("I_Can_Hear_a_Rainbow", 0);
    end
end;

-----------------------------------
-- onTOTDChange
-----------------------------------

function onTOTDChange(TOTD)
    local _2u0 = GetNPCByID(17195607);
    local I_Can_Hear_a_Rainbow = GetServerVariable("I_Can_Hear_a_Rainbow");

    if (I_Can_Hear_a_Rainbow == 1 and TOTD >= TIME_DAWN and TOTD <= TIME_EVENING and _2u0:getAnimation() == 9) then
        _2u0:setAnimation(8);
    elseif (I_Can_Hear_a_Rainbow == 1 and TOTD < TIME_DAWN or TOTD > TIME_EVENING and _2u0:getAnimation() == 8) then
        _2u0:setAnimation(9);
        SetServerVariable("I_Can_Hear_a_Rainbow", 0);
    end
end;
