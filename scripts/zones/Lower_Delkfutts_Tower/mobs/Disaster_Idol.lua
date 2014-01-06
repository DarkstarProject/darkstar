-----------------------------------
-- Area: Lower_Delkfutts_tower
--  Mob: Disaster_Idol
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if(killer:getCurrentMission(COP) == THREE_PATHS and killer:getVar("COP_Tenzen_s_Path") == 6)then 
      killer:setVar("COP_Tenzen_s_Path",7);
   end  
end;