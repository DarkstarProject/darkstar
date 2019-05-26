
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/msg")

function getSummoningSkillOverCap(avatar)
    local summoner = avatar:getMaster()
    local summoningSkill = summoner:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
    local maxSkill = summoner:getMaxSkillLevel(avatar:getMainLvl(), dsp.job.SMN, dsp.skill.SUMMONING_MAGIC)
    return math.max(summoningSkill - maxSkill, 0)
end

function AvatarPhysicalMove(avatar,target,skill,numberofhits,accmod,dmgmod,dmgmodsubsequent,tpeffect,mtp100,mtp200,mtp300)

    local returninfo = {}

    local acc = avatar:getACC() + utils.clamp(getSummoningSkillOverCap(avatar), 0, 200)
    local eva = target:getEVA()
    local dmg = avatar:getWeaponDmg()
    local minFstr, maxFstr = avatarFSTR(avatar:getStat(dsp.mod.STR), target:getStat(dsp.mod.VIT))
    local ratio = avatar:getStat(dsp.mod.ATT) / target:getStat(dsp.mod.DEF)

    -- Note: Avatars do not have any level correction. This is why they are so good on Wyrms! // https://kegsay.livejournal.com/tag/smn!
    local hitrate = utils.clamp(acc - eva, 20, 95)

    -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
    local critrate = (avatar:getStat(dsp.mod.DEX) - target:getStat(dsp.mod.AGI)) * 0.005 -- assumes +0.5% crit rate per 1 dDEX
    critrate = critrate + avatar:getMod(dsp.mod.CRITHITRATE) / 100
    critrate = utils.clamp(critrate, 0.05, 0.2);

    -- Applying pDIF
    if ratio <= 1 then
        maxRatio = 1
        minRatio = 1/3
    elseif ratio < 1.6 then
        maxRatio = (2 * ratio + 1) / 3
        minRatio = (7 * ratio - 4) / 9
    elseif ratio <= 1.8 then
        maxRatio = 1.8
        minRatio = 1
    elseif ratio < 3.6 then
        maxRatio = 2.4 * ratio - 2.52
        minRatio = 5 * ratio / 3 - 2
    else
        maxRatio = 4.2
        minRatio = 4
    end

    -- start the hits
    local hitsdone = 1
    local hitslanded = 0
    local hitdmg = 0
    local finaldmg = 0

    if math.random() < hitrate then
        hitdmg = avatarHitDmg(dmg, minRatio, maxRatio, minFstr, maxFstr, critrate)
        finaldmg = finaldmg + hitdmg * dmgmod
        hitslanded = hitslanded + 1
    end

    while hitsdone < numberofhits do
        if math.random() < hitrate then
            hitdmg = avatarHitDmg(dmg, minRatio, maxRatio, minFstr, maxFstr, critrate)
            finaldmg = finaldmg + hitdmg * dmgmodsubsequent
            hitslanded = hitslanded + 1
        end
        hitsdone = hitsdone + 1
    end

    -- all hits missed
    if hitslanded == 0 or finaldmg == 0 then
        finaldmg = 0
        hitslanded = 0
        skill:setMsg(dsp.msg.basic.SKILL_MISS)

    -- some hits hit
    else
        target:wakeUp()
    end

    -- apply ftp bonus
    if tpeffect == TP_DMG_BONUS then
        finaldmg = finaldmg * avatarFTP(skill:getTP(), mtp100, mtp200, mtp300)
    end

    returninfo.dmg = finaldmg
    returninfo.hitslanded = hitslanded

    return returninfo
end

-- minFstr = dSTR/4 + 0.5
-- maxFstr = dSTR/4 + 0.25
function avatarFSTR(att_str, def_vit)
    local dSTR = att_str - def_vit
    return math.floor(dSTR / 4 + 0.5), math.floor(dSTR / 4 + 0.25)
end

function avatarHitDmg(dmg, pdifMin, pdifMax, fstrMin, fstrMax, critrate)
    local fstr = math.random(fstrMin, fstrMax)
    local pdif = math.random(pdifMin * 1000, pdifMax * 1000) / 1000
    if math.random() < critrate then
        pdif = math.min(pdif + 1, 4.2)
    end
    return (dmg + fstr) * pdif
end

function AvatarFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

    -- physical attack missed, skip rest
    if skilltype == dsp.attackType.PHYSICAL and dmg == 0 then
        return 0
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(dsp.msg.basic.DAMAGE)

    --Handle shadows depending on shadow behaviour / skilltype
    if shadowbehav < 5 and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS then --remove 'shadowbehav' shadows.
        targShadows = target:getMod(dsp.mod.UTSUSEMI)
        shadowType = dsp.mod.UTSUSEMI
        if targShadows == 0 then --try blink, as utsusemi always overwrites blink this is okay
            targShadows = target:getMod(dsp.mod.BLINK)
            shadowType = dsp.mod.BLINK
        end

        if targShadows > 0 then
        -- Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!
            if targShadows >= shadowbehav then --no damage, just suck the shadows
                skill:setMsg(dsp.msg.basic.SHADOW_ABSORB)
                target:setMod(shadowType, targShadows - shadowbehav)
                if shadowType == dsp.mod.UTSUSEMI then --update icon
                    effect = target:getStatusEffect(dsp.effect.COPY_IMAGE)
                    if effect ~= nil then
                        if targShadows - shadowbehav == 0 then
                            target:delStatusEffect(dsp.effect.COPY_IMAGE)
                            target:delStatusEffect(dsp.effect.BLINK)
                        elseif targShadows - shadowbehav == 1 then
                            effect:setIcon(dsp.effect.COPY_IMAGE)
                        elseif targShadows - shadowbehav == 2 then
                            effect:setIcon(dsp.effect.COPY_IMAGE_2)
                        elseif targShadows - shadowbehav == 3 then
                            effect:setIcon(dsp.effect.COPY_IMAGE_3)
                        end
                    end
                end
                return shadowbehav
            else -- less shadows than this move will take, remove all and factor damage down
                dmg = dmg * (shadowbehav - targShadows) / shadowbehav
                target:setMod(dsp.mod.UTSUSEMI, 0)
                target:setMod(dsp.mod.BLINK, 0)
                target:delStatusEffect(dsp.effect.COPY_IMAGE)
                target:delStatusEffect(dsp.effect.BLINK)
            end
        end
    elseif shadowbehav == MOBPARAM_WIPE_SHADOWS then --take em all!
        target:setMod(dsp.mod.UTSUSEMI, 0)
        target:setMod(dsp.mod.BLINK, 0)
        target:delStatusEffect(dsp.effect.COPY_IMAGE)
        target:delStatusEffect(dsp.effect.BLINK)
    end

    -- handle Third Eye using shadowbehav as a guide
    teye = target:getStatusEffect(dsp.effect.THIRD_EYE)
    if teye ~= nil and skilltype == dsp.attackType.PHYSICAL then --T.Eye only procs when active with PHYSICAL stuff
        if shadowbehav == MOBPARAM_WIPE_SHADOWS then --e.g. aoe moves
            target:delStatusEffect(dsp.effect.THIRD_EYE)
        elseif shadowbehav ~= MOBPARAM_IGNORE_SHADOWS then --it can be absorbed by shadows
            --third eye doesnt care how many shadows, so attempt to anticipate, but reduce
            --chance of anticipate based on previous successful anticipates.
            prevAnt = teye:getPower()
            if prevAnt == 0 then
                --100% proc
                teye:setPower(1)
                skill:setMsg(dsp.msg.basic.ANTICIPATE)
                return 0
            end
            if math.random() * 10 < 8 - prevAnt then
                --anticipated!
                teye:setPower(prevAnt+1)
                skill:setMsg(dsp.msg.basic.ANTICIPATE)
                return 0
            end
            target:delStatusEffect(dsp.effect.THIRD_EYE)
        end
    end

    --TODO: Handle anything else (e.g. if you have Magic Shield and its a Magic skill, then do 0 damage.
    if skilltype == dsp.attackType.PHYSICAL and target:hasStatusEffect(dsp.effect.PHYSICAL_SHIELD) then
        return 0
    end

    if skilltype == dsp.attackType.RANGED and target:hasStatusEffect(dsp.effect.ARROW_SHIELD) then
        return 0
    end

    -- handle elemental resistence
    if skilltype == dsp.attackType.MAGICAL and target:hasStatusEffect(dsp.effect.MAGIC_SHIELD) then
        return 0
    end

    -- handling phalanx
    dmg = dmg - target:getMod(dsp.mod.PHALANX)
    if dmg < 0 then
        return 0
    end

    --handle invincible
    if target:hasStatusEffect(dsp.effect.INVINCIBLE) and skilltype == dsp.attackType.PHYSICAL then
        return 0
    end
    -- handle pd
    if target:hasStatusEffect(dsp.effect.PERFECT_DODGE) or target:hasStatusEffect(dsp.effect.TOO_HIGH) and skilltype == dsp.attackType.PHYSICAL then
        return 0
    end

    -- Calculate Blood Pact Damage before stoneskin
    dmg = dmg + dmg * mob:getMod(dsp.mod.BP_DAMAGE) / 100

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)

    return dmg
end

-- returns true if mob attack hit
-- used to stop tp move status effects
function AvatarPhysicalHit(skill, dmg)
    -- if message is not the default. Then there was a miss, shadow taken etc
    return skill:getMsg() == dsp.msg.basic.DAMAGE
end

function avatarFTP(tp,ftp1,ftp2,ftp3)
    if tp < 1000 then
        tp = 1000
    end
    if tp >= 1000 and tp < 2000 then
        return ftp1 + (ftp2 - ftp1) / 100 * (tp - 1000)
    elseif tp >= 2000 and tp <= 3000 then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + (ftp3 - ftp2) / 100 * (tp - 2000)
    end
    return 1 -- no ftp mod
end

-- Checks if the summoner is in a Trial Size Avatar Mini Fight (used to restrict summoning while in bcnm)
function avatarMiniFightCheck(caster)
    local result = 0
    local bcnmid
    if caster:hasStatusEffect(dsp.effect.BATTLEFIELD) then
        bcnmid = caster:getStatusEffect(dsp.effect.BATTLEFIELD):getPower()
        if bcnmid == 418 or bcnmid == 609 or bcnmid == 450 or bcnmid == 482 or bcnmid == 545 or bcnmid == 578 then -- Mini Avatar Fights
            result = 40 -- Cannot use <spell> in this area.
        end
    end
      return result
end
