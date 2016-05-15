-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  NM:  Mother Globe
-- TODO: Looked like pets had an additional effect: stun with an unknown proc rate
-- TODO: "Links with Slave Globes, and Slave Globes link with Defenders. Defenders do not link with Slave Globes or Mother Globe."
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require( "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" );
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffectEx(EFFECT_SHOCK_SPIKES,0,60,0,0); -- ~60 damage
    -- TODO: Effect can be stolen, giving a THF (Aura Steal) or BLU (Voracious Trunk) a 60 minute shock spikes effect (unknown potency).
    -- If effect is stolen, he will recast it instantly.
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
   -- Keep pets linked

    local MotherGlobe = mob:getID();

    for i = MotherGlobe+1, MotherGlobe+6 do
        if (GetMobAction(i) == 16) then
            GetMobByID(i):updateEnmity(target);
        end
    end

   -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
   -- TODO: Should have a SMN casting effect for ~3-5 seconds while calling.
    if (mob:getBattleTime() % 30 == 0 and mob:getBattleTime() > 3) then
        for i = MotherGlobe+1, MotherGlobe+6 do
            if (GetMobAction(i) == 0) then -- My Orb is deeaaaaaad!
                SpawnMob(i):updateEnmity(target);
                GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1);
                return;
            end
        end
    end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    -- TODO: Additional Effect for ~100 damage (theme suggests enthunder)
    -- Unknown if this can be stolen/dispelled like spikes.  Isn't mentioned, probably not.
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local MotherGlobe = mob:getID();

    mob:setRespawnTime(math.random(10800,21600)); -- respawn 3-6 hrs

    for i = MotherGlobe+1, MotherGlobe+6 do
        if (GetMobAction(i) ~= 0) then
            DespawnMob(i);
        end
    end
end;
