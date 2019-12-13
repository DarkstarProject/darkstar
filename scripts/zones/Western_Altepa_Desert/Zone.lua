-----------------------------------
--
-- Zone: Western_Altepa_Desert (125)
--
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/weather")
require("scripts/globals/zone")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.KING_VINEGARROON)
    GetMobByID(ID.mob.KING_VINEGARROON):setRespawnTime(math.random(900, 10800))

    dsp.bmt.updatePeddlestox(dsp.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onGameDay()
    dsp.bmt.updatePeddlestox(dsp.zone.WESTERN_ALTEPA_DESERT, ID.npc.PEDDLESTOX)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-19.901, 13.607, 440.058, 78)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 2
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 2 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    end
end

function onEventFinish(player, csid, option)
    if csid == 2 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end

function onZoneWeatherChange(weather)
    local KV = GetMobByID(ID.mob.KING_VINEGARROON)

    if KV:getCurrentAction() == dsp.act.DESPAWN and (weather == dsp.weather.DUST_STORM or weather == dsp.weather.SAND_STORM) then
        KV:spawn()
    elseif KV:getCurrentAction() == dsp.act.ROAMING and weather ~= dsp.weather.DUST_STORM and weather ~= dsp.weather.SAND_STORM then
        DespawnMob(ID.mob.KING_VINEGARROON)
    end
end
