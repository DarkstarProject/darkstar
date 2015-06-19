-----------------------------------
-- Area: Outer Horutoto Ruins
-- MOB:  Queen of Coins
-----------------------------------

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	if(killer:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and killer:getVar("MissionStatus") == 4 and GetMobAction(17572201) == 0) then
		killer:setVar("MissionStatus",5)
	end
end;