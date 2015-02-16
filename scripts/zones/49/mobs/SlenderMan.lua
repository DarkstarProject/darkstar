-----------------------------------
-- Area: Multiple - randomly chooses zone to pop at.
--  NM:  SlenderMan
-- Randomly camps players who see/hear him.
-- May appear in:
-- Al Zahbi (Besieged - Undead Swarm),
-- Jugner Forest, Jugner Forest [S],
-- Wajaom Woodlands, Bhaflau Thickets
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMobMod(MOBMOD_AUTO_SPIKES,mob:getShortID());
    mob:addStatusEffect(EFFECT_DAMAGE_SPIKES,5,0,0);
    mob:getStatusEffect(EFFECT_DAMAGE_SPIKES):setFlag(32);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_REGEN, 40);
    mob:setMod(MOD_REFRESH, 3);
    mob:setMod(MOD_REGAIN, 20);
    mob:setMod(MOD_UFASTCAST, 80);
    mob:addMod(MOD_HUMANOID_KILLER, 11);
    mob:addMod(MOD_MATT, 20);
    mob:addMod(MOD_MACC, 100);
    mob:addMod(MOD_INT, 20);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    mob:SpoofChatParty("I'll swallow your soul!", MESSAGE_SAY)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local Slendy_2hr_Used = mob:getLocalVar("Slendy_2hr");
    -- local Proxies_Called = mob:getLocalVar("GetMyMinions");

    if (mob:getHPP() < 5 and Slendy_2hr_Used == 3) then
        mob:useMobAbility(475); -- Do Mijin Gakure!
        mob:setLocalVar("Slendy_2hr", 0);
        mob:setHP(0); -- Auto Die
    elseif (mob:getHPP() < 5 and Slendy_2hr_Used == 2) then
        mob:SpoofChatParty("You can't kill me!", MESSAGE_SAY);
        mob:useMobAbility(475); -- Do Mijin Gakure!
        mob:setLocalVar("Slendy_2hr", 3);
    elseif (mob:getHPP() <= 25 and Slendy_2hr_Used == 1) then
        mob:useMobAbility(437); -- Do Perfect Dodge!
        mob:setLocalVar("Slendy_2hr", 2);
    elseif (mob:getHPP() <= 50 and Slendy_2hr_Used == 0) then
        mob:useMobAbility(439); -- Do Blood Weapon!
        mob:setLocalVar("Slendy_2hr", 1);
    -- elseif (mob:getBattleTime() - Proxies_Called > 20) then
        -- if ( zombaru_1 not up ) then
            -- spawn new zombaru_1
        -- end
        -- if ( zombaru_2 not up ) then
            -- spawn new zombaru_2
        -- end
        -- mob:setLocalVar("GetMyMinions", os.time())
    end

    -- if ( my target changed or mob:getLocalVar("I_WAS_NUKED") == 1) then
        -- Do AoE Knockback and Bind
        -- Do single Target Draw In
    -- end
end;

-----------------------------------
-- onMagicHit
-----------------------------------

-- function onMagicHit(caster, target, spell)
    --if (caster:isPC() == true and target:isMOB() == true) then
        -- if ( caster is not my target and is prohibited spell ) then
            -- I was nuked!
            -- target:setLocalVar("I_WAS_NUKED", 1);
            -- instant cast strong nuke at caster
        -- end
    -- end
    -- return spell;
-- end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    -- mob:SpoofChatParty("victory message here", MESSAGE_SAY)
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    local RAND = math.random(0,99);
    -- target:PrintToPlayer(string.format(" '%u' ", RAND));
    if (RAND >= 33) then
        return 0,0,0;
    else
        local dmg = damage * 0.34;
        local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20);
        end
        INT_diff = INT_diff * 0.25;
        dmg = dmg + INT_diff;
        dmg = utils.clamp(dmg, 5, 66);
        return SUBEFFECT_FIRE_DAMAGE,163,dmg;
    end
end;

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    local RAND = math.random(0,99);
    -- target:PrintToPlayer(string.format(" '%u' ", RAND));
    if (RAND >= 33) then
        return 0,0,0;
    else
        local duration = 5;
        target:addStatusEffect(EFFECT_TERROR,1,0,duration);
        return SUBEFFECT_CURSE_SPIKES,0,EFFECT_TERROR;
    end
end;