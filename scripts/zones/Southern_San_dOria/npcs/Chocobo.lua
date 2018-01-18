-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Chocobo
-- Chocobo 
-----------------------------------
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--        player:startEvent(601); 
--        player:startEvent(820) --crazy hang
--        player:startEvent(821) --crazy hang
--        player:startEvent(600)
--        player:startEvent(599) 
--        player:startEvent(862) -- cool choco debug menu
--        player:startEvent(819) 
        player:startEvent(818)
    end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

end;