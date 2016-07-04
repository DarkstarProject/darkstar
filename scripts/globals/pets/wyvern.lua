-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");

WYVERN_OFFENSIVE = 1
WYVERN_DEFENSIVE = 2
WYVERN_MULTI = 3
local wyvernTypes = {
    [JOBS.WAR] = WYVERN_OFFENSIVE,
    [JOBS.MNK] = WYVERN_OFFENSIVE,
    [JOBS.WHM] = WYVERN_DEFENSIVE,
    [JOBS.BLM] = WYVERN_DEFENSIVE,
    [JOBS.RDM] = WYVERN_DEFENSIVE,
    [JOBS.THF] = WYVERN_OFFENSIVE,
    [JOBS.PLD] = WYVERN_MULTI,
    [JOBS.DRK] = WYVERN_MULTI,
    [JOBS.BST] = WYVERN_OFFENSIVE,
    [JOBS.BRD] = WYVERN_MULTI,
    [JOBS.RNG] = WYVERN_OFFENSIVE,
    [JOBS.SAM] = WYVERN_OFFENSIVE,
    [JOBS.NIN] = WYVERN_MULTI,
    [JOBS.DRG] = WYVERN_OFFENSIVE,
    [JOBS.SMN] = WYVERN_DEFENSIVE,
    [JOBS.BLU] = WYVERN_DEFENSIVE,
    [JOBS.COR] = WYVERN_OFFENSIVE,
    [JOBS.PUP] = WYVERN_OFFENSIVE,
    [JOBS.DNC] = WYVERN_OFFENSIVE,
    [JOBS.SCH] = WYVERN_DEFENSIVE,
    --These two might not be right (I'd guess GEO is multi)
    [JOBS.GEO] = WYVERN_OFFENSIVE,
    [JOBS.RUN] = WYVERN_OFFENSIVE
}

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local master = mob:getMaster()
    local wyvernType = wyvernTypes[master:getSubJob()]
    local healingbreath = 624
    if mob:getMainLvl() >= 80 then healingbreath = 623
    elseif mob:getMainLvl() >= 40 then healingbreath = 626
    elseif mob:getMainLvl() >= 20 then healingbreath = 625 end
    if wyvernType == WYVERN_DEFENSIVE then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, target, skillid)
            local party = player:getParty()
            for _,member in ipairs(party) do
                if member:hasStatusEffect(EFFECT_POISON) then
                    player:getPet():useJobAbility(627, member)
                    break
                elseif member:hasStatusEffect(EFFECT_BLINDNESS) and player:getPet():getMainLvl() > 20 then
                    player:getPet():useJobAbility(628, member)
                    break
                elseif member:hasStatusEffect(EFFECT_PARALYSIS) and player:getPet():getMainLvl() > 40 then
                    player:getPet():useJobAbility(629, member)
                    break
                elseif (member:hasStatusEffect(EFFECT_CURSE_I) or member:hasStatusEffect(EFFECT_DOOM)) and player:getPet():getMainLvl() > 60 then
                    player:getPet():useJobAbility(637, member)
                    break
                elseif (member:hasStatusEffect(EFFECT_DISEASE) or member:hasStatusEffect(EFFECT_PLAGUE)) and player:getPet():getMainLvl() > 80 then
                    player:getPet():useJobAbility(638, member)
                    break
                end
            end
        end);
        if (master:getSubJob() ~= JOBS.SMN) then
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
            local diff = math.floor((prev_exp + exp)/200) - math.floor(prev_exp/200)
            if diff ~= 0 then
                -- wyvern levelled up (diff is the number of level ups)
                pet:addMod(MOD_ACC,2*diff)
                pet:addMod(MOD_HPP,5*diff)
                pet:addMod(MOD_ATTP,5*diff)
                pet:setHP(pet:getMaxHP())
                player:messageBasic(562, 0, 0, pet)
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
