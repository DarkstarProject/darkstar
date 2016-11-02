-----------------------------------
-- Area: Nyzul Isle (Nashmeira's Plea)
--  MOB: Alexander
-----------------------------------
require("scripts/zones/Nyzul_Isle/IDs");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_MOVE, 1);
    -- "Draw in" should only trigger when target is beyond 20' (out of Radiant_Sacrament range)
    mob:setMobMod(MOBMOD_DRAW_IN, 1);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    mob:showText(mob,NyzulIsle.text.SHALL_BE_JUDGED);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- BG Wiki: "He will use this ability at 50% of his HP and several times again as his health decreases."
    -- ffxiclopedia: "Alexander will use this ability as his next TP move once its HP falls below 50%."
    if (mob:getHPP() <= 50 and mob:getTP() >= 1000 and mob:getLocalVar("DivineJudgement") == 0) then
        mob:setLocalVar("DivineJudgement", 1)
        mob:useMobAbility(2147);
    end

    -- ffxiclopedia: "In addition to this, it's possible he'll use it several times again at low (5%?) HP."
    -- Per same wiki, may use Perfect Defense as a regular skill at 10%..Assuming same % for both skills.
    local skill_list = mob:getMobMod(MOBMOD_SKILL_LIST);
    if (mob:getHPP() <= 10 and skill_list == 784) then
        mob:setMobMod(MOBMOD_SKILL_LIST, 785);
    end
end;

-----------------------------------
-- onMonsterPrepareSkill Action
-----------------------------------

function onMonsterPrepareSkill(mob, skillId)
    -- Radiant Sacrament
    if (skillId == 2141) then
        mob:showText(mob,NyzulIsle.text.OFFER_THY_WORSHIP);
    -- Mega Holy
    elseif (skillId == 2142) then
        mob:showText(mob,NyzulIsle.text.OPEN_THINE_EYES);
    -- Perfect Defense
    elseif (skillId == 2143) then
        mob:showText(mob,NyzulIsle.text.CEASE_THY_STRUGGLES);
    -- Divine Spear
    elseif (skillId == 2144) then
        mob:showText(mob,NyzulIsle.text.RELEASE_THY_SELF);
    -- Gospel of the Lost
    elseif (skillId == 2145) then
        mob:showText(mob,NyzulIsle.text.BASK_IN_MY_GLORY);
    -- Void of Repentance
    elseif (skillId == 2146) then
        mob:showText(mob,NyzulIsle.text.REPENT_THY_IRREVERENCE);
    -- Divine Judgement
    elseif (skillId == 2147) then
        mob:showText(mob,NyzulIsle.text.ACCEPT_THY_DESTRUCTION);
        mob:showText(mob,NyzulIsle.text.OMEGA_SPAM);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        mob:showText(mob,NyzulIsle.text.SHALL_KNOW_OBLIVION);
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;
