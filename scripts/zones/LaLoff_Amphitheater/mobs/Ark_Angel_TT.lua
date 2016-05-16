-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel TT
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_UFASTCAST, 30);
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_SUB_2HOUR, 1);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   local mobid = mob:getID()

    for member = mobid-5, mobid+2 do
        if (GetMobAction(member) == 16) then
            GetMobByID(member):updateEnmity(target);
        end
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    if (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON) and bit.band(mob:getBehaviour(),BEHAVIOUR_STANDBACK) > 0) then
        mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(BEHAVIOUR_STANDBACK)))
        mob:setMobMod(MOBMOD_TELEPORT_TYPE,0);
        mob:setMobMod(MOBMOD_SPAWN_LEASH,0);
        mob:setSpellList(0);
    end
    if (not mob:hasStatusEffect(EFFECT_BLOOD_WEAPON) and bit.band(mob:getBehaviour(),BEHAVIOUR_STANDBACK) == 0) then
        mob:setBehaviour(bit.bor(mob:getBehaviour(), BEHAVIOUR_STANDBACK))
        mob:setMobMod(MOBMOD_TELEPORT_TYPE,1);
        mob:setMobMod(MOBMOD_SPAWN_LEASH,22);
        mob:setSpellList(39);
    end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
