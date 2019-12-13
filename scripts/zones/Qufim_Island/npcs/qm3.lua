-----------------------------------
-- Area: Qufim Island
--  NPC: ??? (qm3)
-- Mission: ACP - The Echo Awakens
-- !pos -120.342 -19.471 306.661 126
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
    -- Trade Seedspall's Lux, Luna, Astrum
    if player:getCurrentMission(ACP) == dsp.mission.id.acp.THE_ECHO_AWAKENS and npcUtil.tradeHas(trade, {2740, 2741, 2742}) then
        player:startEvent(31)
    end
end

function onTrigger(player, npc)
    local missionACP = player:getCurrentMission(ACP)
    local now = tonumber(os.date("%j"))
    local SR = player:hasKeyItem(dsp.ki.SEEDSPALL_ROSEUM)
    local SC = player:hasKeyItem(dsp.ki.SEEDSPALL_CAERULUM)
    local SV = player:hasKeyItem(dsp.ki.SEEDSPALL_VIRIDIS)
    local amberKey = player:hasKeyItem(dsp.ki.AMBER_KEY)
    local lastAmber = player:getCharVar("LastAmberKey") -- When last Amber key was obtained
    local lastViridian = player:getCharVar("LastViridianKey") -- When last Viridian key was obtained

    if ENABLE_ACP == 1 and not player:hasKeyItem(dsp.ki.AMBER_KEY) then
        if missionACP == dsp.mission.id.acp.GATHERER_OF_LIGHT_I and SR and SC and SV and now ~= lastViridian then
            player:startEvent(32)
        elseif missionACP == dsp.mission.id.acp.GATHERER_OF_LIGHT_II and player:getCharVar("SEED_MANDY") == 0 then
            -- Spawn Seed mandragora's
            player:setCharVar("SEED_MANDY", 1) -- This will need moved into Seed mandies onDeath script later.
            player:PrintToPlayer( "Confrontation Battles are not working yet." )
            -- dsp.effect.CONFRONTATION for 30 min
        elseif missionACP == dsp.mission.id.acp.GATHERER_OF_LIGHT_II and player:getCharVar("SEED_MANDY") == 1 then -- change SEED_MANDY var number later when battle actually works (intended purpose is to track number of slain mandies).
            player:setCharVar("SEED_MANDY", 0)
            player:startEvent(34)
        -- elseif missionACP >= dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I and not amberKey and now ~= lastAmber and now ~= lastViridian and SR and SC and SV and player:getCharVar("SEED_MANDY") == 0) then
            -- This is for repeats to get amber keys.
            -- Spawn Seed mandragora's with dsp.effect.CONFRONTATION for 30 min
        -- elseif SR and SC and SV and missionACP >= dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I and player:getCharVar("SEED_MANDY") == 1 then
            -- npcUtil.giveKeyItem(player, dsp.ki.AMBER_KEY)
            -- player:setCharVar("LastAmberKey", os.date("%j"))
            -- player:setCharVar("SEED_MANDY", 0)
            -- player:delKeyItem(dsp.ki.SEEDSPALL_ROSEUM)
            -- player:delKeyItem(dsp.ki.SEEDSPALL_CAERULUM)
            -- player:delKeyItem(dsp.ki.SEEDSPALL_VIRIDIS)
        else
            -- Todo: find retail message (if any) and text its ID
        end
    else
        -- Todo: find retail message (if any) and text its ID
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 31 then
        player:completeMission(ACP, dsp.mission.id.acp.THE_ECHO_AWAKENS)
        player:addMission(ACP, dsp.mission.id.acp.GATHERER_OF_LIGHT_I)
        player:confirmTrade()
    elseif csid == 32 then
        player:completeMission(ACP, dsp.mission.id.acp.GATHERER_OF_LIGHT_I)
        player:addMission(ACP, dsp.mission.id.acp.GATHERER_OF_LIGHT_II)
        player:delKeyItem(dsp.ki.SEEDSPALL_ROSEUM)
        player:delKeyItem(dsp.ki.SEEDSPALL_CAERULUM)
        player:delKeyItem(dsp.ki.SEEDSPALL_VIRIDIS)
    elseif csid == 34 then
        player:completeMission(ACP, dsp.mission.id.acp.GATHERER_OF_LIGHT_II)
        player:addMission(ACP, dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_I)
    end
end