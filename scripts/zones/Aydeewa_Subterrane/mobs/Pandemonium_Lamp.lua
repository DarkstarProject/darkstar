-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Pandemonium_Warden
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobEngaged(mob, target)

end;

function onMobFight(mob,target)
        if(mob:getLocalVar("astralflow") == 0) then
            if(mob:getID()==17056178) then mob:useMobAbility(628);
            elseif(mob:getID()==17056179) then mob:useMobAbility(637); 
            elseif(mob:getID()==17056180) then mob:useMobAbility(601); 
            elseif(mob:getID()==17056181) then mob:useMobAbility(592); 
            elseif(mob:getID()==17056182) then mob:useMobAbility(610);
            elseif(mob:getID()==17056183) then mob:useMobAbility(619);
            elseif(mob:getID()==17056184) then mob:useMobAbility(583);
            elseif(mob:getID()==17056185) then mob:useMobAbility(656);
            end
        elseif(mob:getLocalVar("astralflow") == 1) then
            DespawnMob(mob:getID());
            mob:setLocalVar("astralflow",2);
        end
end;

function onMobDeath(mob,killer)
end;