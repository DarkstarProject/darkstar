-----------------------------------
-- Area: Carpenters' Landing
-- NPC:  Cryptonberry_Executor
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
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
	if (killer:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and killer:getVar("Cryptonberry_Executor_KILL") == 0) then
		killer:setVar("Cryptonberry_Executor_KILL",1);
	end
end;
