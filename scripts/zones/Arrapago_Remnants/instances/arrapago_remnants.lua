-----------------------------------
-- 
-- Salvage: Arrapago Remnants
-- 
-----------------------------------

require("scripts/globals/instance")

package.loaded["scripts/zones/Arrapago_Remnants/IDs"] = nil;
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Arrapago.text.TIME_TO_COMPLETE, instance:getTimeLimit());
    player:messageSpecial(Arrapago.text.SALVAGE_START, 1);
    player:addStatusEffectEx(EFFECT_ENCUMBRANCE_I, EFFECT_ENCUMBRANCE_I, 0xFFFF, 0, 0)
    player:addStatusEffectEx(EFFECT_OBLIVISCENCE, EFFECT_OBLIVISCENCE, 0, 0, 0)
    player:addStatusEffectEx(EFFECT_OMERTA, EFFECT_OMERTA, 0, 0, 0)
    player:addStatusEffectEx(EFFECT_IMPAIRMENT, EFFECT_IMPAIRMENT, 0, 0, 0)
    player:addStatusEffectEx(EFFECT_DEBILITATION, EFFECT_DEBILITATION, 0x1FF, 0, 0)
    for i = 0,15 do
        player:unequipItem(i)
    end
end;    

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)

    for i,v in pairs(Arrapago.npcs[1][1]) do
        local npc = instance:getEntity(bit.band(v, 0xFFF), TYPE_NPC);
        npc:setStatus(STATUS_NORMAL)
    end
    instance:setStage(1)
    
end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Arrapago.text)
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Arrapago.text.MISSION_FAILED,10,10);
        v:startEvent(0x66);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)

    if instance:getStage() == 1 and progress == 10 then
        SpawnMob(Arrapago.mobs[1][2].rampart, instance)
    elseif instance:getStage() == 3 and progress == 0 then
        SpawnMob(Arrapago.mobs[2].astrologer, instance)
    end
    
end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)
end;

function onRegionEnter(player,region)
    if region:GetRegionID() <= 10 then
        player:startEvent(199 + region:GetRegionID())
    end
end

function onEventUpdate(entity, eventid, result)
    if (eventid >= 200 and eventid <= 203) then
        local instance = entity:getInstance()
        if instance:getProgress() == 0 then
            for id = Arrapago.mobs[2][eventid-199].mobs_start, Arrapago.mobs[2][eventid-199].mobs_end do
                SpawnMob(id, instance)
            end
            instance:setProgress(eventid-199)
        end
    elseif eventid == 204 then
        -- spawn floor 3
    end
end

function onEventFinish(entity, eventid, result)
    local instance = entity:getInstance()
    if (eventid >= 200 and eventid <= 203) then
        for id = Arrapago.mobs[1][2].mobs_start, Arrapago.mobs[1][2].mobs_end do
            DespawnMob(id, instance)
        end
        DespawnMob(Arrapago.mobs[1][2].rampart, instance)
        DespawnMob(Arrapago.mobs[1][2].sabotender, instance)
    elseif eventid == 204 then
        for _,v in ipairs(Arrapago.mobs[2]) do
            for id = v.mobs_start, v.mobs_end do
                DespawnMob(id, instance)
            end
        end
        DespawnMob(Arrapago.mobs[2].astrologer, instance)
    end
end
