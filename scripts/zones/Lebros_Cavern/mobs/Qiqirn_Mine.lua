-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
-- MOB: Qiqirn Mine
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
require("scripts/globals/allyassist")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
end

function onMobRoam(mob)
    dsp.ally.startAssist(mob, dsp.ally.ASSIST_PLAYER);
end;

function onMobFight(mob,target)
    local instance = mob:getInstance()
    local players = instance:getChars();

    for i,v in pairs(players) do
        if mob:getLocalVar("Time") == 0 then
            v:messageSpecial(ID.text.MINE_COUNTDOWN,10)
            mob:setLocalVar("Time",1)
        elseif mob:getLocalVar("Time") == 1 then
            mob:timer(5000, function(mob) v:messageSpecial(ID.text.MINE_COUNTDOWN,5) end)
            mob:setLocalVar("Time",2)
        elseif mob:getLocalVar("Time") == 2 then
            mob:timer(6000, function(mob) v:messageSpecial(ID.text.MINE_COUNTDOWN,4) end)
            mob:setLocalVar("Time",3)
        elseif mob:getLocalVar("Time") == 3 then
            mob:timer(7000, function(mob) v:messageSpecial(ID.text.MINE_COUNTDOWN,3) end)
            mob:setLocalVar("Time",4)
        elseif mob:getLocalVar("Time") == 4 then
            mob:timer(8000, function(mob) v:messageSpecial(ID.text.MINE_COUNTDOWN,2) end)
            mob:setLocalVar("Time",5)
        elseif mob:getLocalVar("Time") == 5 then
            mob:timer(9000, function(mob) v:messageSpecial(ID.text.MINE_COUNTDOWN,1) end)
            mob:setLocalVar("Time",6)
        elseif mob:getLocalVar("Time") == 6 then
            mob:timer(10000, function(mob) mob:useMobAbility(1838) end)
            mob:setLocalVar("Time",7)
        elseif mob:getLocalVar("Time") == 7 then
            mob:timer(12000, function(mob) mob:setHP(0) end)
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
