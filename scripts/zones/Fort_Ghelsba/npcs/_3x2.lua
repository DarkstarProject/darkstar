-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Lever (upper)
-- !pos  8.112 -52.665 96.084 141
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Animate lever
    npc:openDoor(1)

    -- Animate lever's Gear
    if GetNPCByID(npc:getID()+2):getAnimation() == 8 then
        GetNPCByID(npc:getID()+2):setAnimation(9)
    else
        GetNPCByID(npc:getID()+2):setAnimation(8)
    end

    -- Animate bigWinch
    if GetNPCByID(npc:getID()-2):getAnimation() == 8 then
        GetNPCByID(npc:getID()-2):setAnimation(9)
    else
        GetNPCByID(npc:getID()-2):setAnimation(8)
    end

    -- Move platform
    RunElevator(dsp.elevator.FORT_GHELSBA_LIFT)
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
