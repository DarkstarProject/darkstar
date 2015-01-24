-----------------------------------------
--	ID: 6155
--	Item: Copy of Kagetora's Diary
--	Description: A diary written by
--	Kagetora. In it he details each and
--	every one of his ninety-eight
--	victories and ninety-nine losses
--	against Yomi. Adventurers note that
--	reading it increases one's katana
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_KAT) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_KAT,amount);
end;