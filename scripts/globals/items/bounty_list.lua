-----------------------------------------
--	ID: 6170
--	Item: Bounty List
--	Description: A simple list of known
--	criminals who are better off dead.
--	Every single name is crossed out in
--	Azima's handwriting. Adventurers note
--	that reading it increases one's
--	elemental magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_ELE) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_ELE,amount);
end;