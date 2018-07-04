-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Lever (lower)
-- !pos  -0.652 -28.996 100.445 141
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- local vars to reduce repeat calls..
    local lever = npc:getID()
    local gear = GetNPCByID(lever +2)
    local bigWinch = GetNPCByID(lever -1)

    -- Animate lever
    npc:openDoor(1)

    -- Animate lever's Gear - do not use openDoor() / closeDoor() here!
    if gear:getAnimation() == dsp.animation.OPEN_DOOR then
        gear:setAnimation(dsp.animation.CLOSE_DOOR)
    else
        gear:setAnimation(dsp.animation.OPEN_DOOR)
    end

    -- Animate bigWinch - do not use openDoor() / closeDoor() here!
    if bigWinch:getAnimation() == dsp.animation.OPEN_DOOR then
        bigWinch:setAnimation(dsp.animation.CLOSE_DOOR)
    else
        bigWinch:setAnimation(dsp.animation.OPEN_DOOR)
    end

    -- Move platform
    RunElevator(dsp.elevator.FORT_GHELSBA_LIFT)
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
