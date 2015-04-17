-----------------------------------------
-- Spell: Esuna
--
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local count = 1;

    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE};
    
    if(caster:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
        printf("AFFLATUS MISERY BONUS: Removing 2 Effects, Additional Effects Eligible");
        count = 2
        removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE, EFFECT_BIO, EFFECT_DIA, EFFECT_BURN, EFFECT_FROST, EFFECT_CHOKE, EFFECT_RASP, EFFECT_SHOCK, EFFECT_DROWN, EFFECT_STR_DOWN, EFFECT_DEX_DOWN, EFFECT_VIT_DOWN, EFFECT_AGI_DOWN, EFFECT_INT_DOWN, EFFECT_MND_DOWN, EFFECT_CHR_DOWN, EFFECT_GRAVITY, EFFECT_ADDLE, EFFECT_SLOW, EFFECT_REQUIEM, EFFECT_ELEGY, EFFECT_HELIX};
    end


    -- collect a list of what caster currently has
    for i, effect in ipairs(removables) do
        if(caster:hasStatusEffect(effect)) then
            local removed = false;
            
            -- Remove the same effect from party members that have it too.
            local partySize = target:getPartySize(1);
            local j = 0;
            for j = 0, partySize, 1 do
                local partyMember = target:getPartyMember(j);

                -- Only include party members within range, and
                -- that have the same status.
                if caster:getID() ~= partyMember:getID()
                and partyMember:hasStatusEffect(effect)
                and partyMember:checkDistance(caster) <= 10 then
                    partyMember:delStatusEffect(effect);
                    removed = true;
                end;
            end;

            -- Only remove the status if a party member has the status.
            if removed == true then
                target:delStatusEffect(effect);

                -- Only flag the statuses up to the count specified.
                count = count - 1;
                if count == 0 then
                    return effect;
                end;
            end;
        end;
    end;

    if(count > 0) then
        spell:setMsg(75); -- no effect
    end

    return 0;
end;
