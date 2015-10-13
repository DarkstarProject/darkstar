-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder_Euphrosyne
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if (killer:getCurrentMission(COP) == A_PLACE_TO_RETURN and killer:getVar("PromathiaStatus") == 1) then 
      killer:setVar("Warder_Euphrosyne_KILL",1);
   end  
end;