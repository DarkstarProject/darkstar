-----------------------------------
-- Area: Carpenters_Landing
--  Mob: Overgrown_Ivy
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if (killer:getCurrentMission(COP) == THE_ROAD_FORKS and killer:getVar("EMERALD_WATERS_Status") == 4) then 
      killer:setVar("EMERALD_WATERS_Status",5);
   end  
end;