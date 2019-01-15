-----------------------------------
-- Area: Port Bastok
--  NPC: Drawbridge
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)
    local bridge = GetNPCByID(npc:getID() - 2)
    local upperDoor = GetNPCByID(npc:getID() - 1)

    bridge:updateToEntireZone(dsp.status.NORMAL, dsp.animation.OPEN_DOOR, true)

    --Events for when the airship arrives
    npc:addPeriodicTrigger(0, 360, 4, 0, false)
    npc:addPeriodicTrigger(1, 360, 8, 0, false)
    
    --Events for when the airship departs
    npc:addPeriodicTrigger(2, 360, 80, 0, false)
    npc:addPeriodicTrigger(3, 360, 84, 0, false)

    --Events for when the drawbridge has finished closing
    npc:addPeriodicTrigger(4, 360, 12, 0, false)
    npc:addPeriodicTrigger(5, 360, 88, 0, false)
end;

function onTimeTrigger(npc, triggerID)
--npc is the moghouse-side door to the bridge
    local upperDoor = GetNPCByID(npc:getID() - 1)
    local bridge = GetNPCByID(npc:getID() - 2)

    if npc == nil or upperDoor == nil or bridge == nil then
        error("Drawbridge NPC failure")
        return
    end

    if (triggerID == 0 or triggerID == 2) then
        --drawbridge needs to open        
        local players = npc:getZone():getPlayers()

        --If a player is on the bridge, kick them off
        for _, player in pairs(players) do
            if player:getPlayerRegionInZone() == 2 then
                player:startEvent(70)
            end
        end
        
        bridge:updateToEntireZone(dsp.status.NORMAL, dsp.animation.CLOSE_DOOR, true)
        upperDoor:setAnimation(dsp.animation.CLOSE_DOOR)
        npc:setAnimation(dsp.animation.CLOSE_DOOR)

    elseif (triggerID == 1 or triggerID == 3) then
        --drawbridge needs to close
        bridge:updateToEntireZone(dsp.status.NORMAL, dsp.animation.OPEN_DOOR, true)
        
    elseif (triggerID == 4 or triggerID == 5) then
        --drawbridge has finished closing, reopen entry to walkers
        upperDoor:setAnimation(dsp.animation.OPEN_DOOR)
        npc:setAnimation(dsp.animation.OPEN_DOOR)
    end

end
