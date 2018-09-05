-----------------------------------
--
-- Zone: Ghelsba_Outpost (140)
--
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Ghelsba_Outpost/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(125.852,-22.097,180.403,128)
    end
    return cs
end

function afterZoneIn (player)
    if player:hasStatusEffect(dsp.effect.LEVEL_RESTRICTION) then
        local effect = player:getStatusEffect(dsp.effect.LEVEL_RESTRICTION)
        player:delStatusEffect(dsp.effect.LEVEL_RESTRICTION)
        player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION,effect:getPower(),0,0)
    end
end

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers()
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE)
    end
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end