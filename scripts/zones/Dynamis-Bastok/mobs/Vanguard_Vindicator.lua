-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Vindicator
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

	if (mob:getID() == 17539300 and alreadyReceived(killer,7) == false) then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,64);
	end

end;