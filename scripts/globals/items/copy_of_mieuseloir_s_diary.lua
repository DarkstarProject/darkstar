-----------------------------------------
--	ID: 6150
--	Item: Copy of Mieuseloir's Diary
--	Description: An account penned by
--	Mieuseloir B Enchelles of his
--	encounters with the Gigas in
--	Beaucedine Glacier. Adventurers note
--	that reading it increases one's great
--	sword skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_GSD) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_GSD,amount);
end;