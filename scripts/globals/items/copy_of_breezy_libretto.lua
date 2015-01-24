-----------------------------------------
--	ID: 6172
--	Item: Copy of Breezy Libretto
--	Description: A musical score composed
--	by Lewenhart. Its notes symbolize a
--	fragrant, early morning summer
--	breeze. Adventurers note that reading
--	it increases one's singing skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_SNG) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_SNG,amount);
end;