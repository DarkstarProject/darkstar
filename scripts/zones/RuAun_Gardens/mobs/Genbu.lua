-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Genbu
-- ID: 17309980
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer)
    killer:showText(mob, SKY_GOD_OFFSET + 6);
    GetNPCByID(17310098):hideNPC(120);
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local levelDiff = target:getMainLvl() - mob:getMainLvl();
    local statDiff = mob:getStat(MOD_MND) - target:getStat(MOD_MND);

    local dmg = statDiff + levelDiff + math.random(0, 15); -- MND modifier + difference in level + variance
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, ELE_WATER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob, target, ELE_WATER, 0);
    dmg = adjustForTarget(target, dmg, ELE_WATER);

    local message = 163;
    if (dmg < 0) then
        message = 167;
    end

    dmg = finalMagicNonSpellAdjustments(mob, target, ELE_WATER, dmg);

    return SUBEFFECT_WATER_DAMAGE, message, dmg;
end;