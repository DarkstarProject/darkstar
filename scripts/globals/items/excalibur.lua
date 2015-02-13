-----------------------------------------
-- ID: 18236
-- Excalibur
-- Additional Effect: Slashing Damage(Substituted with Light Damage)

-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = 0.25 * player:getHP();
       
        dmg = adjustForTarget(target,dmg,ELE_LIGHT);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);

        local message = 163;
        if (dmg < 0) then
            message = 167;
        end

        return SUBEFFECT_LIGHT_DAMAGE,message,dmg;
    end
end;