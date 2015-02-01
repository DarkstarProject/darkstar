-----------------------------------------
--	ID: 6153
--	Item: Copy of Ludwig's Report
--	Description: A report made by Ludwig
--	Eichberg regarding the Battle of
--	Grauberg. It details the constant
--	changes in the position of the front
--	line and the withdrawal of Republic
--	troops. Adventurers note that reading
--	it increases one's scythe skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_SYH) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_SYH,amount);
end;