-----------------------------------
-- Area: Valkurm Dunes
-- Mob:  Doman
-- Involved in Quest: Yomi Okuri
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	if (killer:hasKeyItem(YOMOTSU_HIRASAKA)) then
		killer:setVar("OkuriNMKilled",killer:getVar("OkuriNMKilled") + 1);
	end

end;