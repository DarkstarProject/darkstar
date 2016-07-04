-----------------------------------
-- Area: Ru'Aun Gardens
--  NM:  Suzaku
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMonsterMagicPrepare Action
-----------------------------------

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    rnd = math.random();

    if (rnd < 0.5) then
        return 176; -- firaga 3
    elseif (rnd < 0.7) then
         return 147; -- fire 4
    elseif (rnd < 0.9) then
        return 204; -- flare
    else
        return 235; -- burn
    end
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(110,130)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, ELE_FIRE, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_FIRE,0);
    dmg = adjustForTarget(target,dmg,ELE_FIRE);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_FIRE,dmg);

    return SUBEFFECT_FIRE_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:showText(mob,SKY_GOD_OFFSET + 8);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17310051):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;