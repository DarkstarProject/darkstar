-----------------------------------
-- Area: Sealions Den
--  MOB: Omega
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- Gains regain at under 25% HP
    if (mob:getHP() < (mob:getMaxHP() * 0.25)) then
        if (mob:hasStatusEffect(EFFECT_REGAIN) == false) then
            mob:addStatusEffect(EFFECT_REGAIN,5,3,0);
            mob:getStatusEffect(EFFECT_REGAIN):setFlag(32);
        end
    end
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 20;
    local resist = applyResistanceAddEffect(mob,player,ELE_THUNDER,EFFECT_STUN);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 5;
        duration = duration * resist;
        if (player:hasStatusEffect(EFFECT_STUN) == false) then
            player:addStatusEffect(EFFECT_STUN, 0, 0, duration);
        end
        return SUBEFFECT_STUN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_STUN;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(OMEGA_OSTRACIZER);
    player:startEvent(0x000b);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000b) then
        local instance = player:getVar("bcnm_instanceid")

        --Players are healed in between the fights, but their TP is set to 0
        player:setHP(player:getMaxHP());
        player:setMP(player:getMaxMP());
        player:setTP(0);

        if (instance == 1) then
            player:setPos(-779, -103, -80);
                SpawnMob(16908295); --ultima1
        elseif (instance == 2) then
            player:setPos(-140, -23, -440);
            SpawnMob(16908302); --ultima2
        else
                player:setPos(499, 56, -802);
            SpawnMob(16908309); --ultima3
        end
    end
end;