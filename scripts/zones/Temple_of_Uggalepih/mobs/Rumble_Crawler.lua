-----------------------------------
-- Area: Temple Of Uggalepih
-- MOB:  Rumble Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,791,2);
   
   -- Rumble Crawler that spawns in place of Habetrot
   if(mob:getID() == 17428812) then
       GetNPCByID(17428871):hideNPC(900); -- 15min, qm8 in npc_list
   end
end;
