-----------------------------------
--
-- Zone: La_Theine_Plateau (102)
--
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
require("scripts/zones/La_Theine_Plateau/globals");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/globals/chocobo")
require("scripts/globals/weather");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/zone")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    LA_THEINE_PLATEAU.moveFallenEgg();
    dsp.chocobo.initZone(zone)
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -272.118, 21.715, 98.859, 243);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 123;
    elseif (prevZone == dsp.zone.ORDELLES_CAVES and player:getVar("darkPuppetCS") == 5 and player:getFreeSlotsCount() >= 1) then
        cs = 122;
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getVar("MissionStatus") ==1) then
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
        npcUtil.completeQuest(player, BASTOK, dsp.quest.id.bastok.DARK_PUPPET, {item=14096, fame=AF2_FAME, var="darkPuppetCS"}); -- Chaos Sollerets
    end
end;

function onZoneWeatherChange(weather)
    local rainbow = GetNPCByID(ID.npc.RAINBOW);
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
    local rainbow = GetNPCByID(ID.npc.RAINBOW);
    local I_Can_Hear_a_Rainbow = GetServerVariable("I_Can_Hear_a_Rainbow");

    if (I_Can_Hear_a_Rainbow == 1 and TOTD >= dsp.time.DAWN and TOTD <= dsp.time.EVENING and rainbow:getAnimation() == dsp.anim.CLOSE_DOOR) then
        rainbow:setAnimation(dsp.anim.OPEN_DOOR);
    elseif (I_Can_Hear_a_Rainbow == 1 and TOTD < dsp.time.DAWN or TOTD > dsp.time.EVENING and rainbow:getAnimation() == dsp.anim.OPEN_DOOR) then
        rainbow:setAnimation(dsp.anim.CLOSE_DOOR);
        SetServerVariable("I_Can_Hear_a_Rainbow", 0);
    end
end;
