-----------------------------------
-- Ancient Flames Beckon
-- Spire of Dem mission battlefield
-----------------------------------
local ID = require("scripts/zones/Spire_of_Dem/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/teleports")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

local function otherLights(player)
    return (player:hasKeyItem(dsp.ki.LIGHT_OF_MEA)   and 1 or 0) +
           (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) and 1 or 0)
end

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = 1 + otherLights(player)
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        local teleportTo = dsp.teleport.id.EXITPROMDEM
        local ki = dsp.ki.LIGHT_OF_DEM

        -- first promyvion completed
        if player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS then
            player:completeMission(COP, dsp.mission.id.cop.BELOW_THE_ARKS)
            player:addMission(COP, dsp.mission.id.cop.THE_MOTHERCRYSTALS)
            player:setCharVar("cspromy2", 1)
            player:setCharVar("PromathiaStatus", 0)
            player:addKeyItem(ki)
            player:messageSpecial(ID.text.CANT_REMEMBER, ki)

        elseif player:getCurrentMission(COP) == dsp.mission.id.cop.THE_MOTHERCRYSTALS and not player:hasKeyItem(ki) then

            -- second promyvion completed
            if otherLights(player) < 2 then
                player:setCharVar("cspromy3", 1)
                player:addKeyItem(ki)
                player:messageSpecial(ID.text.CANT_REMEMBER, ki)

            -- final promyvion completed
            else
                player:completeMission(COP, dsp.mission.id.cop.THE_MOTHERCRYSTALS)
                player:setCharVar("PromathiaStatus", 0)
                player:addMission(COP, dsp.mission.id.cop.AN_INVITATION_WEST)
                player:addKeyItem(ki)
                player:messageSpecial(ID.text.CANT_REMEMBER, ki)
                teleportTo = dsp.teleport.id.LUFAISE
            end
        end

        player:addExp(1500)
        player:addStatusEffectEx(dsp.effect.TELEPORT, 0, teleportTo, 0, 1)
    end
end
