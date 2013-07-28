-----------------------------------------
-- Spell: Paralyze
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (150 + dMND*2)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if(target:hasStatusEffect(EFFECT_PARALYSIS)) then --effect already on, do nothing
        spell:setMsg(75);
    elseif(math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
		-- Calculate duration.
		local double duration = 180;

		-- Grabbing variables for paralyze potency
		local mLVL = caster:getMainLvl();
		local pMND = caster:getStat(MOD_MND);
		local mMND = target:getStat(MOD_MND);

		local merits = caster:getMerit(MERIT_PARALYZE_II);

		local dMND = (pMND - mMND);
		local multiplier = (150 + (merits * 10)) / mLVL;

		-- Calculate potency.
		local potency = (multiplier * dMND) / 10;

		if potency > 30 then
			potency = 30;
		end
		--printf("Duration : %u",duration);
		--printf("Potency : %u",potency);
        local bonus = AffinityBonus(caster, spell:getElement());
        local resist = applyResistance(caster,spell,target,dMND,35,bonus);

        if(resist >= 0.25) then
            if(target:addStatusEffect(EFFECT_PARALYSIS,potency,0,duration*resist)) then
                spell:setMsg(236);
            else
                -- no effect
                spell:setMsg(75);
            end
        else
            -- resist
            spell:setMsg(85);
        end


    else -- resist entirely.

            spell:setMsg(85);
    end

    return EFFECT_PARALYSIS;
end;
