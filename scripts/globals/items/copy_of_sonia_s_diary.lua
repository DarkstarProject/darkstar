-----------------------------------------
--	ID: 6163
--	Item: Copy of Sonia's Diary
--	Description: A compilation of
--	memories from Sonia. Of particular
--	note are her observations on how to
--	replicate the sheer brilliance of
--	Annika Brilioth and the esoteric
--	steps known as the Kriegstanz.
--	Adventurers say that reading it
--	increases their evasion skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_EVA) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_EVA,amount);
end;