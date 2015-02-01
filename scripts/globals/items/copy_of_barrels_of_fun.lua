-----------------------------------------
--	ID: 6160
--	Item: Copy of Barrels of Fun
--	Description: An educational text
--	authored by Elivira Gogol. It
--	discusses how to dismantle, clean,
--	and reconstruct firearms in careful
--	detail. Adventurers note that reading
--	it increases one's marksmanship skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_MRK) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_MRK,amount);
end;