-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Faith
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
	
	-- local qm3 = GetNPCByID(16921029);
    -- qm3:hideNPC(900);
	-- local qm3p = math.random(1,5); -- random for next @pos.
          -- print(qm3p)
	           -- if (qm3p == 1) then
                      --  qm3:setPos(-420,0.00,157); -- spawn point 1 "Hume"
						--printf("Qm3 is at pos 1, jailer death");
                --elseif (qm3p == 2) then
                        --qm3:setPos(-157,0.00,-340); -- spawn point 2 "Elvaan"
						--printf("Qm3 is at pos 2, jailer death");
                --elseif (qm3p == 3) then
                        --qm3:setPos(-260,0.00,-643); -- spawn point 3 "Galka"
						--printf("Qm3 is at pos 3, jailer death");
                --elseif (qm3p == 4) then
                        --qm3:setPos(-580,0.00,-642); -- spawn point 4 "Taru"
						--printf("Qm3 is at pos 4, jailer death");
                --elseif (qm3p == 5) then
                        --qm3:setPos(-682,0.00,-340); -- spawn point 5 "Mithra"
						--printf("Qm3 is at pos 5, jailer death");
				--end
end;	
-----------------------------------		
-- onGameHour		
-----------------------------------		  

function onGameHour(npc, mob, player)
	 
	
end;
