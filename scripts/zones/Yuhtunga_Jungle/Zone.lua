-----------------------------------
--
-- Zone: Yuhtunga_Jungle (123)
--
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/helm")
require("scripts/globals/zone")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())

    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
    dsp.helm.initZone(zone, dsp.helm.type.LOGGING)

    dsp.bmt.updatePeddlestox(dsp.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onGameDay()
    dsp.bmt.updatePeddlestox(dsp.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(116.825, 6.613, 100, 140)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 11
    end

    return cs
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 11 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    end
end

function onEventFinish( player, csid, option)
    if csid == 11 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end
