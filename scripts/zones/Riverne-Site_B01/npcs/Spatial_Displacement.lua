-----------------------------------
-- Area: Riverne Site #B01
-- NPC:  Spacial Displacement
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

    local base = 16896183; -- First Spacial Displacement in NPC_LIST
    local id = npc:getID();

    if (id == base) then --  L-9 porter
        player:startEvent(2);
    elseif (id == base+1) then --  L-8 porter
        player:startEvent(3);
    elseif (id == base+2) then --  K-8 porter
        player:startEvent(4);
    elseif (id == base+3) then --  J-7 porter (SE corner)
        player:startEvent(5);
    elseif (id == base+4) then -- I-8 porter
        player:startEvent(6);
    elseif (id == base+6) then --  G-9 porter (to Boroka)
        player:startEvent(8);
    elseif (id == base+7) then --  M-9 porter (west)
        player:startEvent(9);
    elseif (id == base+8) then --  M-9 porter (back to Misareaux Coast)
        player:startEvent(10);
    elseif (id == base+9) then --  M-8 porter
        player:startEvent(11);
    elseif (id == base+10) then --  L-7 porter (east)
        player:startEvent(12);
    elseif (id == base+11) then --  L-7 porter (nw corner)
        player:startEvent(13);
    elseif (id == base+12) then --  J-6 porter
        player:startEvent(14);
    elseif (id == base+13) then --  K-6 porter
        player:startEvent(15);
    elseif (id == base+14) then --  K-7 porter (SE)
        player:startEvent(16);    
    elseif (id == base+15) then --  K-7 porter (NW)
        player:startEvent(17);
    elseif (id == base+16) then --  J-7 porter (ne corner)
        player:startEvent(18);
    elseif (id == base+17) then --  J-7 porter (center)
        player:startEvent(19);
    elseif (id == base+18) then --  J-7 porter (nw corner)
        player:startEvent(20);
    elseif (id == base+19) then --  I-7 porter (north)
        player:startEvent(21);
    elseif (id == base+21) then --  I-7 porter (NW)
        player:startEvent(23);
    elseif (id == base+22) then --  I-7 porter (SW)
        player:startEvent(24);
    elseif (id == base+23) then -- I-7 porter (south)
        player:startEvent(25);
    elseif (id == base+24) then --  G-7 porter (ne corner)
        player:startEvent(26);
    elseif (id == base+25) then -- F-6 porter (east)
        player:startEvent(27);
    elseif (id == base+26) then --  G-7 porter (east)
        player:startEvent(28);
    elseif (id == base+27) then -- F-8 porter (Boroka Island)
        player:startEvent(29);
    elseif (id == base+28) then -- F-6 porter (west)
        player:startEvent(30);
    elseif (id == base+29) then -- E-7 porter (east) 
        player:startEvent(31);
    elseif (id == base+30) then -- E-8 porter (north)
        player:startEvent(20);
    elseif (id == base+31) then -- E-8 porter (middle, to Monarch Linn) --_STOP
        player:startEvent(21);
    elseif (id == base+34) then -- E-7 porter (west)
        player:startEvent(23);
     elseif (id == base+35) then -- D-6 porter (exit from Bahamut Island)
        player:startEvent(23);
    elseif (id == base+36) then -- E-7 porter (SW)
        player:startEvent(24);
    elseif (id == base+37) then -- D-8 porter (north)
        player:startEvent(25);
    elseif (id == base+39) then -- C-9 porter (NE)
        player:startEvent(27);
    elseif (id == base+40) then -- C-9 porter (SE)
        player:startEvent(28);
    elseif (id == base+41) then -- D-10 porter (Monument)
        player:startEvent(29);
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
    
    if (csid == 21 and option == 1) then
        player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
    elseif (csid == 10 and option == 1) then
        player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
    elseif (csid == 17 and option == 0) then -- Go! Go! Gobmuffin quest checks will have to be added here. Mobs are not currently spawning (db issue I think)
--        loc = Zone(29);
--        loc:spawnMob("ChemicalCookCh",227, 88, 842,33,nil); -- pop positions are not authentic.
--        loc:spawnMob("BookBrowserBok",224, 88, 837,33,nil);
--        loc:spawnMob("SpellSpitterSp",274, 89, 830,250,nil);
    end;
end;