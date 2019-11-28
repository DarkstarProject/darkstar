-----------------------------------
--
-- Zone: Ifrits_Cauldron (205)
--
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.ASH_DRAGON)
    GetMobByID(ID.mob.ASH_DRAGON):setRespawnTime(math.random(900, 10800))

    dsp.treasure.initZone(zone)
    dsp.helm.initZone(zone, dsp.helm.type.MINING)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-60.296, 48.884, 105.967, 69)
    end

    return cs
end

function onRegionEnter(player, region)
end

function onGameHour(zone)
    -- Opens flame spouts every 3 hours Vana'diel time. Doors are offset from spouts by 5.
    if VanadielHour() % 3 == 0 then
        for i = 5, 8 do
            GetNPCByID(ID.npc.FLAME_SPOUT_OFFSET + i):openDoor(90)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
