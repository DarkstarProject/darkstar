-----------------------------------
--     Game Table
--     Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    player:startEvent(10073);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;