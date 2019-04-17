-----------------------------------
-- Area: Caedarva Mire
--  MOB: Chigoe
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("DEATH", "CHIGOE_DEATH", function(entity, damage, attacker, attackType, damageType)
        if(entity:getLocalVar("isAutoKill") == 1) then
            entity:removeOwner()
        end
    end)
end



function onWeaponskillHit(mob, attacker, ws)
    mob:setLocalVar("isAutoKill", 1)
    mob:setHP(0)
end


function onCriticalHit(mob)
    mob:setLocalVar("isAutoKill", 1)
    mob:setHP(0)
end