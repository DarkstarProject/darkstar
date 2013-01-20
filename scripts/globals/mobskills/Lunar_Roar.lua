---------------------------------------------------
-- Lunar Roar
-- Fenrir removes two beneficial status effects from enemies within Area of Effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

	local dis = target:dispelStatusEffect();
	target:dispelStatusEffect();

    if(dis == EFFECT_NONE) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        skill:setMsg(MSG_DISPEL);
    end
	return dis;

end