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
    local manuals = {17195678,17195679};

    SetFieldManual(manuals);
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
    elseif(player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1)then	
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
        player:addFame( BASTOK, AF2_FAME);
        player:completeQuest( BASTOK,DARK_PUPPET);
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