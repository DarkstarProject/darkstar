-----------------------------------
--  Area: Riverne Site #A01
--  NPC:  Spacial Displacement
-----------------------------------

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    local id = npc:getID();
    local base = 16900334; -- (First Spacial Displacement in NPC_LIST)

    if (id == base) then 
        player:startEvent(2);
    elseif (id == base+1) then 
        player:startEvent(3);
    elseif (id == base+2) then 
        player:startEvent(4);
    elseif (id - base <= 39) then
        player:startEvent(id - base);
    end;
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 35 and option == 1) then
        player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
    elseif (csid == 10 and option == 1) then
        player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
    end;
    
end;