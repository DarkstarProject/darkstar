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
    return tpz.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    tpz.conq.setRegionalConquestOverseers(zone:getRegionID())

    tpz.helm.initZone(zone, tpz.helm.type.HARVESTING)
    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)

    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onGameDay()
    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
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
