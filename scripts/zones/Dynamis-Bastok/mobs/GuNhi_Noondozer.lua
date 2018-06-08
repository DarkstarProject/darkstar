-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Nhi Noondozer
-- Time Extender: 30min
-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("HpTrigger", math.random(40,65));
end;

function onMobFight(mob,target)
    if (mob:getHPP() < mob:getLocalVar("HpTrigger") and mob:getLocalVar("astral_flow") == 0) then
        mob:useMobAbility(1023);
        mob:setLocalVar("astral_flow", 1);
    end
end;

function onMobDeath(mob, player, isKiller)

    if (alreadyReceived(player,4) == false) then
        player:addTimeToDynamis(30);
        addDynamisList(player,8);
    end

end;