-----------------------------------
--
-- Zone: Oldton_Movalpolos (11)
--
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/treasure")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
    dsp.treasure.initZone(zone)
    dsp.helm.initZone(zone, dsp.helm.type.MINING)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local currentday = tonumber(os.date("%j"))
    local louverancePath = player:getCharVar("COP_Louverance_s_Path")
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(70.956, 5.99, 139.843, 134)
    end

    if player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and (louverancePath == 3 or louverancePath == 4) then
        cs = 1
    elseif player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("PromathiaStatus") == 3 and player:getCharVar("Promathia_kill_day") ~= currentday and player:getCharVar("COP_jabbos_story") == 0 then
        cs = 57
    end

    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 1 then
        player:setCharVar("COP_Louverance_s_Path", 5)
    elseif csid == 57 then
        player:setCharVar("COP_jabbos_story", 1)
    end
end
