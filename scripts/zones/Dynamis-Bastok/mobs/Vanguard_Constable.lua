-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Constable
-----------------------------------

require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if (mob:getID() == 17539304 and alreadyReceived(killer,5) == false) then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,16);
	end

end;