-----------------------------------
-- Area: Mamook
--  MOB: Colibri
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local delay = mob:getLocalVar("delay");
    local LastCast = mob:getLocalVar("LAST_CAST");
    local spell = mob:getLocalVar("COPY_SPELL");
    if (mob:AnimationSub() == 1) then
        if (mob:getBattleTime() - LastCast > 30) then
            mob:setLocalVar("COPY_SPELL", 0);
            mob:setLocalVar("delay", 0);
            mob:AnimationSub(0);
        end

        if (spell > 0 and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
            if (delay >= 3) then
                mob:castSpell(spell);
                mob:setLocalVar("COPY_SPELL", 0);
                mob:setLocalVar("delay", 0);
                mob:AnimationSub(0);
            else
                mob:setLocalVar("delay", delay+1);
            end
        end
    end
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, target, spell)
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= SPELLGROUP_BLUE ) then
        target:setLocalVar("COPY_SPELL", spell:getID());
        target:setLocalVar("LAST_CAST", target:getBattleTime());
        target:AnimationSub(1);
    end

    return 1;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;