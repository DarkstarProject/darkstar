-----------------------------------
-- Area: Sacrarium
--  NPC: _0s9 (Wooden Gate)
-- !pos 20.000 0.500 19.500 28
-----------------------------------

function onTrigger(player,npc)

    if (player:getZPos() > 20) then
        player:messageSpecial(CANNOT_OPEN_SIDE);
    elseif (player:getZPos() < 20) then
        player:startEvent(106);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;