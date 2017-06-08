-----------------------------------
--  PET: Jug
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
    local master = mob:getMaster();
    if (master:hasStatusEffect(EFFECT_BEAST_ROLL)) then
        master:addPetMod(MOD_ATTP, master:getStatusEffect(EFFECT_BEAST_ROLL):getPower());
    end
    if (master:hasStatusEffect(EFFECT_PUPPET_ROLL)) then
        local effect = master:getStatusEffect(EFFECT_PUPPET_ROLL);
        master:addPetMod(MOD_MATT, effect:getPower());
        master:addPetMod(MOD_MACC, effect:getPower());
    end
end

-----------------------------------
-- onMobDespawn Action
-----------------------------------
function onMobDeath(mob)

end
