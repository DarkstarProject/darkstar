-----------------------------------
-- Area: Port Bastok
--  NPC: Rafaela
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

player:startEvent(22);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

PastPerfectVar = player:getVar("PastPerfectVar");

    if (csid == 22 and PastPerfectVar == 1) then
        player:setVar("PastPerfectVar",2);
    end

end;
