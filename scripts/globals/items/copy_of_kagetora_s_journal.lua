-----------------------------------------
--	ID: 6165
--	Item: copy_of_kagetora_s_journal
--	Description: A journal kept by
--	Kagetora that delineates the extent
--	to which he and Yomi lost themselves
--	in their studies of the martial arts.
--	Adventurers note that reading it
--	increases one's parrying skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_PAR) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_PAR,amount);
end;