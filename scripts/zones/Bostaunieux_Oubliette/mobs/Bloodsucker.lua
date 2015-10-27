-----------------------------------
-- Area: Bostaunieux Oubliette (167)
-- Mob:  Bloodsucker (NM)
-- @pos -21.776 16.983 -231.477 167
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

   checkGoVregime(killer,mob,613,1);

   local mobID = mob:getID();

   if (mobID == 17461478) then
      UpdateNMSpawnPoint(mob);
      mob:setRespawnTime(3600);
   end
end;

