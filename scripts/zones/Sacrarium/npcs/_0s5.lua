-----------------------------------
-- Area: Sacrarium
--  NPC: _0s5 (Wooden Gate)
-- !pos 100.000 -3.500 -97.370 28
-----------------------------------

function onTrigger(player,npc)
    if (npc:getAnimation() == 9) then
        npc:openDoor();
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;