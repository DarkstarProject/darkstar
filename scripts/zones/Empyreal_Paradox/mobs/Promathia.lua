-----------------------------------
-- Area: Empyreal Paradox
-- NPC:  Promathia
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target) 
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	

		switch (mob:getID()) : caseof {
		[16924673] = function (x) --Promathia V1 -1
         killer:setPos(-508, -120, 544, 83);
		 killer:startEvent(0x07D04);
	     SpawnMob(16924674); --spawn Promathia V2 -1
		end,
		[16924675] = function (x) --Promathia V1 -2
         killer:setPos(533,-1,542,91);
		  killer:startEvent(0x07D04);
		 SpawnMob(16924676); --spawn Promathia V2 2
		end,
		[16924677] = function (x) --Promathia V1 -2
         killer:setPos(-506,120,-495,87);
		  killer:startEvent(0x07D04);
		 SpawnMob(16924678); --spawn Promathia V2 3
		end,
	}

end;



