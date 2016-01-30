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
            if ammo and (ammo:isType(ITEM_WEAPON) or skilltype == SKILL_THR) then
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
    if (player:getWeaponSkillType(SLOT_RANGED) == SKILL_MRK) then
        action:animation(target:getID(), action:animation(target:getID()) + 1);
    end
    local params = {};
    params.numHits = 1;
    local ftp = 5
    params.ftp100 = ftp; params.ftp200 = ftp; params.ftp300 = ftp;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1
    params.enmityMult = 0.5

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, 0, params, 0, true)

    if not (tpHits + extraHits > 0) then
        ability:setMsg(MSGBASIC_USES_BUT_MISSES)
        action:speceffect(target:getID(), 0)
    end

    return damage;
end;
