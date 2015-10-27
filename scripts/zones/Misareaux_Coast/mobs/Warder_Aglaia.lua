-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder_Aglaia
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if (killer:getCurrentMission(COP) == A_PLACE_TO_RETURN and killer:getVar("PromathiaStatus") == 1) then 
      killer:setVar("Warder_Aglaia_KILL",1);
   end  
end;