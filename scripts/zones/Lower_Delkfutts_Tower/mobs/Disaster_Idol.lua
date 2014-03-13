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
    
    if (DayofWeek == 0) then
        mob:setSpellList(118);
        mob:setExtraVar(1);
    elseif (DayofWeek == 1) then
        mob:setSpellList(119);
        mob:setExtraVar(2);
    elseif (DayofWeek == 2) then
        mob:setSpellList(120);
        mob:setExtraVar(3);
    elseif (DayofWeek == 3) then
        mob:setSpellList(121);
        mob:setExtraVar(4);
    elseif (DayofWeek == 4) then
        mob:setSpellList(122);
        mob:setExtraVar(5);
    elseif (DayofWeek == 5) then
        mob:setSpellList(123);
        mob:setExtraVar(6);
    elseif (DayofWeek == 6) then
        mob:setSpellList(124);
        mob:setExtraVar(7);
    elseif (DayofWeek == 7) then
        mob:setSpellList(125);
        mob:setExtraVar(8);
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
--TODO: Has level mimic of person who spawned it. Minimum level 65. HP should scale accordingly. 

    local DayofWeek = VanadielDayElement();
    local ExtraVar = mob:getExtraVar(1);
    
    if (DayofWeek == 0) then
        if(ExtraVar ~= 1) then
            mob:setExtraVar(1);
            mob:setSpellList(118);
        end
    elseif (DayofWeek == 1) then
        if(ExtraVar ~= 2) then
            mob:setExtraVar(2);   
            mob:setSpellList(119);
        end
    elseif (DayofWeek == 2) then
        if(ExtraVar ~= 3) then
            mob:setExtraVar(3);    
            mob:setSpellList(120);
        end
    elseif (DayofWeek == 3) then
        if(ExtraVar ~= 4) then
            mob:setExtraVar(4);   
            mob:setSpellList(121);
        end
    elseif (DayofWeek == 4) then
        if(ExtraVar ~= 5) then
            mob:setExtraVar(5);   
            mob:setSpellList(122);
        end
    elseif (DayofWeek == 5) then
        if(ExtraVar ~= 6) then
            mob:setExtraVar(6);    
            mob:setSpellList(123);
        end
    elseif (DayofWeek == 6) then
        if(ExtraVar ~= 7) then
            mob:setExtraVar(7);    
            mob:setSpellList(124);
        end
    elseif (DayofWeek == 7) then
        if(ExtraVar ~= 8) then
            mob:setExtraVar(8);   
            mob:setSpellList(125);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   if(killer:getCurrentMission(COP) == THREE_PATHS and killer:getVar("COP_Tenzen_s_Path") == 6)then 
      killer:setVar("COP_Tenzen_s_Path",7);
   end  
end;