-----------------------------------
-- Area: Kazham
--  NPC: Mijeh Sholpoilo
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("BathedInScent") == 1) then
        player:startEvent(168); -- scent from Blue Rafflesias
    else
        player:startEvent(63);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
