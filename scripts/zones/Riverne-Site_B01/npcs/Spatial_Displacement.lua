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
		player:startEvent(0x2);
	elseif (id == base+1) then --  L-8 porter
		player:startEvent(0x3);
	elseif (id == base+2) then --  K-8 porter
		player:startEvent(0x4);
	elseif (id == base+3) then --  J-7 porter (SE corner)
		player:startEvent(0x5);
	elseif (id == base+4) then -- I-8 porter
		player:startEvent(0x6);
	elseif (id == base+6) then --  G-9 porter (to Boroka)
		player:startEvent(0x8);
	elseif (id == base+7) then --  M-9 porter (west)
		player:startEvent(0x9);
	elseif (id == base+8) then --  M-9 porter (back to Misareaux Coast)
		player:startEvent(0xA);
	elseif (id == base+9) then --  M-8 porter
		player:startEvent(0xB);
	elseif (id == base+10) then --  L-7 porter (east)
		player:startEvent(0xC);
	elseif (id == base+11) then --  L-7 porter (nw corner)
		player:startEvent(0xD);
	elseif (id == base+12) then --  J-6 porter
		player:startEvent(0xE);
	elseif (id == base+13) then --  K-6 porter
		player:startEvent(0xF);
	elseif (id == base+14) then --  K-7 porter (SE)
		player:startEvent(0x10);	
	elseif (id == base+15) then --  K-7 porter (NW)
		player:startEvent(0x11);
	elseif (id == base+16) then --  J-7 porter (ne corner)
		player:startEvent(0x12);
	elseif (id == base+17) then --  J-7 porter (center)
		player:startEvent(0x13);
	elseif (id == base+18) then --  J-7 porter (nw corner)
		player:startEvent(0x14);
	elseif (id == base+19) then --  I-7 porter (north)
		player:startEvent(0x15);
	elseif (id == base+21) then --  I-7 porter (NW)
		player:startEvent(0x17);
	elseif (id == base+22) then --  I-7 porter (SW)
		player:startEvent(0x18);
	elseif (id == base+23) then -- I-7 porter (south)
		player:startEvent(0x19);
	elseif (id == base+24) then --  G-7 porter (ne corner)
		player:startEvent(0x1A);
	elseif (id == base+25) then -- F-6 porter (east)
		player:startEvent(0x1B);
	elseif (id == base+26) then --  G-7 porter (east)
		player:startEvent(0x1C);
	elseif (id == base+27) then -- F-8 porter (Boroka Island)
		player:startEvent(0x1D);
	elseif (id == base+28) then -- F-6 porter (west)
		player:startEvent(0x1E);
	elseif (id == base+29) then -- E-7 porter (east) 
		player:startEvent(0x1f);
	elseif (id == base+30) then -- E-8 porter (north)
		player:startEvent(0x20);
	elseif (id == base+31) then -- E-8 porter (middle, to Monarch Linn) --_STOP
		player:startEvent(0x21);
	elseif (id == base+34) then -- E-7 porter (west)
		player:startEvent(0x23);
	 elseif (id == base+35) then -- D-6 porter (exit from Bahamut Island)
		player:startEvent(0x23);
	elseif (id == base+36) then -- E-7 porter (SW)
		player:startEvent(0x24);
	elseif (id == base+37) then -- D-8 porter (north)
		player:startEvent(0x25);
	elseif (id == base+39) then -- C-9 porter (NE)
		player:startEvent(0x27);
	elseif (id == base+40) then -- C-9 porter (SE)
		player:startEvent(0x28);
	elseif (id == base+41) then -- D-10 porter (Monument)
		player:startEvent(0x29);
	end;
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
	
	if (csid == 0x21 and option == 1) then
		player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
	elseif (csid == 0xA and option == 1) then
		player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
	elseif (csid == 0x11 and option == 0) then -- Go! Go! Gobmuffin quest checks will have to be added here. Mobs are not currently spawning (db issue I think)
--		loc = Zone(0x1D);
--		loc:spawnMob("ChemicalCookCh",227, 88, 842,33,nil); -- pop positions are not authentic.
--		loc:spawnMob("BookBrowserBok",224, 88, 837,33,nil);
--		loc:spawnMob("SpellSpitterSp",274, 89, 830,250,nil);
	end;
end;