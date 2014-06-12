-----------------------------------
-- Area: Empyreal Paradox
-- NPC:  Prishe
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("/scripts/zones/Empyreal_Paradox/TextIDs");

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
    local raise, hf, bene = mob:getExtraVar(3);
    if (mob:getHPP() == 0 and raise == 1) then
        mob:entityAnimationPacket("sp00");
        mob:messageText(mob, PRISHE_TEXT + 3);
        mob:addHP(mob:getMaxHP());
        mob:addMP(mob:getMaxMP());
        mob:setExtraVar(0, hf, bene);
        mob:stun(3000);
    elseif (mob:getHPP() < 70 and hf == 0) then
        mob:useMobAbility(1229);
        mob:messageText(mob, PRISHE_TEXT + 6);
        mob:setExtraVar(0, 1, bene);
    elseif (mob:getHPP() < 30 and bene == 0) then
        mob:useMobAbility(1230);
        mob:messageText(mob, PRISHE_TEXT + 7);
        mob:setExtraVar(0, hf, 1);
    end
    -- mob:setStatus(0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    mob:messageText(mob, PRISHE_TEXT + 2);
end;

function OnMobRoam(mob)
    local wait, ready = mob:getExtraVar(2);
    if (wait > 240) then
        local baseID = 16924673 + (mob:getBattlefield():getBattlefieldNumber() - 1) * 2
        if (GetMobAction(baseID) ~= ACTION_NONE) then
            mob:entityAnimationPacket("prov");
            mob:messageText(mob, PRISHE_TEXT);
        else
            mob:entityAnimationPacket("prov");
            mob:messageText(mob, PRISHE_TEXT + 1);
            baseID = baseID + 1;
        end
        mob:setExtraVar(0, bit.band(baseID, 0xFFF));
    elseif (ready > 0) then
        mob:addEnmity(GetMobByID(ready + bit.lshift(mob:getZone(), 12) + 0x1000000),0,1);
        mob:addStatusEffectEx(EFFECT_SILENCE,0,0,0,5)
        mob:setExtraVar(0);
    else
        mob:setExtraVar(wait+3, 0);
    end
end;