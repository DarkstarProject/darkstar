-----------------------------------
-- Area: al'taieu
-- NPC:  Ru_aern
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/missions");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if(killer:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and killer:getVar("PromathiaStatus")>1)then


		switch (mob:getID()) : caseof {
		--tower 1
		[16912829] = function (x) 
		killer:setVar("Ru_aern_1-1KILL",1);
		end,
		[16912830] = function (x) 
		killer:setVar("Ru_aern_1-2KILL",1);

		end,
		[16912831] = function (x) 
        killer:setVar("Ru_aern_1-3KILL",1);
		end,
		
		--tower 2
		[16912832] = function (x) 
        killer:setVar("Ru_aern_2-1KILL",1);
		end,
		[16912833] = function (x) 
        killer:setVar("Ru_aern_2-2KILL",1);
		end,
		[16912834] = function (x) 
	    killer:setVar("Ru_aern_2-3KILL",1);	       
		end,
		
		
		--tower 2
		[16912835] = function (x) 
         killer:setVar("Ru_aern_3-1KILL",1);
		end,
		[16912836] = function (x) 
         killer:setVar("Ru_aern_3-2KILL",1);
		end,
		[16912837] = function (x) 
        killer:setVar("Ru_aern_3-3KILL",1);
		end,			
	}

	
		if(killer:getVar("Ru_aern_1-1KILL")==1 and killer:getVar("Ru_aern_1-2KILL")==1 and killer:getVar("Ru_aern_1-3KILL")==1)then
			killer:setVar("PromathiaStatus",3);
		elseif(killer:getVar("Ru_aern_2-1KILL")==1 and killer:getVar("Ru_aern_2-2KILL")==1 and killer:getVar("Ru_aern_2-3KILL")==1)then
			killer:setVar("PromathiaStatus",5);
		elseif(killer:getVar("Ru_aern_3-1KILL")==1 and killer:getVar("Ru_aern_3-2KILL")==1 and killer:getVar("Ru_aern_3-3KILL")==1)then
			killer:setVar("PromathiaStatus",7);
		end	 
	end	
end;