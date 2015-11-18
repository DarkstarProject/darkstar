-----------------------------------
-- Area: Lower_Delkfutts_tower
--  Mob: Disaster_Idol
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    local DayofWeek = VanadielDayElement();
    
    mob:setSpellList(118 + DayofWeek);
    mob:setLocalVar("Element", DayofWeek+1);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
--TODO: Has level mimic of person who spawned it. Minimum level 65. HP should scale accordingly. 

    local DayofWeek = VanadielDayElement();
    local Element = mob:getLocalVar("Element");
    
    if (DayofWeek + 1 ~= Element) then
        mob:setSpellList(118 + DayofWeek);
        mob:setLocalVar("Element", DayofWeek+1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if (killer:getCurrentMission(COP) == THREE_PATHS and killer:getVar("COP_Tenzen_s_Path") == 6) then 
      killer:setVar("COP_Tenzen_s_Path",7);
   end  
end;