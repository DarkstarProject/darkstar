-----------------------------------------
--	ID: 6147
--	Item: Copy of Mikhe's Memo
--	Description: A memo scrawled by Mikhe
--	Aryohcha that matter-of-factly
--	states, "Just throw your fist at your
--	opponent and it'll all work out."
--	Adventurers say that their
--	hand-to-hand skill increases after
--	reading this note.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_H2H) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_H2H,amount);
end;