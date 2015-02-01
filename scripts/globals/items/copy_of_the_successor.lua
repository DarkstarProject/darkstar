-----------------------------------------
--	ID: 6164
--	Item: Copy of The Successor
--	Description: An essay authored by
--	Cerane I Virgaut, mainly concerning
--	the night Perseus bequeathed unto her
--	an exemplary shield. Adventurers note
--	that reading it increases one's
--	shield skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_SHL) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_SHL,amount);
end;