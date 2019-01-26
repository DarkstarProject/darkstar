-----------------------------------
-- Area: Empyreal Paradox
--  MOB: Selh'teus
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
local ID = require("scripts/zones/Empyreal_Paradox/IDs");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50);
    mob:SetAutoAttackEnabled(false);
end;

function onMobFight(mob, target)
    if (target:getTarget():getID() ~= mob:getID()) then
        local targetPos = target:getPos();
        local radians = (256 - targetPos.rot) * (math.pi / 128);
        mob:pathTo(targetPos.x + math.cos(radians) * 16, targetPos.y, targetPos.z + math.sin(radians) * 16);
    end
    local lanceTime = mob:getLocalVar("lanceTime");
    local lanceOut = mob:getLocalVar("lanceOut");
    local rejuv = mob:getLocalVar("rejuv");
    if (mob:getHPP() < 30 and rejuv == 0 and target:getFamily() == 478) then
        mob:messageText(mob, ID.text.SELHTEUS_TEXT + 2);
        mob:useMobAbility(1509);
        mob:setLocalVar("rejuv", 1);
    elseif lanceTime + 50 < mob:getBattleTime() and lanceOut == 0 then
        mob:entityAnimationPacket("sp00");
        mob:setLocalVar("lanceOut", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
    mob:messageText(mob, ID.text.SELHTEUS_TEXT);
    mob:getBattlefield():lose();
end;
