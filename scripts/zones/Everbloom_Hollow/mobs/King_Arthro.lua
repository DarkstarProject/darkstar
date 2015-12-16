-----------------------------------
-- Area: BCNM
-- NPC:  King Arthro
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;
-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob, target)

end;
    
        
-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob, target)
    
	-- Instant cast on spells - Waterga IV, Poisonga II, Drown, and Enwater
	local rnd = math.random();
	
	if (rnd < 0.2) then
		return 202; -- Waterga IV
	elseif (rnd < 0.6) then
		return 226; -- Poisonga II
	elseif (rnd < 0.8) then
		return 240; -- Drown
	else
		return 105; -- Enwater
	end
    
end;

-----------------------------------
-- onMobSkill
-----------------------------------
function onMobSkill(target)

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addItem(4181);
end;
