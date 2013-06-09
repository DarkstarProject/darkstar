-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Mother Globe
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require( "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" );

-- TODO: Looked like pets had an additional effect: stun with an unknown proc rate
-- TODO: "Links with Slave Globes, and Slave Globes link with Defenders. Defenders do not link with Slave Globes or Mother Globe."

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onMobInitialize(mob)
   mob:setExtraVar(os.time()); -- Need this for onMobRoam

	mob:addStatusEffectEx(EFFECT_SHOCK_SPIKES,0,60,0,0); -- ~60 damage
   -- TODO: Effect can be stolen, giving a THF (Aura Steal) or BLU (Voracious Trunk) a 60 minute shock spikes effect (unknown potency).
   -- TODO: Additional Effect for ~100 damage (theme suggests enthunder)
      -- Unknown if this can be stolen/dispelled like spikes.  Isn't mentioned.  Probably not.
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
   mob:setExtraVar(os.time());
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob, target)
   -- Keep pets linked
   for i = 17506397, 17506402 do
      if (GetMobAction(i) == 16) then
         GetMobByID(i):updateEnmity(target);
      end
   end

   -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
   -- TODO: Should have a SMN casting effect for ~3-5 seconds while calling.
   if (mob:getExtraVar(1) + 30 <= os.time()) then
      for i = 17506397, 17506402 do
         if (GetMobAction(i) == 0) then -- My Orb is deeaaaaaad!
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
            mob:setExtraVar(os.time());
            return;
         end
      end
   end
end

-----------------------------------
-- onMobRoam Action
-----------------------------------
function OnMobRoam(mob)
   local timer = mob:getExtraVar(1);
   local mobid = mob:getID();

   -- Periodically make the chain grow.
   if (timer + 30 <= os.time()) then
      for i = 17506397, 17506402 do
         if (GetMobAction(i) == 0) then
            SpawnMob(i);
            GetMobByID(i):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
            mob:setExtraVar(os.time());
            return;
         end
      end
   end
end

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath( mob, killer )
   for i = 17506397, 17506402 do
      if (GetMobAction(i) ~= 0) then
         DespawnMob(i);
      end
   end
end
