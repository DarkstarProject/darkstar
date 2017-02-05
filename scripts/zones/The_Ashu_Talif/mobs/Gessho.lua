-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
-- MOB: Gessho
-- TOAU-15 Mission Battle
-----------------------------------

local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

require("scripts/globals/allyassist");
require("scripts/globals/instance");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Gessho will engage by himself ~1min in if you stall too long.
    -- Give a little buffer for while the instance loads
    mob:timer(80000, function(mob)
        if(mob:getLocalVar("ready") == 0 and not(mob:getTarget())) then
            startAllyAssist(mob, ALLY_ASSIST_RANDOM);
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Hane Fubuki
        if(skillId == 1998) then
            mob:showText(mob,TheAshuTalif.text.UNNATURAL_CURS);
        -- Hiden Sokyaku
        elseif(skillId == 1999) then
            mob:showText(mob,TheAshuTalif.text.STING_OF_MY_BLADE);
        -- Happobarai
        elseif(skillId == 2001) then
            mob:showText(mob,TheAshuTalif.text.HARNESS_THE_WHIRLWIND);
        -- Rinpyotosha
        elseif(skillId == 2002) then
            mob:showText(mob,TheAshuTalif.text.SWIFT_AS_LIGHTNING);
        end
    );
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    local dialog = mob:getLocalVar("dialog");

    if(dialog == 0) then
        mob:showText(mob,TheAshuTalif.text.BATTLE_HIGH_SEAS);
        mob:setLocalVar("dialog",1);
    end
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local ready = mob:getLocalVar("ready");

    -- When Gessho becomes ready via you pulling, he will assist you
    if (ready == 1) then
        startAllyAssist(mob, ALLY_ASSIST_PLAYER);
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local dialog = mob:getLocalVar("dialog");

    if(mob:getHPP() <= 20 and dialog == 1) then
        mob:showText(mob,TheAshuTalif.text.TIME_IS_NEAR);
        mob:setLocalVar("dialog",2);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    mob:showText(mob,TheAshuTalif.text.SO_I_FALL);
end;
