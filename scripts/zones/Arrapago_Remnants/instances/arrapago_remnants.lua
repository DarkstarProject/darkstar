-----------------------------------
--
-- Salvage: Arrapago Remnants
--
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
    player:messageSpecial(ID.text.SALVAGE_START, 1)
    player:addStatusEffectEx(dsp.effect.ENCUMBRANCE_I, dsp.effect.ENCUMBRANCE_I, 0xFFFF, 0, 0)
    player:addStatusEffectEx(dsp.effect.OBLIVISCENCE, dsp.effect.OBLIVISCENCE, 0, 0, 0)
    player:addStatusEffectEx(dsp.effect.OMERTA, dsp.effect.OMERTA, 0, 0, 0)
    player:addStatusEffectEx(dsp.effect.IMPAIRMENT, dsp.effect.IMPAIRMENT, 0, 0, 0)
    player:addStatusEffectEx(dsp.effect.DEBILITATION, dsp.effect.DEBILITATION, 0x1FF, 0, 0)
    for i = 0,15 do
        player:unequipItem(i)
    end
end

function onInstanceCreated(instance)

    for i,v in pairs(ID.npc[1][1]) do
        local npc = instance:getEntity(bit.band(v, 0xFFF), dsp.objType.NPC)
        npc:setStatus(dsp.status.NORMAL)
    end
    instance:setStage(1)

end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)

    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED,10,10)
        v:startEvent(1)
    end
end

function onInstanceProgressUpdate(instance, progress)

    if instance:getStage() == 1 and progress == 10 then
        SpawnMob(ID.mob[1][2].rampart, instance)
    elseif instance:getStage() == 3 and progress == 0 then
        SpawnMob(ID.mob[2].astrologer, instance)
    end

end

function onInstanceComplete(instance)
end

function onRegionEnter(player,region)
    if region:GetRegionID() <= 10 then
        player:startEvent(199 + region:GetRegionID())
    end
end

function onEventUpdate(entity, eventid, result)
    if (eventid >= 200 and eventid <= 203) then
        local instance = entity:getInstance()
        if instance:getProgress() == 0 then
            for id = ID.mob[2][eventid-199].mobs_start, ID.mob[2][eventid-199].mobs_end do
                SpawnMob(id, instance)
            end
            instance:setProgress(eventid-199)
        end
    elseif eventid == 204 then
        -- spawn floor 3
    end
end

function onEventFinish(player, eventid, result)
    local instance = player:getInstance()
    if eventid >= 200 and eventid <= 210 and result == 1 then
        local ALIGN = player:getAlliance()
        local POS = player:getPos()
        if ALIGN ~= nil then
            for i,v in ipairs(ALIGN) do
                if v:getID() ~= player:getID() then
                    v:startEvent(3)
                    v:timer(4000, function(player)
                    v:setPos(POS.x, POS.y, POS.z, POS.rot)
                end)
                end
            end
        end
    end
    if (eventid >= 200 and eventid <= 203) then
        for id = ID.mob[1][2].mobs_start, ID.mob[1][2].mobs_end do
            DespawnMob(id, instance)
        end
        DespawnMob(ID.mob[1][2].rampart, instance)
        DespawnMob(ID.mob[1][2].sabotender, instance)
    elseif eventid == 204 then
        for _,v in ipairs(ID.mob[2]) do
            for id = v.mobs_start, v.mobs_end do
                DespawnMob(id, instance)
            end
        end
        DespawnMob(ID.mob[2].astrologer, instance)
    end
end
