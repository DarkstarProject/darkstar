-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Byakko 
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:showText(mob,SKY_GOD_OFFSET + 12);
    GetNPCByID(17310051):hideNPC(120);
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local LV_diff = target:getMainLvl() - mob:getMainLvl();
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
    local ranDmgMod = math.random(0,15)
    local dmg = INT_diff+LV_diff+ranDmgMod;
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    
    dmg = addBonusesAbility(mob, ELE_LIGHT, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_LIGHT,0);
    dmg = adjustForTarget(target,dmg,ELE_LIGHT);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_LIGHT,dmg);

    return SUBEFFECT_LIGHT_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
end;