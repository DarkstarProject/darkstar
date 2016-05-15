-----------------------------------
-- Area: Konschtat Highlands
--  NM:  Ghillie Dhu
-----------------------------------

require("scripts/globals/utils");
require("scripts/globals/status");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- For its TP drain melee.
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());

    -- Hits especially hard for his level, even by NM standards.
    mob:addMod(MOD_ATT, 50); -- May need adjustment along with cmbDmgMult in mob_pools.sql
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob)
    -- Fairly sure he shouldn't be storing up max TP while idle.
    if (mob:getMod(MOD_REGAIN) ~= 0) then
        mob:setMod(MOD_REGAIN,0);
    end
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    -- Guesstimating the regain scales from 1-100,
    -- nobody has the excact values but it scales with HP.
    local TP = ((100 - mob:getHPP())*0.5)
    if (mob:getMod(MOD_REGAIN) ~= utils.clamp(TP,1,100)) then
        mob:setMod(MOD_REGAIN,utils.clamp(TP,1,100));
    end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    -- wiki just says "29%" so thats what I am using (for now).
    local CHANCE = 29;
    if (CHANCE > math.random(0,99)) then
        local DRAIN = math.random(10,30); -- Its a pretty weaksauce drain.
        target:delTP(DRAIN);
        return SUBEFFECT_TP_DRAIN, MSGBASIC_ADD_EFFECT_TP_DRAIN, DRAIN;
    else
        return 0,0,0;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- I think he still counts for the FoV page? Most NM's do not though.
    checkRegime(player,mob,81,1);

    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- 60~70 min repop.
end;