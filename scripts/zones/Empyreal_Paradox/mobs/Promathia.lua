-----------------------------------
-- Area: Empyreal Paradox
--  MOB: Promathia
-----------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
    mob:addMod(MOD_UFASTCAST,50);
end;

function onMobEngaged(mob,target)
    local bcnmAllies = mob:getBattlefield():getAllies();
    for i,v in pairs(bcnmAllies) do
        if (v:getName() == "Prishe") then
            if not v:getTarget() then
                v:entityAnimationPacket("prov");
                v:showText(v, PRISHE_TEXT);
                v:setLocalVar("ready", mob:getID());
            end
        else
            v:addEnmity(mob,0,1);
        end
    end
end;

function onMobFight(mob,target)
    if (mob:AnimationSub() == 3 and not mob:hasStatusEffect(dsp.effects.STUN)) then
        mob:AnimationSub(0);
        mob:stun(1500);
    end

    local bcnmAllies = mob:getBattlefield():getAllies();
    for i,v in pairs(bcnmAllies) do
        if not v:getTarget() then
            v:addEnmity(mob,0,1);
        end
    end

end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 219) then
        spell:setMPCost(1);
    end
end;

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield();
    player:startEvent(32004, battlefield:getBattlefieldNumber());
end;

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,target)
    -- printf("finishCSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 32004) then
        DespawnMob(target:getID());
        mob = SpawnMob(target:getID()+1);
        local bcnmAllies = mob:getBattlefield():getAllies();
        for i,v in pairs(bcnmAllies) do
            v:resetLocalVars();
            local spawn = v:getSpawnPos();
            v:setPos(spawn.x, spawn.y, spawn.z, spawn.rot);
        end
    end

end;