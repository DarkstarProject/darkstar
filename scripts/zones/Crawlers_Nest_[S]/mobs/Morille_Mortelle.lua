-----------------------------------
-- Area: Crawlers nest [S] (171)
--  NM:  Morille Mortelle
-- !pos 59.788 -0.939 22.316 171
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_DOUBLE_ATTACK, 20);
    mob:setMod(MOD_STORETP, 10);
end;


-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set Window Open Time
    SetServerVariable("[POP]Morille_Mortelle", os.time() + 18000); -- 5 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Morille_Mortelle");
    SetServerVariable("[PH]Morille_Mortelle", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,ELE_WATER,EFFECT_PLAGUE);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(EFFECT_PLAGUE)) then
            player:addStatusEffect(EFFECT_PLAGUE, 1, 0, duration);
        end
        return SUBEFFECT_PLAGUE, msgBasic.ADD_EFFECT_STATUS, EFFECT_PLAGUE;
    end
end;
