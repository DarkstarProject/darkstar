-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Fortitude
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, npc)

	local npc = GetNPCByID(16921027);
    local qm1p = math.random(1,5); -- random for next @pos.
         -- print(qm1p)
	            if (qm1p == 1) then
                        npc:setPos(-420,0.00,755); -- spawn point 1 "Hume"
						--printf("Qm1 is at pos 1");
                elseif (qm1p == 2) then
                        npc:setPos(-43,0.00,460); -- spawn point 2 "Elvaan"
						--printf("Qm1 is at pos 2");
                elseif (qm1p == 3) then
                        npc:setPos(-260,0.00,44.821); -- spawn point 3 "Galka"
						--printf("Qm1 is at pos 3");
                elseif (qm1p == 4) then
                        npc:setPos(-580,0.00,43); -- spawn point 4 "Taru"
						--printf("Qm1 is at pos 4");
                elseif (qm1p == 5) then
                        npc:setPos(-796,0.00,460); -- spawn point 5 "Mithra"
						--printf("Qm1 is at pos 5");
				end
end;	
-----------------------------------		
-- onGameHour		
-----------------------------------		  

function onGameHour(npc, mob, player)
	 
	
end;
