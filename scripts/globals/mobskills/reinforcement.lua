---------------------------------------------
--  Reinforcement
--
--  Description: calls Reinforcement lamina
--  Range: Unknown
--  Notes: Used only by Medusa.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- local mobID = mob:getID();   --(16908294 ,16908301 ,16908308 =omega ,16933124=proto-omega)
    -- local mobhp = mob:getHPP();
    -- if (mobID == 16998862 and mobhp < 70 and mobhp > 30 )then
	return 1;
	-- end
end;

function onMobWeaponSkill(target, mob, skill)
    local petIDs = {16998863,16998864,16998865,16998866};
	local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4])};
	for i = 1, 4 do
		GetMobByID(petIDs[i]):changeSkin(18);
	end 
	return petIDs;
end;
