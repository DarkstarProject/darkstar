---------------------------------------------
--  Domionion Slash
--
--  Description: Performs an area of effect slashing weaponskill. Additional effect: Silence
--  Type: Physical
--  2-3 Shadows
--  Range: Unknown radial

-- One source also mentions that it "can dispel important buffs."
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

   -- TODO: Can skillchain?  Unknown property.

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3.25;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

   MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 60);

   -- Due to conflicting information, making the dispel resistable.  Correct/tweak if wrong.
   local resist = applyPlayerResistance(mob,EFFECT_DISPEL,target,dINT,bonus,ELE_DARK);
   if(resist > 0.0625) then
      target:dispelStatusEffect();
   end

   -- Damage is HIGHLY conflicting.  Witnessed anywhere from 300 to 900.
   -- TP DMG VARIES can sort of account for this, but I feel like it's still not right.
   target:delHP(dmg);
   return dmg;
end;
