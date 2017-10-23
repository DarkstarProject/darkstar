-- Uses a mixture of mob and player WS formulas
require("scripts/globals/weaponskills");
require("scripts/globals/magicburst");
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/magic");
require("scripts/globals/msg");


-- params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti, kick, accBonus, weaponType, weaponDamage
function doAutoPhysicalWeaponskill(attacker, target, wsID, tp, primary, action, taChar, params, skill, action)

    local criticalHit = false;
    local bonusTP = params.bonusTP or 0
    local multiHitfTP = params.multiHitfTP or false
    local bonusacc = attacker:getMod(MOD_WSACC) + (params.accBonus or 0);

    local dstr = utils.clamp(attacker:getStat(MOD_STR) - target:getStat(MOD_VIT), -10, 10)

    -- apply WSC
    local weaponDamage = params.weaponDamage or attacker:getWeaponDmg();
    local weaponType = params.weaponType or attacker:getWeaponSkillType(0);

    if (weaponType == SKILL_H2H or weaponType == SKILL_NON) then
        local h2hSkill = ((attacker:getSkillLevel(1) * 0.11) + 3);

        if (params.kick and attacker:hasStatusEffect(EFFECT_FOOTWORK)) then
            weaponDamage = attacker:getMod(MOD_KICK_DMG) + 18; -- footwork formerly added 18 base dmg to all kicks, its effect on weaponskills was unchanged by update
        else
            weaponDamage = utils.clamp(weaponDamage-3, 0);
        end

        weaponDamage = weaponDamage + h2hSkill;
    end

    local base = math.max(weaponDamage + dstr +
        (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) + math.max(attacker:getMainLvl() - target:getMainLvl(), 0), 1)

    -- Applying fTP multiplier
    local ftpdmgbonus = attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE)/100;
    local ftp = fTP(tp,params.ftp100,params.ftp200,params.ftp300) + ftpdmgbonus;

    local ignoredDef = 0;
    if (params.ignoresDef == not nil and params.ignoresDef == true) then
        ignoredDef = calculatedIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
    end

    -- get cratio min and max
    local cratio, ccritratio = getAutocRatio(attacker, target, params, ignoredDef, true);
    local ccmin = 0;
    local ccmax = 0;
    local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
    local isSneakValid = attacker:hasStatusEffect(EFFECT_SNEAK_ATTACK);
    if (isSneakValid and not (attacker:isBehind(target) or attacker:hasStatusEffect(EFFECT_HIDE))) then
        isSneakValid = false;
    end
    attacker:delStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
    attacker:delStatusEffect(EFFECT_SNEAK_ATTACK);
    local isTrickValid = taChar ~= nil

    local isAssassinValid = isTrickValid;
    if (isAssassinValid and not attacker:hasTrait(68)) then
        isAssassinValid = false;
    end

    local critrate = 0;
    local nativecrit = 0;

    if (params.canCrit) then -- work out critical hit ratios, by +1ing
        critrate = fTP(tp,params.crit100,params.crit200,params.crit300);
        -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        local flourisheffect = attacker:getStatusEffect(EFFECT_BUILDING_FLOURISH);
        if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
            critrate = critrate + (10 + flourisheffect:getSubPower()/2)/100;
        end
        nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX
        nativecrit = nativecrit + (attacker:getMod(MOD_CRITHITRATE)/100) + attacker:getMerit(MERIT_CRIT_HIT_RATE)/100 - target:getMerit(MERIT_ENEMY_CRIT_RATE)/100;
        if (attacker:hasStatusEffect(EFFECT_INNIN) and attacker:isBehind(target, 23)) then -- Innin acc boost attacker is behind target
            nativecrit = nativecrit + attacker:getStatusEffect(EFFECT_INNIN):getPower();
        end

        if (nativecrit > 0.2) then -- caps!
            nativecrit = 0.2;
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05;
        end
        critrate = critrate + nativecrit;
    end

    -- Applying pDIF
    local pdif = generatePdif(cratio[1], cratio[2], true);

    local missChance = math.random();
    local finaldmg = 0;
    local hitrate = getAutoHitRate(attacker,target,true,bonusacc,true);
    if (params.acc100~=0) then
        -- ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
        -- print("Accuracy varies with TP.");
        hr = accVariesWithTP(getAutoHitRate(attacker,target,false,bonusacc,true),attacker:getACC(),tp,params.acc100,params.acc200,params.acc300);
        hitrate = hr;
    end

    local dmg = base * ftp;
    local tpHitsLanded = 0;
    local shadowsAbsorbed = 0;
    if ((missChance <= hitrate or isSneakValid or isAssassinValid or math.random() < attacker:getMod(MOD_ZANSHIN)/100) and
            not target:hasStatusEffect(EFFECT_PERFECT_DODGE) and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then
        if not shadowAbsorb(target) then
            if (params.canCrit or isSneakValid or isAssassinValid) then
                local critchance = math.random();
                if (critchance <= critrate or hasMightyStrikes or isSneakValid or isAssassinValid) then -- crit hit!
                    local cpdif = generatePdif(ccritratio[1], ccritratio[2], true);
                    finaldmg = dmg * cpdif;
                    if (isSneakValid and attacker:getMainJob() == JOBS.THF) then -- have to add on DEX bonus if on THF main
                        finaldmg = finaldmg + (attacker:getStat(MOD_DEX) * ftp * cpdif) * ((100+(attacker:getMod(MOD_AUGMENTS_SA)))/100);
                    end
                    if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                        finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * cpdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
                    end
                else
                    finaldmg = dmg * pdif;
                    if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                        finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
                    end
                end
            else
                finaldmg = dmg * pdif;
                if (isTrickValid and attacker:getMainJob() == JOBS.THF) then
                    finaldmg = finaldmg + (attacker:getStat(MOD_AGI) * (1 + attacker:getMod(MOD_TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(attacker:getMod(MOD_AUGMENTS_TA)))/100);
                end
            end
            tpHitsLanded = 1;
        else
            shadowsAbsorbed = shadowsAbsorbed + 1
        end
    end

    if not multiHitfTP then dmg = base end

    -- Store first hit bonus for use after other calcs are done..
    local firstHitBonus = ((finaldmg * attacker:getMod(MOD_ALL_WSDMG_FIRST_HIT))/100);

    local numHits = getMultiAttacks(attacker, params.numHits);
    local extraHitsLanded = 0;

    if (numHits > 1) then

        local hitsdone = 1;
        while (hitsdone < numHits) do
            local chance = math.random();
            local targetHP = target:getHP();
            if ((chance<=hitrate or math.random() < attacker:getMod(MOD_ZANSHIN)/100) and
                    not target:hasStatusEffect(EFFECT_PERFECT_DODGE) and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then  -- it hit
                if not shadowAbsorb(target) then
                    pdif = generatePdif(cratio[1], cratio[2], true);
                    if (params.canCrit) then
                        critchance = math.random();
                        if (critchance <= nativecrit or hasMightyStrikes) then -- crit hit!
                            criticalHit = true;
                            cpdif = generatePdif(ccritratio[1], ccritratio[2], true);
                            finaldmg = finaldmg + dmg * cpdif;
                        else
                            finaldmg = finaldmg + dmg * pdif;
                        end
                    else
                        finaldmg = finaldmg + dmg * pdif;
                    end
                    extraHitsLanded = extraHitsLanded + 1;
                else
                    shadowsAbsorbed = shadowsAbsorbed + 1
                end
            end
            hitsdone = hitsdone + 1;
            if (finaldmg > targetHP) then
                break;
            end
        end
    end
    -- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");


    -- DMG Bonus for any WS
    local bonusdmg = attacker:getMod(MOD_ALL_WSDMG_ALL_HITS);

    -- Add in bonusdmg
    finaldmg = finaldmg * ((100 + bonusdmg)/100);
    finaldmg = finaldmg + firstHitBonus;

    -- Check for reductions from PDT
    finaldmg = target:physicalDmgTaken(finaldmg);

    -- Check for reductions from phys resistances
    if (weaponType == SKILL_H2H) then
        finaldmg = finaldmg * target:getMod(MOD_HTHRES) / 1000;
    elseif (weaponType == SKILL_DAG or weaponType == SKILL_POL) then
        finaldmg = finaldmg * target:getMod(MOD_PIERCERES) / 1000;
    elseif (weaponType == SKILL_CLB or weaponType == SKILL_STF) then
        finaldmg = finaldmg * target:getMod(MOD_IMPACTRES) / 1000;
    else
        finaldmg = finaldmg * target:getMod(MOD_SLASHRES) / 1000;
    end

    attacker:delStatusEffectSilent(EFFECT_BUILDING_FLOURISH);
    finaldmg = finaldmg * WEAPON_SKILL_POWER
    if tpHitsLanded + extraHitsLanded > 0 then
        finaldmg = takeWeaponskillDamage(target, attacker, params, primary, finaldmg, SLOT_MAIN, tpHitsLanded, extraHitsLanded, shadowsAbsorbed, bonusTP, action, taChar)
    else
        skill:setMsg(msgBasic.SKILL_MISS)
    end

    return finaldmg, criticalHit, tpHitsLanded, extraHitsLanded;
end;

function getAutoHitRate(attacker,defender,capHitRate,bonus,melee)
    local acc = (melee and attacker:getACC() or attacker:getRACC()) + (bonus or 0);
    local eva = defender:getEVA();

    local levelbonus = 0;
    if (attacker:getMainLvl() > defender:getMainLvl()) then
        levelbonus = 2 * (attacker:getMainLvl() - defender:getMainLvl());
    end

    local hitrate = acc - eva + levelbonus + 75;
    hitrate = hitrate/100;

    -- Applying hitrate caps
    if (capHitRate) then -- this isn't capped for when acc varies with tp, as more penalties are due
        hitrate = utils.clamp(hitrate, 0.2, 0.95);
    end
    return hitrate;
end;

-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function getAutocRatio(attacker, defender, params, ignoredDef, melee)
    local cratio = ((melee and attacker:getStat(MOD_ATT) or attacker:getRATT()) * params.atkmulti) / (defender:getStat(MOD_DEF) - ignoredDef);

    local levelbonus = 0;
    if (attacker:getMainLvl() > defender:getMainLvl()) then
        levelbonus = 0.05 * (attacker:getMainLvl() - defender:getMainLvl());
    end

    cratio = cratio + levelbonus;
    cratio = utils.clamp(cratio, 0, (melee and 4.0 or 3.0));

    local pdif = {};
    local pdifcrit = {};

    if melee then
        local pdifmin = 0;
        local pdifmax = 1;

        if (cratio < 0.5) then
            pdifmax = cratio + 0.5;
        elseif ((0.5 <= cratio) and (cratio <= 0.7)) then
            pdifmax = 1;
        elseif ((0.7 < cratio) and (cratio <= 1.2)) then
            pdifmax = cratio + 0.3;
        elseif ((1.2 < cratio) and (cratio <= 1.5)) then
            pdifmax = (cratio * 0.25) + cratio;
        elseif ((1.5 < cratio) and (cratio <= 2.625)) then
            pdifmax = cratio + 0.375;
        elseif ((2.625 < cratio) and (cratio <= 3.25)) then
            pdifmax = 3;
        else
            pdifmax = cratio;
        end

        if (cratio < 0.38) then
            pdifmin =  0;
        elseif ((0.38 <= cratio) and (cratio <= 1.25)) then
            pdifmin = cratio * (1176 / 1024) - (448 / 1024);
        elseif ((1.25 < cratio) and (cratio <= 1.51)) then
            pdifmin = 1;
        elseif ((1.51 < cratio) and (cratio <= 2.44)) then
            pdifmin = cratio * (1176 / 1024) - (775 / 1024);
        else
            pdifmin = cratio - 0.375;
        end

        pdif[1] = pdifmin;
        pdif[2] = pdifmax;

        cratio = cratio + 1;
        cratio = utils.clamp(cratio, 0, 4.0);

        -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax);

        if (cratio < 0.5) then
            pdifmax = cratio + 0.5;
        elseif ((0.5 <= cratio) and (cratio <= 0.7)) then
            pdifmax = 1;
        elseif ((0.7 < cratio) and (cratio <= 1.2)) then
            pdifmax = cratio + 0.3;
        elseif ((1.2 < cratio) and (cratio <= 1.5)) then
            pdifmax = (cratio * 0.25) + cratio;
        elseif ((1.5 < cratio) and (cratio <= 2.625)) then
            pdifmax = cratio + 0.375;
        elseif ((2.625 < cratio) and (cratio <= 3.25)) then
            pdifmax = 3;
        else
            pdifmax = cratio;
        end

        if (cratio < 0.38) then
            pdifmin =  0;
        elseif ((0.38 <= cratio) and (cratio <= 1.25)) then
            pdifmin = cratio * (1176 / 1024) - (448 / 1024);
        elseif ((1.25 < cratio) and (cratio <= 1.51)) then
            pdifmin = 1;
        elseif ((1.51 < cratio) and (cratio <= 2.44)) then
            pdifmin = cratio * (1176 / 1024) - (775 / 1024);
        else
            pdifmin = cratio - 0.375;
        end

        local critbonus = attacker:getMod(MOD_CRIT_DMG_INCREASE)
        critbonus = utils.clamp(critbonus, 0, 100);
        pdifcrit[1] = pdifmin * ((100 + critbonus)/100);
        pdifcrit[2] = pdifmax * ((100 + critbonus)/100);
    else
        -- max
        local pdifmax = 0;
        if (cratio < 0.9) then
            pdifmax = cratio * (10/9);
        elseif (cratio < 1.1) then
            pdifmax = 1;
        else
            pdifmax = cratio;
        end

        -- min
        local pdifmin = 0;
        if (cratio < 0.9) then
            pdifmin = cratio;
        elseif (cratio < 1.1) then
            pdifmin = 1;
        else
            pdifmin = (cratio * (20/19))-(3/19);
        end

        pdif[1] = pdifmin;
        pdif[2] = pdifmax;
        -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax);

        pdifmin = pdifmin * 1.25;
        pdifmax = pdifmax * 1.25;

        local critbonus = attacker:getMod(MOD_CRIT_DMG_INCREASE)
        critbonus = utils.clamp(critbonus, 0, 100);
        pdifcrit[1] = pdifmin * ((100 + critbonus)/100);
        pdifcrit[2] = pdifmax * ((100 + critbonus)/100);
    end

    return pdif, pdifcrit;
end;

 -- params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti, accBonus, weaponDamage
 function doAutoRangedWeaponskill(attacker, target, wsID, params, tp, primary, skill, action)

    local bonusTP = params.bonusTP or 0
    local multiHitfTP = params.multiHitfTP or false
    local bonusacc = attacker:getMod(MOD_WSACC) + (params.accBonus or 0);

    local dstr = utils.clamp(attacker:getStat(MOD_STR) - target:getStat(MOD_VIT), -10, 10)

    -- apply WSC
    local base = math.max((params.weaponDamage or attacker:getRangedDmg()) + dstr +
        (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) + math.max(attacker:getMainLvl() - target:getMainLvl(), 0), 1)

    -- Applying fTP multiplier
    local ftpdmgbonus = attacker:getMod(MOD_WEAPONSKILL_DAMAGE_BASE)/100;
    local ftp = fTP(tp,params.ftp100,params.ftp200,params.ftp300) + ftpdmgbonus;
    local crit = false

    local ignoredDef = 0;
    if (params.ignoresDef == not nil and params.ignoresDef == true) then
        ignoredDef = calculatedIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
    end

    -- get cratio min and max
    local cratio, ccritratio = getAutocRatio(attacker, target, params, ignoredDef, false);
    local ccmin = 0;
    local ccmax = 0;
    local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
    local critrate = 0;
    if (params.canCrit) then -- work out critical hit ratios, by +1ing
        critrate = fTP(tp,params.crit100,params.crit200,params.crit300);
        -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        local nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX
        nativecrit = nativecrit + (attacker:getMod(MOD_CRITHITRATE)/100) + attacker:getMerit(MERIT_CRIT_HIT_RATE)/100 - target:getMerit(MERIT_ENEMY_CRIT_RATE)/100;
        if (attacker:hasStatusEffect(EFFECT_INNIN) and attacker:isBehind(target, 23)) then -- Innin crit boost if attacker is behind target
            nativecrit = nativecrit + attacker:getStatusEffect(EFFECT_INNIN):getPower();
        end

        if (nativecrit > 0.2) then -- caps!
            nativecrit = 0.2;
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05;
        end
        critrate = critrate + nativecrit;
    end

    local dmg = base * ftp;

    -- Applying pDIF
    local pdif = generatePdif(cratio[1],cratio[2], false);

    -- First hit has 95% acc always. Second hit + affected by hit rate.
    local missChance = math.random();
    local finaldmg = 0;
    local hitrate = getAutoHitRate(attacker,target,true,bonusacc,false);
    if (params.acc100~=0) then
        -- ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
        -- print("Accuracy varies with TP.");
        hr = accVariesWithTP(getAutoHitRate(attacker,target,false,bonusacc,false),attacker:getRACC(),tp,params.acc100,params.acc200,params.acc300);
        hitrate = hr;
    end

    local tpHitsLanded = 0;
    local shadowsAbsorbed = 0
    if (missChance <= hitrate) then
        if not shadowAbsorb(target) then
            if (params.canCrit) then
                local critchance = math.random();
                if (critchance <= critrate or hasMightyStrikes) then -- crit hit!
                    crit = true
                    local cpdif = generatePdif(ccritratio[1], ccritratio[2], false);
                    finaldmg = dmg * cpdif;
                else
                    finaldmg = dmg * pdif;
                end
            else
                finaldmg = dmg * pdif;
            end
            tpHitsLanded = 1;
        else
            shadowsAbsorbed = shadowsAbsorbed + 1
        end
    end

    -- Store first hit bonus for use after other calcs are done..
    local firstHitBonus = ((finaldmg * attacker:getMod(MOD_ALL_WSDMG_FIRST_HIT))/100);

    local numHits = params.numHits;

    if not multiHitfTP then dmg = base end
    local extraHitsLanded = 0;
    if (numHits>1) then
        if (params.acc100==0) then
            -- work out acc since we actually need it now
            hitrate = getAutoHitRate(attacker,target,true,bonusacc,false);
        end

        hitsdone = 1;
        while (hitsdone < numHits) do
            chance = math.random();
            if (chance<=hitrate) then -- it hit
                if not shadowAbsorb(target) then
                    pdif = generatePdif(cratio[1],cratio[2], false);
                    if (canCrit) then
                        critchance = math.random();
                        if (critchance <= critrate or hasMightyStrikes) then -- crit hit!
                            cpdif = generatePdif(ccritratio[1], ccritratio[2], false);
                            finaldmg = finaldmg + dmg * cpdif;
                        else
                            finaldmg = finaldmg + dmg * pdif;
                        end
                    else
                        finaldmg = finaldmg + dmg * pdif; -- NOTE: not using 'dmg' since fTP is 1.0 for subsequent hits!!
                    end
                    extraHitsLanded = extraHitsLanded + 1;
                else
                    shadowsAbsorbed = shadowsAbsorbed + 1
                end
            end
            hitsdone = hitsdone + 1;
        end
    end
    -- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");

    -- DMG Bonus for any WS
    local bonusdmg = attacker:getMod(MOD_ALL_WSDMG_ALL_HITS);

    -- Add in bonusdmg
    finaldmg = finaldmg * ((100 + bonusdmg)/100);
    finaldmg = finaldmg + firstHitBonus;

    -- Check for reductions
    finaldmg = target:rangedDmgTaken(finaldmg);
    finaldmg = finaldmg * target:getMod(MOD_PIERCERES) / 1000;

    finaldmg = finaldmg * WEAPON_SKILL_POWER
    if tpHitsLanded + extraHitsLanded > 0 then
        finaldmg = takeWeaponskillDamage(target, attacker, params, primary, finaldmg, SLOT_RANGED, tpHitsLanded, extraHitsLanded, shadowsAbsorbed, bonusTP, action, nil)
    else
        skill:setMsg(msgBasic.SKILL_MISS)
    end

    return finaldmg, crit, tpHitsLanded, extraHitsLanded;
end;
