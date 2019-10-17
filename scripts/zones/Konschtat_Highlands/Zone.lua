-----------------------------------
--
-- Zone: Konschtat_Highlands (108)
--
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/chocobo")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end

function onZoneIn( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(521.922, 28.361, 747.85, 45)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 104
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 106
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 104 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 106 then
        if player:getZPos() > 855 then
            player:updateEvent(0, 0, 0, 0, 0, 2)
        elseif player:getXPos() > 32 and player:getXPos() < 370 then
            player:updateEvent(0, 0, 0, 0, 0, 1)
        end
    end
end

function onEventFinish( player, csid, option)
    if csid == 104 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end

function onGameHour(zone)
    local hour = VanadielHour()

    if hour < 5 or hour >= 17 then
        local phase = VanadielMoonPhase()
        local haty = GetMobByID(ID.mob.HATY)
        local vran = GetMobByID(ID.mob.BENDIGEIT_VRAN)
        local time = os.time()

        if phase >= 90 and not haty:isSpawned() and time > haty:getLocalVar("cooldown") then
            SpawnMob(ID.mob.HATY)
        elseif phase <= 10 and not vran:isSpawned() and time > vran:getLocalVar("cooldown") then
            SpawnMob(ID.mob.BENDIGEIT_VRAN)
        end
    end
end
