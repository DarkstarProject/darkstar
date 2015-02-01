-----------------------------------------
--	ID: 6171
--	Item: Copy of Dark Deeds
--	Description: A guide to the finer
--	points of insidious dark magic, as
--	compiled by Azima. Proceeds from this
--	tome have gone to fund her various
--	purchases dealing with alchemical
--	research. Adventurers note that
--	reading it increases one's dark
--	magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_DRK) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_DRK,amount);
end;