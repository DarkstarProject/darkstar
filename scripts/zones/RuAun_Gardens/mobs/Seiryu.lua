-----------------------------------
-- Area: Ru'Aun Gardens
--  NM:  Seiryu
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
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob,target)
    -- For some reason, this returns false even when Hundred Fists is active, so... yeah.
    -- Core does this:
    -- m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HUNDRED_FISTS,0,1,0,45));
    if (mob:hasStatusEffect(EFFECT_HUNDRED_FISTS,0) == false) then
        local rnd = math.random();
        if (rnd < 0.5) then
            return 186; -- aeroga 3
        elseif (rnd < 0.7) then
             return 157; -- aero 4
        elseif (rnd < 0.9) then
            return 208; -- tornado
        else
            return 237; -- choke
        end
    end
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(130,150)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, ELE_WIND, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WIND,0);
    dmg = adjustForTarget(target,dmg,ELE_WIND);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WIND,dmg);

    return SUBEFFECT_WIND_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:showText(mob,SKY_GOD_OFFSET + 10);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17310053):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;