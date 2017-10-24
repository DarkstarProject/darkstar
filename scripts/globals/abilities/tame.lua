-----------------------------------
-- Ability: Tame
-- Makes target docile and more susceptible to charm.
-- Obtained: Beastmaster Level 30
-- Recast Time: 10:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

    local LV_diff = player:getMainLvl() - target:getMainLvl();
    local base = 0;
        if (LV_diff <= -7) then  -- IT 
            base = 50;
        elseif (LV_diff <= -5 and LV_diff >= -6) then  -- VT
            base = 60;
        elseif (LV_diff <= -1 and LV_diff >= -4) then  -- Tough
            base = 70;
        elseif (LV_diff == 0) then  -- Even Match
            base = 80;
        elseif (LV_diff >= 1 and LV_diff <= 7) then  -- DC / EP
            base = 90;
        elseif (LV_diff >= 7) then  -- Too Weak
            base = 95;
        end

    local INT_diff = player:getStat(MOD_INT) - target:getStat(MOD_INT);
    local tameMod = player:getMod(MOD_TAME);
    local tameChance = base + INT_diff + tameMod;
        if (tameChance > 99) then
            tameChance = 99;
        end

    local charmChance = player:getCharmChance(target, false);
    local pet = player:getPet();
    local CE = target:getCE(player)
    local mob = target:getID();

    local canTame = true;
    local party = player:getParty();
        for i,v in ipairs(party) do
            if (target:getCE(v) > 0) then
                canTame = false;
            end
        end

    if (charmChance > 0 and pet == nil and tameChance >= math.random(0,100)) then
        if (player:getVar("Charmed_Mob") == mob or canTame == true) then
            target:disengage();
            player:setVar("Tamed_Mob",mob);
            player:setVar("Charmed_Mob",0);
        end
    end
end;