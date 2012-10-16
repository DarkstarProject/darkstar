---------------------------------------------
-- Sheep Song
--
--  Dummy script, sleep is broken for mobs
---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 1; -- Returns 1 so this move is not used
end;