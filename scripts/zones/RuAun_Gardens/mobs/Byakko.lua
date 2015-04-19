-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Byakko
-- ID: 17309982
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
    killer:showText(mob, SKY_GOD_OFFSET + 12);
    GetNPCByID(17310051):hideNPC(120);
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
    
    dmg = addBonusesAbility(mob, ELE_LIGHT, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob, target, ELE_LIGHT, 0);
    dmg = adjustForTarget(target, dmg, ELE_LIGHT);
    
    if (dmg < 0) then
        dmg = 0
    end
    
    dmg = finalMagicNonSpellAdjustments(mob, target, ELE_LIGHT, dmg);
    
    return SUBEFFECT_LIGHT_DAMAGE, 163, dmg;
end;