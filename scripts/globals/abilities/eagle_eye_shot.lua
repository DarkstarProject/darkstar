-----------------------------------
-- Ability: Eagle Eye Shot
-- Delivers a powerful and accurate ranged attack.
-- Obtained: Ranger Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local ranged = player:getStorageItem(0, 0, SLOT_RANGED);
    local ammo = player:getStorageItem(0, 0, SLOT_AMMO);
    
    if ranged and ranged:isType(ITEM_WEAPON) then
        local skilltype = ranged:getSkillType();
        if skilltype == SKILL_ARC or skilltype == SKILL_MRK or skilltype == SKILL_THR then
            if (ammo and ammo:isType(ITEM_WEAPON)) or skilltype == SKILL_THR then
                return 0, 0;
            end;
        end;
    end;
    
    return MSGBASIC_NO_RANGED_WEAPON, 0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    local targid = target:getID();
    
    action:reaction(targid, REACTION_HIT);
    action:speceffect(targid, SPECEFFECT_HIT);
    --action:animation(targid, ability:getAnimationID());
    action:messageID(targid, MSGBASIC_USES_JA_TAKE_DAMAGE);
    
    if target:hasStatusEffect(EFFECT_PERFECT_DODGE) then
        action:messageID(targid, 32);
        action:speceffect(targid, SPECEFFECT_NONE);
        action:reaction(targid, REACTION_EVADE);
    end;
    
    if (player:getWeaponSkillType(SLOT_RANGED) == SKILL_MRK) then
        action:animation(targid, action:animation(targid) + 1);
    end
    
    local params = {};
    params.numHits = 1;
    local ftp = 5;
    params.ftp100 = ftp; params.ftp200 = ftp; params.ftp300 = ftp;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.ignoreElementalGear = true;
    params.enmityMult = 0.5;

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, 0, params, 0, true);
    
    if criticalHit then
        action:speceffect(targid, SPECEFFECT_CRITICAL_HIT);
    end;
    
    if not (tpHits + extraHits > 0) then
        ability:setMsg(MSGBASIC_USES_BUT_MISSES)
        action:speceffect(targid, 0)
    end
    
    local ammo = player:getStorageItem(0, 0,SLOT_AMMO);
    local recycleChance = player:getMod(MOD_RECYCLE);
    
    if player:hasTrait(TRAIT_RECYCLE) then
        recycleChance = recycleChance + player:getMerit(MERIT_RECYCLE);
    end;
    
    if player:hasStatusEffect(EFFECT_UNLIMITED_SHOT) then
        recycleChance = 100;
    end;
    
    if ammo and math.random(1,100) > recycleChance then
        player:removeAmmo();
        player:trackArrowUsageForScavenge();
    end;
    return damage;
end;
