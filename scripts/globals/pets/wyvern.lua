-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

WYVERN_OFFENSIVE = 1
WYVERN_DEFENSIVE = 2
WYVERN_MULTI = 3
local wyvernTypes = {
    [dsp.jobs.WAR] = WYVERN_OFFENSIVE,
    [dsp.jobs.MNK] = WYVERN_OFFENSIVE,
    [dsp.jobs.WHM] = WYVERN_DEFENSIVE,
    [dsp.jobs.BLM] = WYVERN_DEFENSIVE,
    [dsp.jobs.RDM] = WYVERN_DEFENSIVE,
    [dsp.jobs.THF] = WYVERN_OFFENSIVE,
    [dsp.jobs.PLD] = WYVERN_MULTI,
    [dsp.jobs.DRK] = WYVERN_MULTI,
    [dsp.jobs.BST] = WYVERN_OFFENSIVE,
    [dsp.jobs.BRD] = WYVERN_MULTI,
    [dsp.jobs.RNG] = WYVERN_OFFENSIVE,
    [dsp.jobs.SAM] = WYVERN_OFFENSIVE,
    [dsp.jobs.NIN] = WYVERN_MULTI,
    [dsp.jobs.DRG] = WYVERN_OFFENSIVE,
    [dsp.jobs.SMN] = WYVERN_DEFENSIVE,
    [dsp.jobs.BLU] = WYVERN_DEFENSIVE,
    [dsp.jobs.COR] = WYVERN_OFFENSIVE,
    [dsp.jobs.PUP] = WYVERN_OFFENSIVE,
    [dsp.jobs.DNC] = WYVERN_OFFENSIVE,
    [dsp.jobs.SCH] = WYVERN_DEFENSIVE,
    [dsp.jobs.GEO] = WYVERN_DEFENSIVE,
    [dsp.jobs.RUN] = WYVERN_MULTI
}

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local master = mob:getMaster()
    mob:addMod(MOD_DMG, -40);
    local wyvernType = wyvernTypes[master:getSubJob()]
    local healingbreath = 624
    if mob:getMainLvl() >= 80 then healingbreath = 623
    elseif mob:getMainLvl() >= 40 then healingbreath = 626
    elseif mob:getMainLvl() >= 20 then healingbreath = 625 end
    if wyvernType == WYVERN_DEFENSIVE then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, target, skillid)
            local party = player:getParty()
            for _,member in ipairs(party) do
                if member:hasStatusEffect(dsp.effects.POISON) then
                    player:getPet():useJobAbility(627, member)
                    break
                elseif member:hasStatusEffect(dsp.effects.BLINDNESS) and player:getPet():getMainLvl() > 20 then
                    player:getPet():useJobAbility(628, member)
                    break
                elseif member:hasStatusEffect(dsp.effects.PARALYSIS) and player:getPet():getMainLvl() > 40 then
                    player:getPet():useJobAbility(629, member)
                    break
                elseif (member:hasStatusEffect(dsp.effects.CURSE_I) or member:hasStatusEffect(dsp.effects.DOOM)) and player:getPet():getMainLvl() > 60 then
                    player:getPet():useJobAbility(637, member)
                    break
                elseif (member:hasStatusEffect(dsp.effects.DISEASE) or member:hasStatusEffect(dsp.effects.PLAGUE)) and player:getPet():getMainLvl() > 80 then
                    player:getPet():useJobAbility(638, member)
                    break
                end
            end
        end);
        if (master:getSubJob() ~= dsp.jobs.SMN) then
            master:addListener("MAGIC_USE", "PET_WYVERN_MAGIC", function(player, target, spell, action)
                -- check master first!
                local threshold = 33;
                if (player:getMod(MOD_WYVERN_EFFECTIVE_BREATH) > 0) then
                    threshold = 50;
                end
                doHealingBreath(player, threshold, healingbreath)
            end);
        end
    elseif wyvernType == WYVERN_OFFENSIVE or wyvernType == WYVERN_MULTI then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, target, skillid)
            local weaknessTargetChance = 75
            local breaths = {};
            if (player:getMod(MOD_WYVERN_EFFECTIVE_BREATH) > 0) then
                weaknessTargetChance = 100;
            end
            if (math.random(100) <= weaknessTargetChance) then
                local weakness = 0
                for mod = 0, 5 do
                    if target:getMod(MOD_FIREDEF + mod) < target:getMod(MOD_FIREDEF + weakness) then
                        breaths = {}
                        table.insert(breaths, 630 + mod)
                    elseif target:getMod(MOD_FIREDEF + mod) == target:getMod(MOD_FIREDEF + weakness) then
                        table.insert(breaths, 630 + mod)
                    end
                end
            else
                breaths = {630, 631, 632, 633, 634, 635}
            end
            player:getPet():useJobAbility(breaths[math.random(#breaths)], target)
        end);
    end
    if wyvernType == WYVERN_MULTI then
        master:addListener("MAGIC_USE", "PET_WYVERN_MAGIC", function(player, target, spell, action)
            -- check master first!
            local threshold = 25;
            if (player:getMod(MOD_WYVERN_EFFECTIVE_BREATH) > 0) then
                threshold = 33;
            end
            doHealingBreath(player, threshold, healingbreath)
        end);
    end

    master:addListener("ATTACK", "PET_WYVERN_ENGAGE", function(player, target, action)
        local pet = player:getPet()
        if (pet:getTarget() == nil or target:getID() ~= pet:getTarget():getID()) then
            player:petAttack(target);
        end
    end);

    master:addListener("DISENGAGE", "PET_WYVERN_DISENGAGE", function(player)
        player:petRetreat();
    end);

    master:addListener("EXPERIENCE_POINTS", "PET_WYVERN_EXP", function(player, exp)
        local pet = player:getPet()
        local prev_exp = pet:getLocalVar("wyvern_exp")
        if (prev_exp < 1000) then
        -- cap exp at 1000 to prevent wyvern leveling up many times from large exp awards
            local currentExp = exp
            if (prev_exp+exp > 1000) then
                currentExp = 1000 - prev_exp
            end
            local diff = math.floor((prev_exp + currentExp)/200) - math.floor(prev_exp/200)
            if diff ~= 0 then
                -- wyvern levelled up (diff is the number of level ups)
                pet:addMod(MOD_ACC,2*diff)
                pet:addMod(MOD_HPP,5*diff)
                pet:addMod(MOD_ATTP,5*diff)
                pet:setHP(pet:getMaxHP())
                player:messageBasic(msgBasic.STATUS_INCREASED, 0, 0, pet);
            end
            pet:setLocalVar("wyvern_exp", prev_exp + exp)
        end
    end);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDeath(mob)
    local master = mob:getMaster();
    master:removeListener("PET_WYVERN_WS");
    master:removeListener("PET_WYVERN_MAGIC");
    master:removeListener("PET_WYVERN_ENGAGE");
    master:removeListener("PET_WYVERN_DISENGAGE");
    master:removeListener("PET_WYVERN_EXP");
end;


function doHealingBreath(player, threshold, breath)
    if player:getHPP() < threshold then
        player:getPet():useJobAbility(breath, player)
    else
        local party = player:getParty()
        for _,member in ipairs(party) do
            if member:getHPP() < threshold then
                player:getPet():useJobAbility(breath, member)
                break
            end
        end
    end
end;
