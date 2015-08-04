-----------------------------------
-- Area: The Celestial Nexus
-- NPC:  Exoplates
-- Zilart Mission 16 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0);
    mob:SetAutoAttackEnabled(false);
    mob:setUnkillable(true);
end;

function onMobFight(mob, target)
    local shifts = mob:getLocalVar("shifts");
    local shiftTime = mob:getLocalVar("shiftTime");
    
    if (mob:AnimationSub() == 0 and shifts == 0 and mob:getHPP() <= 67) then
        mob:useMobAbility(737);
        mob:setLocalVar("shifts", shifts+1);
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5);
    elseif (mob:AnimationSub() == 1 and shifts <= 1 and mob:getHPP() <= 33) then
        mob:useMobAbility(741);
        mob:setLocalVar("shifts", shifts+1);
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5);
    elseif (mob:AnimationSub() == 2 and shifts <= 2 and mob:getHPP() <= 2) then
        mob:useMobAbility(745);
        mob:setLocalVar("shifts", shifts+1);
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5);
    elseif (mob:getHPP() <= 67 and mob:AnimationSub() == 0 and mob:getBattleTime() >= shiftTime ) then
        mob:AnimationSub(1);
    elseif (mob:getHPP() <= 33 and mob:AnimationSub() == 1 and mob:getBattleTime() >= shiftTime) then
        mob:AnimationSub(2);
    end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local eald_narche = GetMobByID(mob:getID() - 1);
    eald_narche:delStatusEffect(EFFECT_PHYSICAL_SHIELD, 0, 1, 0, 0);
    eald_narche:delStatusEffect(EFFECT_ARROW_SHIELD, 0, 1, 0, 0);
    eald_narche:delStatusEffect(EFFECT_MAGIC_SHIELD, 0, 1, 0, 0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
--printf("finishCSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x7d04) then
        DespawnMob(target:getID());
        DespawnMob(target:getID()-1);
        DespawnMob(target:getID()+2);
        DespawnMob(target:getID()+3);
		mob = SpawnMob(target:getID()+1);
		mob:updateEnmity(player);
        --the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
        mob:addStatusEffectEx(EFFECT_BIND, 0, 1, 0, 30);
        mob:addStatusEffectEx(EFFECT_SILENCE, 0, 1, 0, 40);
	end

end;