-----------------------------------
-- Area: FeiYin
-- MOB:  Clockwork Pod
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	-- Curses, Foiled A-Golem!?
	if (killer:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
		killer:delKeyItem(SHANTOTTOS_NEW_SPELL);
		killer:addKeyItem(SHANTOTTOS_EXSPELL);
	end

end;