-----------------------------------
--
-- Zone: La_Theine_Plateau (102)
--
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/zones/La_Theine_Plateau/globals");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/globals/weather");
require("scripts/globals/quests");
require("scripts/globals/status");
-----------------------------------

function onChocoboDig(player, precheck)
    local itemMap =
    {
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
        { 1255, 10, DIGREQ_NONE }, -- all ores
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
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    LA_THEINE_PLATEAU.moveFallenEgg();
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -272.118, 21.715, 98.859, 243);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 123;
    elseif (prevZone == 193 and player:getVar("darkPuppetCS") == 5 and player:getFreeSlotsCount() >= 1) then
        cs = 122;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 125;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 123) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 125) then
        player:updateEvent(0,0,0,0,0,2);
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 123) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 122) then
        npcUtil.completeQuest(player, BASTOK, DARK_PUPPET, {item=14096, fame=AF2_FAME, var="darkPuppetCS"}); -- Chaos Sollerets
    end
end;

function onZoneWeatherChange(weather)
    local rainbow = GetNPCByID(LA_THEINE_RAINBOW);
    local TOTD = VanadielTOTD();
    local I_Can_Hear_a_Rainbow = GetServerVariable("I_Can_Hear_a_Rainbow");

    if (I_Can_Hear_a_Rainbow == 1 and weather ~= dsp.weather.RAIN and TOTD >= dsp.time.DAWN and TOTD <= dsp.time.EVENING and rainbow:getAnimation() == dsp.anim.CLOSE_DOOR) then
        rainbow:setAnimation(dsp.anim.OPEN_DOOR);
    elseif (I_Can_Hear_a_Rainbow == 1 and weather == dsp.weather.RAIN and rainbow:getAnimation() == dsp.anim.OPEN_DOOR) then
        rainbow:setAnimation(dsp.anim.CLOSE_DOOR);
        SetServerVariable("I_Can_Hear_a_Rainbow", 0);
    end
end;

function onTOTDChange(TOTD)
    local rainbow = GetNPCByID(LA_THEINE_RAINBOW);
    local I_Can_Hear_a_Rainbow = GetServerVariable("I_Can_Hear_a_Rainbow");

    if (I_Can_Hear_a_Rainbow == 1 and TOTD >= dsp.time.DAWN and TOTD <= dsp.time.EVENING and rainbow:getAnimation() == dsp.anim.CLOSE_DOOR) then
        rainbow:setAnimation(dsp.anim.OPEN_DOOR);
    elseif (I_Can_Hear_a_Rainbow == 1 and TOTD < dsp.time.DAWN or TOTD > dsp.time.EVENING and rainbow:getAnimation() == dsp.anim.OPEN_DOOR) then
        rainbow:setAnimation(dsp.anim.CLOSE_DOOR);
        SetServerVariable("I_Can_Hear_a_Rainbow", 0);
    end
end;
