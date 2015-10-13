-----------------------------------
-- Area: Empyreal Paradox
-- NPC:  Prishe
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/zones/Empyreal_Paradox/TextIDs");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 30);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobEngaged(mob, target)
    mob:useMobAbility(1231);
end;

function onMobFight(mob, target)
    if (mob:getHPP() == 0 and mob:getLocalVar("Raise") == 1) then
        mob:entityAnimationPacket("sp00");
        mob:messageText(mob, PRISHE_TEXT + 3);
        mob:addHP(mob:getMaxHP());
        mob:addMP(mob:getMaxMP());
        mob:setLocalVar("Raise", 0);
        mob:stun(3000);
    elseif (mob:getHPP() < 70 and mob:getLocalVar("HF") == 0) then
        mob:useMobAbility(1229);
        mob:messageText(mob, PRISHE_TEXT + 6);
        mob:setLocalVar("HF", 1);
    elseif (mob:getHPP() < 30 and mob:getLocalVar("Bene") == 0) then
        mob:useMobAbility(1230);
        mob:messageText(mob, PRISHE_TEXT + 7);
        mob:setLocalVar("Bene", 1);
    end
    -- mob:setStatus(0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    mob:messageText(mob, PRISHE_TEXT + 2);
end;

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
    if (ready == 0 and wait > 240) then
        local baseID = 16924673 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 2
        if (GetMobAction(baseID) ~= ACTION_NONE) then
            mob:entityAnimationPacket("prov");
            mob:messageText(mob, PRISHE_TEXT);
        else
            mob:entityAnimationPacket("prov");
            mob:messageText(mob, PRISHE_TEXT + 1);
            baseID = baseID + 1;
        end
        mob:setLocalVar("ready", baseID);
        mob:setLocalVar("wait", 0);
    elseif (ready > 0) then
        mob:addEnmity(GetMobByID(ready),0,1);
        mob:addStatusEffectEx(EFFECT_SILENCE,0,0,0,5)
    else
        mob:setLocalVar("wait", wait+3);
    end
end;
