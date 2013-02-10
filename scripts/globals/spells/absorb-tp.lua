--------------------------------------
--  Spell: Absorb-TP
--  Steals an enemy's TP.
--------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local tp = 0;
        bonus = AffinityBonus(caster,spell);
        dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        resist = applyResistance(caster,spell,target,dINT,37,bonus);
        if(resist <= 0.125) then
            spell:setMsg(85);
        else
            spell:setMsg(454);

            tp = math.floor(math.random(40, 80) * resist);

            if(target:getTP() < tp) then
                tp = target:getTP();
            end

            -- drain
            caster:addTP(tp);
            target:addTP(-tp);

        end
    return tp;
end;