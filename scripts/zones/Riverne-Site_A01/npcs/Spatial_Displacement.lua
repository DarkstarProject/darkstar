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
    elseif (id == base+7) then 
        player:startEvent(7);
    elseif (id == base+8) then 
        player:startEvent(8);
    elseif (id == base+9) then 
        player:startEvent(9);
    elseif (id == base+10) then 
        player:startEvent(10);
    elseif (id == base+11) then 
        player:startEvent(11);
    elseif (id == base+12) then 
        player:startEvent(12);
    elseif (id == base+13) then 
        player:startEvent(13);
    elseif (id == base+14) then 
        player:startEvent(14);
    elseif (id == base+15) then 
        player:startEvent(15);
    elseif (id == base+16) then 
        player:startEvent(16);
    elseif (id == base+18) then 
        player:startEvent(18);
    elseif (id == base+20) then 
        player:startEvent(20);
    elseif (id == base+21) then 
        player:startEvent(21);
    elseif (id == base+22) then 
        player:startEvent(22);
    elseif (id == base+23) then 
        player:startEvent(23);
    elseif (id == base+24) then 
        player:startEvent(24);
    elseif (id == base+25) then 
        player:startEvent(25);
    elseif (id == base+26) then 
        player:startEvent(26);
    elseif (id == base+27) then 
        player:startEvent(27);
    elseif (id == base+28) then 
        player:startEvent(28);
    elseif (id == base+29) then 
        player:startEvent(29);
    elseif (id == base+30) then 
        player:startEvent(30);
    elseif (id == base+31) then 
        player:startEvent(31);
    elseif (id == base+33) then 
        player:startEvent(21);
    elseif (id == base+34) then 
        player:startEvent(22);
    elseif (id == base+35) then 
        player:startEvent(23);
    elseif (id == base+36) then 
        player:startEvent(24);
    elseif (id == base+37) then 
        player:startEvent(25);
    elseif (id == base+38) then 
        player:startEvent(26);
    elseif (id == base+39) then 
        player:startEvent(27);
    end
    
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
    
    if (csid == 23 and option == 1) then
        player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
    elseif (csid == 10 and option == 1) then
        player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
    end;
    
end;