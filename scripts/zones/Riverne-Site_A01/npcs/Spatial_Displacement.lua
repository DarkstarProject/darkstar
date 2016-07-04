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
        player:startEvent(0x2);
    elseif (id == base+1) then 
        player:startEvent(0x3);
    elseif (id == base+2) then 
        player:startEvent(0x4);
    elseif (id == base+7) then 
        player:startEvent(0x7);
    elseif (id == base+8) then 
        player:startEvent(0x8);
    elseif (id == base+9) then 
        player:startEvent(0x9);
    elseif (id == base+10) then 
        player:startEvent(0x0A);
    elseif (id == base+11) then 
        player:startEvent(0xB);
    elseif (id == base+12) then 
        player:startEvent(0xC);
    elseif (id == base+13) then 
        player:startEvent(0xD);
    elseif (id == base+14) then 
        player:startEvent(0xE);
    elseif (id == base+15) then 
        player:startEvent(0xF);
    elseif (id == base+16) then 
        player:startEvent(0x10);
    elseif (id == base+18) then 
        player:startEvent(0x12);
    elseif (id == base+20) then 
        player:startEvent(0x14);
    elseif (id == base+21) then 
        player:startEvent(0x15);
    elseif (id == base+22) then 
        player:startEvent(0x16);
    elseif (id == base+23) then 
        player:startEvent(0x17);
    elseif (id == base+24) then 
        player:startEvent(0x18);
    elseif (id == base+25) then 
        player:startEvent(0x19);
    elseif (id == base+26) then 
        player:startEvent(0x1A);
    elseif (id == base+27) then 
        player:startEvent(0x1b);
    elseif (id == base+28) then 
        player:startEvent(0x1C);
    elseif (id == base+29) then 
        player:startEvent(0x1d);
    elseif (id == base+30) then 
        player:startEvent(0x1E);
    elseif (id == base+31) then 
        player:startEvent(0x1F);
    elseif (id == base+33) then 
        player:startEvent(0x21);
    elseif (id == base+34) then 
        player:startEvent(0x22);
    elseif (id == base+35) then 
        player:startEvent(0x23);
    elseif (id == base+36) then 
        player:startEvent(0x24);
    elseif (id == base+37) then 
        player:startEvent(0x25);
    elseif (id == base+38) then 
        player:startEvent(0x26);
    elseif (id == base+39) then 
        player:startEvent(0x27);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x23 and option == 1) then
        player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
    elseif (csid == 0x0A and option == 1) then
        player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
    end;
    
end;