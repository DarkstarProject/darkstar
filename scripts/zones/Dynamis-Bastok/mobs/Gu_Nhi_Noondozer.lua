-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Nhi Noondozer
-- Time Extender: 30min
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

	if (alreadyReceived(killer,4) == false) then
		killer:addTimeToDynamis(30);
		addDynamisList(killer,8);
	end

end;