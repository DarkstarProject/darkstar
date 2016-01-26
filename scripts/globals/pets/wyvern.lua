-----------------------------------
--  PET: Wyvern
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local master = mob:getMaster()
    master:addListener("WEAPONSKILL_USE", "PET_WYVERN_WS", function(player, skillid)
    end);

    master:addListener("MAGIC_USE", "PET_WYVERN_HEAL", function(player, spell, action)
    end);

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
                pet:addMod(MOD_CURE_POTENCY,6*diff)
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
    master:removeListener("PET_WYVERN_HEAL");
    master:removeListener("PET_WYVERN_ENGAGE");
    master:removeListener("PET_WYVERN_DISENGAGE");
    master:removeListener("PET_WYVERN_EXP");
end;
