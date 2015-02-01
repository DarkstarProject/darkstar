-----------------------------------------
--	ID: 6162
--	Item: Copy of Mikhe's Note
--	Description: A memo scrawled by Mikhe
--	Aryohcha that matter-of-factly
--	states, "Just throw your guard up and
--	it'll all work out." Adventurers note
--	that reading it increases one's
--	guarding skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_GRD) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_GRD,amount);
end;