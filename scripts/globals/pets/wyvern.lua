-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");

WYVERN_OFFENSIVE = 1
WYVERN_DEFENSIVE = 2
WYVERN_MULTI = 3
local wyvernTypes = {
    [JOB_WAR] = WYVERN_OFFENSIVE,
    [JOB_MNK] = WYVERN_OFFENSIVE,
    [JOB_WHM] = WYVERN_DEFENSIVE,
    [JOB_BLM] = WYVERN_DEFENSIVE,
    [JOB_RDM] = WYVERN_DEFENSIVE,
    [JOB_THF] = WYVERN_OFFENSIVE,
    [JOB_PLD] = WYVERN_MULTI,
    [JOB_DRK] = WYVERN_MULTI,
    [JOB_BST] = WYVERN_OFFENSIVE,
    [JOB_BRD] = WYVERN_MULTI,
    [JOB_RNG] = WYVERN_OFFENSIVE,
    [JOB_SAM] = WYVERN_OFFENSIVE,
    [JOB_NIN] = WYVERN_MULTI,
    [JOB_DRG] = WYVERN_OFFENSIVE,
    [JOB_SMN] = WYVERN_DEFENSIVE,
    [JOB_BLU] = WYVERN_DEFENSIVE,
    [JOB_COR] = WYVERN_OFFENSIVE,
    [JOB_PUP] = WYVERN_OFFENSIVE,
    [JOB_DNC] = WYVERN_OFFENSIVE,
    [JOB_SCH] = WYVERN_DEFENSIVE,
    --These two might not be right (I'd guess GEO is multi)
    [JOB_GEO] = WYVERN_OFFENSIVE,
    [JOB_RUN] = WYVERN_OFFENSIVE
}

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local master = mob:getMaster()
    local wyvernType = wyvernTypes[master:getSubJob()]
    if wyvernType == WYVERN_DEFENSIVE then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, skillid)
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
                elseif (member:hasStatusEffect(EFFECT_CURSE) or member:hasStatusEffect(EFFECT_DOOM)) and player:getPet():getMainLvl() > 60 then
                    player:getPet():useJobAbility(637, member)
                    break
                elseif (member:hasStatusEffect(EFFECT_DISEASE) or member:hasStatusEffect(EFFECT_PLAGUE)) and player:getPet():getMainLvl() > 80 then
                    player:getPet():useJobAbility(638, member)
                    break
                end
            end
        end);
        master:addListener("MAGIC_USE", "PET_WYVERN_HEAL", function(player, spell, action)

        end);
    elseif wyvernType == WYVERN_OFFENSIVE or wyvernType == WYVERN_MULTI then
        master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, skillid)
            -- do elemental breath
        end);
    end
    if wyvernType == WYVERN_MULTI then
        master:addListener("MAGIC_USE", "PET_WYVERN_HEAL", function(player, spell, action)

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
                pet:addMod(MOD_CURE_POTENCY,6*diff)
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
    master:removeListener("PET_WYVERN_HEAL");
    master:removeListener("PET_WYVERN_ENGAGE");
    master:removeListener("PET_WYVERN_DISENGAGE");
    master:removeListener("PET_WYVERN_EXP");
end;
