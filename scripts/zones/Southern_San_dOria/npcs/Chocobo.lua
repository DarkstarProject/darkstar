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
--        player:startEvent(0x0259); 
--        player:startEvent(0x0334) --crazy hang
--        player:startEvent(0x0335) --crazy hang
--        player:startEvent(0x0258)
--        player:startEvent(0x0257) 
--        player:startEvent(0x035e) -- cool choco debug menu
--        player:startEvent(0x0333) 
        player:startEvent(0x0332)
    end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

end;