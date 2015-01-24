-----------------------------------------
--	ID: 6158
--	Item: Copy of Kayeel-Payeel's Memoirs
--	Description: Memoirs penned by
--	Kayeel-Payeel. They describe in
--	particular detail the time he
--	received Claustrum from the Warlock
--	Warlord Robel-Akbel. Adventurers note
--	that reading them increases one's
--	staff skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_STF) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_STF,amount);
end;