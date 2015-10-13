-----------------------------------------
-- ID: 18276
-- Item: Excalibur
-- Additional Effect: Damage proportionate to current HP (25% Current HP)
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/weaponskills");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local finalDMG = math.floor(player.getHP(player)/4);
        if (finalDMG > 0) then
            local physicalResist = target:getMod(MOD_SLASHRES)/1000;
            finalDMG = finalDMG*physicalResist;
            finalDMG = target:physicalDmgTaken(finalDMG);
            finalDMG = finalDMG - target:getMod(MOD_PHALANX);
            utils.clamp(finalDMG, 0, 99999);
            finalDMG = utils.stoneskin(target, finalDMG);
            target:delHP(finalDMG);
            return SUBEFFECT_LIGHT_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, finalDMG;
        end
    end
end;
